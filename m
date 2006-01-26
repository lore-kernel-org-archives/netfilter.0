From: Jakub Wartak <vnulllists@pcnet.com.pl>
Subject: Re: system time going up with many rules updates
Date: Thu, 26 Jan 2006 11:00:18 +0100
Message-ID: <200601261100.18485.vnulllists@pcnet.com.pl>
References: <1138265165.10432.163.camel@sehe-c4.berlin.teles.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1138265165.10432.163.camel@sehe-c4.berlin.teles.de>
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

Dnia czwartek, 26 stycznia 2006 09:46, Sebastian Heidl napisa=B3:
> Hello List,
>
> I have some moderately busy (in terms of traffic) firewalls that are
> spending quite a lot CPU time in %system (> 70%) when there are a lot of
> updates to the netfilter rules.
> My question is: How can I lower the system time to enable the machines
> to handle more traffic ? Specifically, would nf-hipac or other netfilter
> projects help here ?
>
> These are 2.8GHz Xeon Machines with 512 MB RAM and GbE interfaces.
> During the "high-system-time period" they are forwarding about 30 Mbit/s
> traffic.
>
> The netfilter chains structure is as follows (only FORWARD is relevant):
>
> Chain FORWARD (policy DROP)
> *** publicly available services ***
> *** jump to chain with authenticated users ***
> *** services for authenticated users ***
>
> The last rule in the auth-chain is a REJECT so only authenticated users
> can access the private services. When a user logs in successfully a rule
> is added to the auth-chain, when he logs out the rule is deleted.
>
> At the mentioned high-system-time periods there are about 10 updates
> (add/delete) to the auth-chain per second.
>
> I'm thankful for any advice.
> _sh_

You could try ipsets, in my production systems they are rock solid stable.=
=20
Uptimes over 60 days are no problem ( except for power outages ). You don't=
=20
have to modify iptables rules just ipsets which far more effective. I'm=20
pushing over 1200 clients on P4 3GHz ( about 25-30 mbps , 50% cpu load, but=
=20
this machine also is running netflow probe... network cards: pure e100, eve=
ry=20
client gets HFSC queue with SFQ qdisc, IMQ is also helping a little bit to=
=20
get VOIP prio. over P2P - to detect p2p i use ipp2p ). I heard even that
someone is pushing much more than that on dual Opterons ( 2 x 242 i suppose=
 )

=2D-=20
Jakub Wartak
=2Dvnull
=46reeBSD/OpenBSD/Linux/Solaris/Network Administrator
http://vnull.pcnet.com.pl/

