From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: SSL Question
Date: Wed, 30 Jul 2003 11:23:33 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C001@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: nakisawame <nakisawame@yahoo.com>, netfilter@lists.netfilter.org

it's driving you nuts? You haven't mentioned what's the problem and only =
asked if it'll work.

I have this working already for 2 external IPs redirected to 2 internal =
IPs.. I have similar if not the same rules are you.. though I don't =
specify the --to :443 port, just the IP..

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

-----Original Message-----
From: nakisawame [mailto:nakisawame@yahoo.com]
Sent: Wednesday, July 30, 2003 11:13 AM
To: netfilter@lists.netfilter.org
Subject: SSL Question


Hello,

I am wondering if this will work... We are using NAT,
and I currently have 2 dif
ferent webservers that we need to put SSL on.

Each webserver has a different external DNS entry (I
am using 55.55.55.56 and 55
.55.55.57 as examples). Each actual webserver is on
its own internal IP address=20
(192.158.0.14 and 192.168.0.15, respectively).

Can I do something like this:

iptables -t nat -A PREROUTING -p tcp -d 55.55.55.56
--dport https -j DNAT --to 1
92.168.0.14:443
iptables -t nat -A PREROUTING -p tcp -d 55.55.55.57
--dport https -j DNAT --to 1
92.168.0.15:443

Does this work? If it doesn't, how do I do this? This
is driving me nuts!

TIA!!!

-N


__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com


