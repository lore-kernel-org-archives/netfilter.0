From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Cable and ISDN connection
Date: Wed, 5 Feb 2003 03:02:07 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302050302.07115.netfilter@newkirk.us>
References: <5.2.0.9.0.20030205111632.00a301d0@mail.SoftHome.net> <5.2.0.9.0.20030205124413.00a0bec0@mail.SoftHome.net>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.2.0.9.0.20030205124413.00a0bec0@mail.SoftHome.net>
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
To: Blesson Paul <blessonpaul@softhome.net>, netfilter@lists.netfilter.org

On Wednesday 05 February 2003 02:17 am, Blesson Paul wrote:
> But can iproute2 and iptable co exist together. What I meant is, let I
> used iproute2 to route the traffic. I also need to do SNAT of the
>   packets. So I need to do SNAT as well as routing.
>
> regards
> Blesson Paul

This is not a problem, they work quite happily together.  You can mark or=
=20
change TOS on packets in mangle-PREROUTING, then the routing decision is=20
made after nat-PREROUTING and the packets go to the FORWARD chains. (or=20
INPUT, but that's not what you're aiming at here)  After FORWARD chains=20
they all go to POSTROUTING, where you perform SNAT.  You simply perform=20
SNAT of packets going out, for example, eth1, and MASQUERADE (or SNAT if=20
the dynamic IP doesn't really change until a restart) for packets going=20
out eth2, with the appropriate IPs for each SNAT, based on "-o eth1" or=20
"-o eth2" matches.

j


