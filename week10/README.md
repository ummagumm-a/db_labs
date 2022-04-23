## Part 1
They don't show the same information. The difference in Alice's username.
The reason is that T2 changed Alice's username, but didn't commit it yet. 
The update is visible in T2's display, but not in T1's.
Situation is the same for both READ COMMITTED and REPEATABLE READ.
For display to be the same in T1 and T2 we need to set READ UNCOMMITTED isolation level,
which is impossible in postgresql.

After I write 'commit;' in T2, changes become visible in T1 (for read committed isolation level); and still not visible for repeatable read isolation level. Reason for that is that in read committed all committed changes become visible right away, and in repeatable read all consequet reads of the same rows will give the same result whether we commit changes in other sessions or not.

Step 7: for read committed no problems, but with repeatable read it gives an error. The reason is that otherwise the durability principle would be violated. In T2 we commit changes to Alice's row. Then, in T1 we try to change balance in Alice's row where username is the old one. So if we'd try to commit changes in balance, the old username will return to the table, so changes made by T2 would be ignored.

After trying to change Alice's balance in T2, the process freezes. The reason is lock.
When T1 tries to change Alice's balance, it sets the lock on the corresponding row
until transaction commits or is aborted.

Indeed, after I commit changes in T1, T2 is unfreezed and the balance (already updated in T1)
is updated again.

## Part 2
If commits are in the end, there will be no changes for both isolation levels. The movement of Bob to the second group is not visible too because dirty reads are not allowed in postgres. So I make a commit after movement of Bob to the 2 group in T2.

For read committed: the output of two commands 'Read accounts with group_id=2 (T1).' is different. This problem is called phantom read - the result set grows because we added Bob to group 2 in T2.

For repeatable read: the output of two commands 'Read accounts with group_id=2 (T1).' is the same because repeatable read solves the phantom read problem. The command 'Update selected accounts balances by +15 (T1)' will change only rows that are visible to T1, i.e. the Bob's row will not be changed.
