From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Newbie: need help with table rules
Date: Sat, 15 Feb 2003 03:19:29 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302150319.29081.netfilter@newkirk.us>
References: <3E4C9197.6000806@mega-bucks.co.jp>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E4C9197.6000806@mega-bucks.co.jp>
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
To: Jean-Christian Imbeault <jc@mega-bucks.co.jp>, netfilter@lists.netfilter.org

Apologies, I accidentally sent while trying to insert...  Doh!

On Friday 14 February 2003 01:49 am, Jean-Christian Imbeault wrote:
> I've written my first set of iptable rules but they're still buggy =3D)
> I keep locking myself out. So I'm trying to enable logging to see why
> I can't SSH to my box but I can't seem to get logging to work.
>
> I have set the default policy to DROP and added only ACCEPT rules, so
> nothing gets DROPPED or REJECTED before making to the last (logging)
> rule. The last rule should LOG anything that didn't match ... but I
> can't find any iptables entries in /var/log/messages ...
>
> Two questions:
>
> #1 why isn't logging working

See below.

> #2 What is wrong with my rules :)

> I don't control the Firewall. But it's settings are fine I think since
> I can connect from JC <-> LINUX just fine. But if I try my iptable
> rules I lock myself out.

LAN ---- FIREWALL ---- WAN
  |          |
  |          |
JC        LINUX

Is LINUX the firewall box itself, or another machine on the other side of=
=20
it from JC?  If the latter, are your iptables rules invoked on the=20
firewall, or on LINUX?

Remember that INPUT and OUTPUT are only for traffic to and from the=20
firewall box itself, FORWARD is for traffic going THROUGH from a machine=20
on one side to a machine on the other.  If the rules you listed are used=20
on FIREWALL in your diagram, since you don't have any FORWARD rules to=20
ACCEPT anything, then NO communications will be permitted from LAN to=20
WAN or WAN to LAN.

> Yet even when I telnet to my machine I don't see any iptables related
> messages ...

Try "kern.=3Ddebug" instead.  And you will need to restart the syslogd=20
daemon after changing it, probably with "service syslog restart".

j


