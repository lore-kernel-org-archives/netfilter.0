From: Saifuddin <saif@odysseytec.com>
Subject: how to export a symbol from kernel to be accessible in module.
Date: Mon, 26 Apr 2004 12:53:13 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040426125313.3e52dfd9.saif@odysseytec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Hello everyone,
	
Linux kernel version 2.4.24

	ipc/shm.c
		
	static struct ipc_ids shm_ids; 

		I want to access this variable in other kernel modules.
	for this a macro is defined in ipc/shm.c

	#define shm_get(id)     ((struct shmid_kernel *)ipc_get(&shm_ids,id));

	
	for this I have written a function in ipc/shm.c as below: -

	void *sys_getshmhandler(int id){
 	       return (void *)shm_get(id);
	}

	EXPORT_SYMBOL(sys_getshmhandler);

	ipc/Makefile

	export-objs := shm.o.

	The kernel compiles successfully, but when I boot the fresh kernel, I do not get the exported symbol in /proc/ksysm.

	What am I missing?
	Can anybody figure out?

	Thanks in advance.

-- 
Regards,
Saifuddin,
saif@odysseytec.com.
saifuddin_it@yahoo.co.in.

