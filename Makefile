all:
	make -C dev9_dma all
	make -C eedebug all
	make -C intrelay DEV9_SUPPORT=no RPC_IRQ_SUPPORT=no all
	make -C intrelay DEV9_SUPPORT=no RPC_IRQ_SUPPORT=yes all
	make -C intrelay DEV9_SUPPORT=yes RPC_IRQ_SUPPORT=no all
	make -C intrelay DEV9_SUPPORT=yes RPC_IRQ_SUPPORT=yes all
	make -C pata_ps2 all
	make -C smaprpc all

clean:
	make -C dev9_dma clean
	make -C eedebug clean
	make -C intrelay DEV9_SUPPORT=no RPC_IRQ_SUPPORT=no clean
	make -C intrelay DEV9_SUPPORT=no RPC_IRQ_SUPPORT=yes clean
	make -C intrelay DEV9_SUPPORT=yes RPC_IRQ_SUPPORT=no clean
	make -C intrelay DEV9_SUPPORT=yes RPC_IRQ_SUPPORT=yes clean
	make -C pata_ps2 clean
	make -C smaprpc clean
	rm -f compiled_irx/*.irx

install:
	cp dev9_dma/bin/dev9_dma.irx		compiled_irx/
	cp eedebug/bin/eedebug.irx		compiled_irx/
	cp intrelay/bin/intrelay-dev9.irx	compiled_irx/
	cp intrelay/bin/intrelay-dev9-rpc.irx	compiled_irx/
	cp intrelay/bin/intrelay-direct.irx	compiled_irx/
	cp intrelay/bin/intrelay-direct-rpc.irx	compiled_irx/
	cp pata_ps2/bin/pata_ps2.irx		compiled_irx/
	cp smaprpc/bin/smaprpc.irx		compiled_irx/
	cp compiled_irx/*.irx			../linux/firmware/ps2/
	cp compiled_irx/ps2sdk/*.irx		../linux/firmware/ps2/

