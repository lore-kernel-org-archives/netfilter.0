From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: SNAT before IPSec
Date: Thu, 07 Jun 2007 13:03:54 -0500
Message-ID: <4668488A.8040102@riverviewtech.net>
References: <8bd3dfad0706050529s484d42b6t9ef4ae0fd1730367@mail.gmail.com>	<web-74829660@bk1.webmaillogin.com>	<8bd3dfad0706051429r7c37e29dhcd8d2550a613bab3@mail.gmail.com>	<web-17532572@bk3.webmaillogin.com>	<8bd3dfad0706051540t626bf02fk15e20eace4818b3e@mail.gmail.com>	<web-17534558@bk3.webmaillogin.com>	<8bd3dfad0706051605u49cdbf17jca76d1d74ebdd26b@mail.gmail.com>	<web-73937813@bk2.webmaillogin.com>	<8bd3dfad0706070840i2b80fa4bl5a9a4ae5973b0e01@mail.gmail.com>
	<46683B69.8000303@riverviewtech.net>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46683B69.8000303@riverviewtech.net>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 06/07/07 12:07, Grant Taylor wrote:
> iptables -t nat -A PREROUTING -i $WAN -d D.E.F.x/24 -j NETMAP --to 
> A.B.C.x/24
> iptables -t nat -A POSTROUTING -o $LAN -s A.B.C.x/24 -j NETMAP --to 
> D.E.F.x/24
> 
> This should cause the NETMAPing to happen at the remote end of the vpn 
> link and (hopefully) not confuse the router at the local end of the vpn 
> link.

I've done some more thinking and I think it would be better to do the SNAT at the local end of the vpn link.  Doing the SNAT on the remote end will work, but it is not as scalable as doing it on the local end.

If you consider your situation where you have multiple networks (3 or more) that are all the same subnet that you want to tie together, you have to SNAT and DNAT for each network.  DNATing should be done at the remove end to change from the bogus address to the real address.  If SNATing is done at the remove end, the remote end will have to have rules for each and every other network to know what to SNAT to.  If SNATing is done at the local end, the local router knows what to SNAT to and the remote end will just DNAT and reply.  So a slightly modified version of the above rules would be:

iptables -t nat -A PREROUTING -i $WAN -d D.E.F.x/24 -j NETMAP --to A.B.C.x/24
iptables -t nat -A POSTROUTING -o $WAN -d D.E.N.x/16 -j NETMAP --to D.E.M.x/24

Where D.E.N.x/16 is the larger class B that encompasses all remote networks.  I.e. selectively SNAT only when you are going to a remote network.

Where D.E.M.x/24 is the local bogus network.

This *SHOULD* allow you to have two rules on each system to allow all of them to communicate with each other presuming that they have routes for the D.E.N.x/16 (sub)network(s), be it an ethernet link, IPSec VPN, ATM WAN, or what ever.



Grant. . . .

