From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ip_conntrack_max
Date: Thu, 8 Jul 2004 18:42:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407081842.18007.Antony@Soft-Solutions.co.uk>
References: <40ED161F.5070804@cisbic.com> <200407081429.24492.Antony@Soft-Solutions.co.uk> <40ED8294.4060103@cisbic.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40ED8294.4060103@cisbic.com>
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

On Thursday 08 July 2004 6:21 pm, Fallucchi Antonio wrote:

> > Why do you want to limit connections per machine? What are you
> > trying to achieve?
>
> The problem are the P2P software that create any connection on the
> conntrack..
> Because filter all p2p port is very difficult, I thought that to limit
> the number of simultaneous connection is a good idea..

I think the right solution for this problem is to connect your internal users 
through proxy machines, so they can't do direct P2P connections at all.

What network connections do your users need?   Email is SMTP / POP3 / IMAP to 
a local server (or a single specified server at your ISP).   HTTP / HTTPS / 
FTP you can proxy very simply through Squid.   DNS should be to a local 
caching server only (on the same machine as Squid for good Squid 
performance).   If you need to allow SSH, then only allow it from one 
specific machine on your network, which people have to connect through (and 
disable port forwarding).

I can't think of any other protocols you're likely to need, and this should 
stop all P2P activity as well as enhance the performance of your network by 
using a caching proxy server for the website which can be cached.

> ps: it's ok the signature now?

---------------------------------------------------------------
| |||||||    ||    |  Fallucchi Antonio Giuseppe  mat. 2282     |
| ||        ||||    |      --> Live free() of die() <--         |
| ||||     ||  ||    |        OpenSource philosophy             |
| ||      ||||||||    |  Universita' di Bologna sede di Cesena  |
| ||     ||      ||    |    Cdl di Scienze dell'Informazione    |
---------------------------------------------------------------

No, I don't quite think so - I think your want "or" instead of "of" in "Live 
free() or die()"?

Regards,

Antony.

-- 
"When you talk about Linux versus Windows, you're talking about which 
operating system is the best value for money and fit for purpose. That's a 
very basic decision customers can make if they have the information available 
to them. Quite frankly if we lose to Linux because our customers say it's 
better value for money, tough luck for us."

 - Steve Vamos, MD of Microsoft Australia

                                                     Please reply to the list;
                                                           please don't CC me.


