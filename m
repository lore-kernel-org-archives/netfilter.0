From: Rasmus Reinholdt Nielsen <rasmus@narani.dk>
Subject: modprobe: Can't locate module ip_tables
Date: Sun, 23 Jun 2002 20:55:13 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <5.1.0.14.2.20020623204454.029b4580@linda>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Hi

I have just rekompiled my kernel and iptables. Now when I try to make 
iptables -L I just get the following messege.

modprobe: Can't locate module ip_tables
iptables v1.2.7: can't initialize iptables table `filter': Table does not 
exist (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.

Having looked at the archievs I found that I need to recompile iptables, 
but when making iptables -L it says iptables v1.2.7, the one that I have 
just installed. I have kompiled iptables and all modules into the kernel 
and not as modules.

It's proberbly just me who don't know have to rekompile iptables proberbly, 
so a hint in that direction would be appriciated. I have run 'make all 
install' after recompiling and installing the kernel.

Any ideas would be very wellcome.

Thanks

Rasmus


