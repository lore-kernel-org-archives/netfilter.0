From: Fox <admin@flshlnk.com>
Subject: Re[2]: OUTPUT chain DNAT problem
Date: Thu, 3 Jul 2003 12:56:14 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1591512625.20030703125614@flshlnk.com>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15BEC7@wardrive.citadelcomputer.com.au>
Reply-To: admin@flshlnk.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A15BEC7@wardrive.citadelcomputer.com.au>
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
To: George Vieira <georgev@citadelcomputer.com.au>, netfilter@lists.netfilter.org

Hi.

I think the problem is in the concept of DNAT'ting itself. As the
manual page says close to "only locally originated packets pass through OUTPUT
chain in nat table". That's why ping worked - icmp packets originated
from the box itself. As it comes to my problem - the application
replies to the orinigated connection - there's no SYN, correct me if
i'm wrong, please. So these packets pass through PREROUTING and
POSTROUTING chains. It'd be great if i was possible to SNAT in
PREROUTING to trick the application that the connection originated
from 192.168.0.2, not 10.0.0.2 or DNAT it in POSTROUTING chain. But
it's vice versa in iptables and not handy :(
I don't understand the reasons why iptables cannot SNAT in PREROUTING
or DNAT in POSTROUTING.

thanks
Fox

GV> There was a problem in the old days where NAT for OUTPUT was broken. Not sure if this is the same case still or not, if so then you'll need to use the -p-o-m patch to fix the problem and it'll
GV> work.

GV> Thanks,
GV> ____________________________________________
GV> George Vieira
GV> Systems Manager
GV> georgev@citadelcomputer.com.au

GV> Citadel Computer Systems Pty Ltd
GV> http://www.citadelcomputer.com.au

GV> Phone   : +61 2 9955 2644
GV> HelpDesk: +61 2 9955 2698
 

GV> -----Original Message-----
GV> From: Fox [mailto:admin@flshlnk.com]
GV> Sent: Wednesday, July 02, 2003 8:57 PM
GV> To: netfilter@lists.netfilter.org
GV> Subject: OUTPUT chain DNAT problem


GV> Hi.

GV> I'm having problems with rewriting outgoing packets.
GV> I've specified the following rule:
GV> iptables -t nat -A OUTPUT -d 10.0.0.2 -j DNAT --to-destination
GV> 192.168.0.2

GV> When I ping 10.0.0.2 i get them rewritten (i check it with tcpdump and
GV> get stats with `iptables -t nat -L -v -n`). But when an application
GV> sends a packet to 10.0.0.2 it's not rewritten. I can't understand why.

GV> I need to to the following thing:

GV> A              B                C
10.0.0.2  --->> 192.168.0.1 ---> 192.168.0.2

GV> A send requests to B and B replies to A. But i want those replies go
GV> to C and only C.

GV> Your help is appreciated.
GV> thanks.
GV> fox






-- 
Best regards,
 Muzaffar                            mailto:admin@flshlnk.com


