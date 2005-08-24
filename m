From: =?ISO-8859-1?Q?Antonio_P=E9rez?= <aperlu@telefonica.net>
Subject: layer7 problem
Date: Wed, 24 Aug 2005 02:54:48 +0200
Message-ID: <430BC558.8000406@telefonica.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 'iptables' <netfilter@lists.netfilter.org>

Hello,
I want to use layer7 in my linux box. I have the 2.6.12.5 kerner version 
and the 1.3.3 iptables version. I patched the kernel and the iptables 
with kernel-2.6.11-layer7-1.4.patch, linux-2.6.9-imq1.diff, 
iptables-1.3.0-imq1.diff and iptables-layer7-1.4.patch.
When i run:
iptables -t mangle -A POSTROUTING -m layer7 --l7proto http -j MARK 
--set-mark 3
no error show, but when i do:
iptables -t mangle -L -v
pkts bytes target     prot opt in     out     source               
destination
    0     0 MARK       all  --  any    any     anywhere             
anywhere            LAYER7 l7proto http MARK set 0x3
the packets marked always is 0.

I followed this howto http://l7-filter.sourceforge.net/HOWTO.

Have somebody any idea?
Thanks, and sorry for my bad english.

