
thread control block tcb
    queue its on run/mutex/cond/exception
    state run/ready/mutex/cond/exception
    stack base
    stack size
    start arg
    exit_status
    regs
    flags (free stack
    thread alloc
        errno
        float


mutex
    queue of waiting thread
    owner
    flags (recursive, head on line)

mutex_lock()
    { l = kern_lock();
      if (owner)
        if (owner == me) {
            recurse++
            kern_unlock()
        } else {
            state = mutex;
            queue(self, mutex)
            prio_bump(owner)
            kern_unlock(l)
            kern_resched();
        }
      } else {
        owner = me;
        kern_unlock(l)
      }
      checks;
    }

int kthread_mutex_unlock()
    if (recurse > 0)
        recurse--;
        return
    kern_lock_lock()
    if (q = mutex.queue != NULL)
        owner = q
        kern_state_change(ready, q, readyq)
    kern_lock_unlock()
    
cond
    queue for waiters
    flags (interrupt ok)
      
kern_queue_change(state, tcb, q)
{
    tcb->state = state
    queue(q, tcb->queue)
}

cond_wait()
{
    l = kern_lock();
    if (q = mutex.queue) {
      mutex.owner = q
      kern_state_change(ready, q, readyq)
    }
    state = cond;
    queue(self, cond)
    kern_unlock(l)
    kern_resched();
    // will own mutex
    checks;
}

cond_signal()
{
    l = kern_lock();
    if (q = cond.queue) {
      if (mutex.owner)
        kern_state_change(mutex, q, mutex);)
      } else {
        mutex.owner = q
        kern_state_change(ready, q, readyq)
        resched = true;
      }
    }
    kern_unlock(l)
    if resched
      kern_resched()
}

kern_isr_wait
isr_cond

kern_do_work()
    if workq
        workq.func
isr_cond_signal
{
    kern_workq(isr_cond)
}

kthread_rwlock_unlock()
{
    if (--cnt == 0)
        mode = 0;
        broadcast waiters
}

kthread_rwlock_rdlock()
{
    if mode == open or read
      mode = read;
      cnt++
    else
        wait
}

kthread_rwlock_wrlock
{
    while mode != open
        wait
    mode = write
}

kern_isr_enter(isrint_t )
{
    move stack to isr stack
    save volatile regs.
    isrhandler[isrint].handler, isrhandler[isrint].isr_arg]);
    if (work) {
        do_work
    }
    
    if (resched) {
        save nonvolatile regs;
        resched();
    } else {
        restore volatile regs;
        return from interrupt
    }
}

kern_work_t
kern_workattr_t  callback(work, arg)
kern_work_init(kern_work_t *, kern_workaddr_t *)
kern_work_destroy(kern_work_t *)
kern_work_wait(kern_work_t *, overruncnt *)
kern_work_signal(kern_work_t *)
{
    if onqueue(work)
        overruncnt++
    else
        queueadd(work)
}
        
kern_lock_t
kern_lockattr_t
kern_lock_init(kern_lock_t *, kern_lockattr_t *)
kern_lock_destroy(kern_lock_t *)
kern_lock_lock(kern_lock_t *)
kern_lock_unlock(kern_lock_t *)

exception
    queue for owner
    signal
    exception frame
    regs at exception

thread_create_hook
    add thead alloc stuff
    fill stack

thread_switch_hook
    float
    check_stack

thread_delete_hook

how does join work
    like an exception but goes to join state
    join looks for state change to join on thead_change_hook

thread_exit
    if someone waiting to join
        wait in join state
    free stack

kern_queue_self(state, queue to wait on)

Startup
    first thread creates a tcb on the stack and creates everything
    it starts the main process, 


