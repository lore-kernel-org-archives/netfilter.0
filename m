From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Help in IPTABLES
Date: Mon, 13 Jan 2003 15:30:14 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301131530.14106.netfilter@newkirk.us>
References: <20030111054656.20063.qmail@web40711.mail.yahoo.com> <200301112132.00991.netfilter@newkirk.us> <20030112090122.3e9a3bc8.arnt@c2i.net>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030112090122.3e9a3bc8.arnt@c2i.net>
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
To: Arnt Karlsen <arnt@c2i.net>, netfilter@lists.netfilter.org

On Sunday 12 January 2003 03:01 am, Arnt Karlsen wrote:

> ..the wee point I was trying to make, is an iptables firewall is
> vulnerable while it is being set up, so echo "0" first to stop
> forwarding, set up the firewall, and echo "1" at the end of the
> script to start forwarding again, a wee nit into your helpful
> responses to him.

I do this myself in my script, but believe there is an additional=20
solution, at least for some distros:

I'm running RedHat 7.3, and so everything runs off SysV-Init.  I was=20
greatly bothered by the fact that the S07iptables startup link would get=20
run quite a bit (well, a few seconds at least :^) before my firewall=20
would.  Changing my firewall to a lower number in the sequence wouldn't=20
work easily, since I'm on a Dynamic IP at the moment and had to start up=20
ADSL to get the IP, since I use it 'statically' in SNAT.  It also would=20
need (or at least want) syslog up and running.  Couldn't easily move=20
ADSL up in the sequence, since it depended on networking in general. =20
Everything is pretty much fixed in the sequence it already starts in.

Then it occurred to me:  Modify the /etc/init.d/iptables script to set=20
DROP policies, instead of the horribly shortsighted ACCEPT default it=20
uses.  As soon as this occurred to me I changed it, and I feel much more=20
comfortable now, knowing that if the whole startup collapses right after=20
iptables and network scripts, I'm still not wide open.

My sequence now is=20
iptables->ip6tables->network->syslog->ADSL->firewall->ip6firewall->freene=
t
(freenet is the startup for the IPv6inIPv4 tunnel)

I modified the /etc/init.d/iptables script to set DROP policies in both=20
the 'start' and 'stop' functions.

Despite being more comfortable with this, I'd like to hear if anyone sees=
=20
a hole in my reasoning.

j


