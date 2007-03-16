From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: forwarding local ports
Date: Fri, 16 Mar 2007 20:36:19 +0100
Message-ID: <45FAF1B3.2000601@plouf.fr.eu.org>
References: <2700.4272-9683-164045092-1174070512@seznam.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2700.4272-9683-164045092-1174070512@seznam.cz>
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

Martin Korous a =E9crit :
>=20
> I want forward local ports to remote server, for example:
> for `telnet localhost 80` must answer webserver from remote IP
>=20
> I have this rule:
> iptables -t nat -A OUTPUT -p TCP -d 127.0.0.1 --dport 80 -j DNAT --to 1=
92.168.0.254:80
> but doesnt work.
> of course i have support of routing, iptables and nat in kernel=20
>=20
> Im sure that rule is right and in kernel 2.4 works.
> Is problem in 2.6 or where?
>=20
> kernel 2.6.18

The problem, which  has already been discussed in this list, is in=20
kernels 2.6.11 and above. In Changelog-2.6.11 you can read :

    [PATCH] Remove do_extra_mangle: double NAT on LOCAL_OUT

    On NF_IP_LOCAL_OUT, when destination NAT changes the destination
    interface, we also change the source address, so the packet is the
    same as if it were generated to go that way in the first place.  This
    is not strictly necessary, I believe.

    This patch rips that code out to see what breaks.

Sorry, you've just seen what breaks. The kernel routing code prohibits=20
sending packets with source address in 127.0.0.0/8 outside the host=20
(i.e. on another interface than lo) so the packets are dropped after=20
leaving the OUTPUT chains.

For this to work you must use a local address outside 127.0.0.0/8.

