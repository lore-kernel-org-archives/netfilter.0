From: Guilherme Cesar Soares Ruppert <ruppert@las.ic.unicamp.br>
Subject: HELP! How can I intercept UDP packets silently???
Date: Sat, 22 Jan 2005 02:47:48 -0200 (BRST)
Message-ID: <Pine.LNX.4.61.0501220227290.20049@quasar.las.ic.unicamp.br>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hi everyone, please I need some help!!

I'm developing a program that needs to intercept an UDP traffic generated 
locally by another application. It's like a tunnel. My program will 
intercept the outgoing packets from the application (in the same 
machine) and will send to a tcp tunnel.

I am using Libipq to do that, but I have a BIG problem. I need to DROP 
the packet because I don't want these UDP packets to be sent over the 
network. So I used:
ipq_set_verdict(handle, m->packet_id, NF_DROP, 0, NULL);

But the problem is that when I drop the packet, the application that 
generated the packet remains blocked in sendto() until the packet is 
accepted. How could I drop a packet silently, without blocking the 
application?

The same happens with NFS. For example:
$ iptables -A OUTPUT -p udp -j DROP
$ /etc/init.d/nfs start
Starting NFS services:                                     [  OK  ]
Starting NFS quotas: Cannot register service: RPC: Unable to send; errno = 
Operation not permitted
rpc.rquotad: unable to register (RQUOTAPROG, RQUOTAVERS, udp).
                                                            [FAILED]
Starting NFS daemon:                                       [FAILED]
Starting NFS mountd: Cannot register service: RPC: Unable to send; errno = 
Operation not permitted
                                                            [FAILED]


How can I intercept outgoing packets locally without let the applications 
know about it?

Thanks

Guilherme Ruppert

