From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Interaction of Ethereal and iptables?
Date: Mon, 12 Apr 2004 07:55:58 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1081770958.16832.3.camel@localhost>
References: <065601c41f87$34f209e0$9701a8c0@office>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <065601c41f87$34f209e0$9701a8c0@office>
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
To: Jay Levitt <lists-netfilter@shopwatch.org>
Cc: netfilter@lists.netfilter.org

On Sun, 2004-04-11 at 01:38, Jay Levitt wrote:
> I'm occasionally seeing lines like the following, always to the same
> machine which is on my internal network:
>  
> Apr 11 01:11:52 linux kernel: Rejected output by default:IN= OUT=eth0
> SRC=192.168.1.150 DST=192.168.1.151 LEN=40 TOS=0x00 PREC=0x00 TTL=64
> ID=30662 DF PROTO=TCP SPT=993 DPT=3736 WINDOW=6432 RES=0x00 ACK FIN
> URGP=0 
>  
> This corresponds to a LOG and then a DROP rule.  So I set up Ethereal
> to capture the packet trace.  I didn't see the packet there, so I
> changed the DROP to an ACCEPT, assuming that iptables is probably
> dropping the outbound packet before Ethereal (ok, libpcap) can see
> it.  
>  
> The weird thing is - even with just a LOG/ACCEPT rule, the packet is
> STILL missing from Ethereal's trace!  All other packets from that time
> frame are there, but this particular one isn't.  Could iptables be
> imagining it somehow?  I'm using libpcap 0.7.2, which was current till
> a few days ago...  I've done an iptables --list OUTPUT and verified
> that the last item on the OUTPUT chain is an ACCEPT of all packets,
> although the default policy is still technically DROP.
<snip>
Is there any chance it is being dropped by some other rule before it
hits the accept rule? If you add a log rule just in front of the ACCEPT
rule, is the packet still logged?
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


