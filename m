From: Juergen Stohr <juergen.stohr@lpr.e-technik.tu-muenchen.de>
Subject: bug? blocked packets get shadowed to internal network
Date: Thu, 14 Aug 2003 13:39:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030814133901.B23470@rcs.ei.tum.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi to all,

we are using a firewall with RedHat kernel 2.4.20-19.7. The firewall is
configured to block every packet with DPT 199 into our network. When doing
a "telnet server.in.our.network 199" from outside, the firewall correctly
drops that packet, logging

IN=eth1 OUT=eth0 SRC=xxx.xxx.11.231 DST=xxx.xxx.151.184 LEN=44 TOS=0x00 PREC=0x0
0 TTL=252 ID=12615 DF PROTO=TCP SPT=34869 DPT=199 WINDOW=8760 RES=0x00 SYN URGP=
0

to syslog. The external interface is eth1, internal is eth0.
However, at the same time, the firewall generates a packet which is droped
by the output chain of the firewall. It fakes the SRC and DST and wants to send
that packet to the internal server:

IN= OUT=eth0 SRC=xxx.xxx.151.184 DST=xxx.xxx.11.231 LEN=40 TOS=0x00 PREC=0x00 TT
L=255 ID=0 DF PROTO=TCP SPT=199 DPT=34869 WINDOW=0 RES=0x00 ACK RST URGP=0

When setting the output chain to accept policy, the above packet is delivered
to xxx.xxx.151.184!

How can we prohibit those packets to be generated? Kernel RH 2.4.18-x didn't
show that behaviour.

regards,
        juergen


