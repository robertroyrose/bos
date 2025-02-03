
int arch_ctx_setup(stack, stacksize, tcb)
{
}

int arch_ctx_save(tcb)
{
}

int arch_ctx_load(tcb)
{
}

int kern_isr_attach(kern_israttr_t)
{
}

int kern_isr_handle()
{
}

void kern_switch_tcb(self, tcb)
{
	if (arch_ctx_save(self) == 0) {
		arch_ctx_load(tcb);
	}
}
