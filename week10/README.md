-- They don't show the same information. The difference in Alice's username.
-- The reason is that T2 changed Alice's username, but didn't commit it yet. 
-- The update is visible in T2's display, but not in T1's.
-- Situation is the same for both READ COMMITTED and REPEATABLE READ.
-- For display to be the same in T1 and T2 we need to set READ UNCOMMITTED isolation level,
-- which is impossible in postgresql.

-- After I write 'commit;' in T2, changes become visible in T1;

-- After trying to change Alice's balance in T2, the process freezes. The reason is lock.
-- When T1 tries to change Alice's balance, it sets the lock on the corresponding row
-- until transaction commits or is aborted.

-- Indeed, after I commit changes in T1, T2 is unfreezed and the balance (already updated in T1)
-- is updated again.