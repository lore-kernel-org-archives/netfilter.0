From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: router protection with iptables
Date: Tue, 26 Nov 2002 03:04:53 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211260304.53774.netfilter@newkirk.us>
References: <B5D7C6B6D020D511838A0060082D4CC90299BBF7@kheops.sigma.fr> <01bd01c2946f$c8498fa0$6e69690a@rimas>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <01bd01c2946f$c8498fa0$6e69690a@rimas>
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
To: Remus <rmocius@auste.elnet.lt>, netfilter@lists.netfilter.org

On Monday 25 November 2002 05:45 am, Remus wrote:
> Hi folks,
>
> I have small router on Linux box.
> It has two NICs and I use it to route real IP addresses (basicly I use =
it
> to replace CISCO router, it is cheaper :-) )
> I have a command echo 1 > /proc/sys/net/ipv4/ip_forward and everything
> works just fine.
>
> I'm wondering about iptables rules which I can use to protect my router
> from hackers.
> I want all IP/UDP/ICMP packets to go trought my router in both ways, ju=
st
> to protect my router.
> Behind the router I have Firewalls and they do a protection job for my =
www,
> mail and local network.
>
> What you can recomend for me?

/sbin/iptables -p INPUT DROP
/sbin/iptables -p OUTPUT DROP

Is a damned good start.  If nothing gets in, and nothing gets out, it's a=
lmost=20
not there.  As long as ip_forward is enabled, and you have rules in the=20
FORWARD chain to allow desired traffic to be forwarded, you're set.  You =
will=20
only be able to access the firewall machine itself locally.  If you reall=
y=20
want/need remote admin ability, add ACCEPT rules to INPUT chain for the=20
connections you want to allow, being as specific as possible, (IE, only a=
llow=20
very limited protocol/port access from local network, or specific select=20
IP's, etc) but if you can deal with local logon only then just DROP=20
everything at INPUT and be done.

As an example, my config allows webmin access (on a non-standard port) an=
d a=20
few others, but ONLY from certain specified IP's, all others are silently=
=20
DROPped.  And all accesses, whether dropped or accepted, are logged.  As=20
further security, only localhost or one local IP are normally granted acc=
ess=20
(still requiring authentication), the others are invoked/revoked manually=
=20
(locally) when I anticipate needing them, by passing parameters to my=20
firewall script.  (currently recognizing 17 commands)  If I desperately n=
eed=20
remote access when away and haven't anticipated it, I'm screwed, but I ac=
cept=20
that.

I'd recommend -p FORWARD DROP as well, then ACCEPT rules for the traffic =
you=20
actually want it to forward.  As long as they're configured properly, an=20
extra firewall never hurts...

j


