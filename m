From: Scott Gaertner <scott@caffeinemediainc.com>
Subject: iptables 'make' killed my box
Date: Mon, 25 Aug 2003 14:18:19 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <812338CA-D728-11D7-B488-000393DB0944@caffeinemediainc.com>
Mime-Version: 1.0 (Apple Message framework v552)
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

I tried to build iptables 1.2.8 today, and failed miserably.  My system 
is Debian Linux - 2.4.18-c3 kernel, i686.

I downloaded the package, entered the directory, typed "make 
KERNEL_DIR=/usr/src/kernel-source-2.4.18/", and after a listing of 
found extensions, I lost connection to the box.  (Complete transcript 
at end of message).  I can no longer even ping any address on that 
network. (The machine was acting as a router as well).

I am trying to get physical access to the machine, and when (if) I get 
it, my time there will be extremely limited.  I would *greatly* 
appreciate any suggestions along the following lines --

- Could the 'make' command alone have killed my box, or must it have 
been a coincidence?

- If it was iptables, can anyone give me a hint as to how to reverse 
the effects as efficiently and quickly as possible?

- Alternatively, is this normal behavior, and do I just need to 
complete the install and open up traffic?

Any help would be appreciated -- I was acting quickly to block an 
influx of spam, and my actions have affected a lot of people.

Thank you in advance,

-Scott Gaertner
  scott@caffeinemediainc.com
  917-495-4276


% /usr/src# bzip2 -d iptables-1.2.8.tar.bz2
% /usr/src# tar -xf iptables-1.2.8.tar
% /usr/src# cd iptables-1.2.8
% /usr/src/iptables-1.2.8# make 
KERNEL_DIR=/usr/src/kernel-source-2.4.18/
Making dependencies: please wait...
Extensions found:
cc -O2 -Wall -Wunused -I/usr/src/kernel-source-2.4.18//include 
-Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o 
extensions/libipt_ah_sh.o -c extensions/libipt_ah.c
ld -shared -o extensions/libipt_ah.so extensions/libipt_ah_sh.o
cc -O2 -Wall -Wunused -I/usr/src/kernel-source-2.4.18//include 
-Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o 
extensions/libipt_conntrack_sh.o -c extensions/libipt_conntrack.c
ld -shared -o extensions/libipt_conntrack.so 
extensions/libipt_conntrack_sh.o
cc -O2 -Wall -Wunused -I/usr/src/kernel-source-2.4.18//include 
-Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o 
extensions/libipt_dscp_sh.o -c extensions/libipt_dscp.c
extensions/libipt_dscp_helper.c:69: warning: `dscp_to_name' defined but 
not used
ld -shared -o extensions/libipt_dscp.so extensions/libipt_dscp_sh.o
cc -O2 -Wall -Wunused -I/usr/src/kernel-source-2.4.18//include 
-Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o 
extensions/libipt_ecn_sh.o -c extensions/libipt_ecn.c
ld -shared -o extensions/libipt_ecn.so extensions/libipt_ecn_sh.o
cc -O2 -Wall -Wunused -I/usr/src/kernel-source-2.4.18//include 
-Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o 
extensions/libipt_esp_sh.o -c extensions/libipt_esp.c
ld -shared -o extensions/libipt_esp.so extensions/libipt_esp_sh.o
cc -O2 -Wall -Wunused -I/usr/src/kernel-source-2.4.18//include 
-Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o 
extensions/libipt_helper_sh.o -c extensions/libipt_helper.c
ld -shared -o extensions/libipt_helper.so extensions/libipt_helper_sh.o
cc -O2 -Wall -Wunused -I/usr/src/kernel-source-2.4.18//include 
-Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o 
extensions/libipt_icmp_sh.o -c extensions/libipt_icmp.c
ld -shared -o extensions/libipt_icmp.so extensions/libipt_icmp_sh.o
cc -O2 -Wall -Wunused -I/usr/src/kernel-source-2.4.18//include 
-Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o 
extensions/libipt_iplimit_sh.o -c extensions/libipt_iplimit.c
ld -shared -o extensions/libipt_iplimit.so 
extensions/libipt_iplimit_sh.o
cc -O2 -Wall -Wunused -I/usr/src/kernel-source-2.4.18//include 
-Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o 
extensions/libipt_length_sh.o -c extensions/libipt_length.c
ld -shared -o extensions/libipt_length.so extensions/libipt_length_sh.o
cc -O2 -Wall -Wunused -I/usr/src/kernel-source-2.4.18//include 
-Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o 
extensions/libipt_limit_sh.o -c extensions/libipt_limit.c
ld -shared -o extensions/libipt_limit.so extensions/libipt_limit_sh.o
cc -O2 -Wall -Wunused -I/usr/src/kernel-source-2.4.18//include 
-Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o 
extensions/libipt_mac_sh.o -c extensions/libipt_mac.c
ld -shared -o extensions/libipt_mac.so extensions/libipt_mac_sh.o
cc -O2 -Wall -Wunused -I/usr/src/kernel-source-2.4.18//include 
-Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o 
extensions/libipt_mark_sh.o -c extensions/libipt_mark.c
ld -shared -o extensions/libipt_mark.so extensions/libipt_mark_sh.o
cc -O2 -Wall -Wunused -I/usr/src/kernel-source-2.4.18//include 
-Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o 
extensions/libipt_multiport_sh.o -c extensions/libipt_multiport.c
ld -shared -o extensions/libipt_multiport.so 
extensions/libipt_multiport_sh.o
cc -O2 -Wall -Wunused -I/usr/src/kernel-source-2.4.18//include 
-Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o 
extensions/libipt_owner_sh.o -c extensions/libipt_owner.c
ld -shared -o extensions/libipt_owner.so extensions/libipt_owner_sh.o
cc -O2 -Wall -Wunused -I/usr/src/kernel-source-2.4.18//include 
-Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o 
extensions/libipt_physdev_sh.o -c extensions/libipt_physdev.c
ld -shared -o extensions/libipt_physdev.so 
extensions/libipt_physdev_sh.o
cc -O2 -Wall -Wunused -I/usr/src/kernel-source-2.4.18//include 
-Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o 
extensions/libipt_pkttype_sh.o -c extensions/libipt_pkttype.c
ld -shared -o extensions/libipt_pkttype.so 
extensions/libipt_pkttype_sh.o
cc -O2 -Wall -Wunused -I/usr/src/kernel-source-2.4.18//include 
-Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o 
extensions/libipt_rpc_sh.o -c extensions/libipt_rpc.c
ld -shared -o extensions/libipt_rpc.so extensions/libipt_rpc_sh.o
cc -O2 -Wall -Wunused -I/usr/src/kernel-source-2.4.18//include 
-Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o 
extensions/libipt_standard_sh.o -c extensions/libipt_standard.c


