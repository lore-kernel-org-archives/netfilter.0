From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: strange behaviour
Date: Mon, 26 Feb 2007 15:53:45 +0100
Message-ID: <45E2F479.7020804@plouf.fr.eu.org>
References: <20070226124547.69013.qmail@web36804.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070226124547.69013.qmail@web36804.mail.mud.yahoo.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

angico a =E9crit :
> i have a server (a) connected to the internet via eth0/ppp0 (adsl).

PPPoE ?

> another computer (b) is connected to this server thru eth1, and it=20
> should reach the internet via the server which is its gateway. and so i=
t=20
> did!... up to a month ago.
> i think nothing's changed. all i did was a re-installing of my gentoo=20
> based system on the server, due to problems on the hard-disk. but=20
> firewall rules (iptables) remain the same. and the netted computer can'=
t=20
> reach the internet anymore!=20
> things got exquisite because:
> - i ping any site on the internet from (b) and i can see their pongs.

Then it can reach the internet.

> - irc (msn) also works fine!

Then it can reach the internet.

> - google's pages load correctly!

Then it can reach the internet.

> and for my despair i can access <facilcotacao.com>, but can't access=20
> <facilcotacao.com/autopecas>!!!!
> please, help me! what the hell is wrong with my firewall?

I doubt this is a firewall issue. It may be an MTU issue.
If pppd uses pppoe from rp-pppoe, does it have an option "-m 1452" or=20
less for pppoe in the pty option ?
What happens if you decrease the MTU of computer (b) to 1492 or less ?

