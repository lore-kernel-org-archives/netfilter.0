From: Mike Williams <mike@v6.gaima.co.uk>
Subject: Re: Hardly loaded machines and iptables? Your experiences?
Date: Sat, 2 Sep 2006 19:38:58 +0100
Message-ID: <200609021938.58564.mike@v6.gaima.co.uk>
References: <20060902174858.44865.qmail@web56212.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060902174858.44865.qmail@web56212.mail.re3.yahoo.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Saturday 02 September 2006 18:48, Elvir Kuric wrote:
> I need your opinion about heavy load machines acting
> as firewals based on iptables package.
> If I have Pentium 4, equiped with 1GB of RAM, two
> NICs, one NIC to internet, second to private network (
> in private network are servers ). On firewall (
> iptables ) machine I have nat, pat, everthing using
> iptables. How that works in =A0environment with many
> reqestes to servers in the LAN, I mean about 10000
> request per day? Have you experience about this topic.
> Is there any limit on hits to iptables machine, what
> is about memory, procesor.
>
> What do you think is solution based on iptables enough
> secure for mission critical cases? I just need your
> frank opinion.

10000 a day? That's nothing.
Our companies web presence is behind a PIII 800, with 376MB RAM, and it NAT=
s=20
in excess of 10000 individual web requests a minute, just to one of the=20
webservers!
Add the mail server, the support system, the bug trackers, etc, etc.
Currently handling nearly 40000 connections, with peaks of over 60000.
Pushing upwards of 40Mbps at normal peak.
And all the while being the end point for several IPSEC VPNs.
It can quite happily max out the 100Mbps connection, as it is now (hasn't d=
one=20
that before!) with a cpu usage of ~40%.

=2D-=20
Mike Williams

=2D-=20
Mike Williams

