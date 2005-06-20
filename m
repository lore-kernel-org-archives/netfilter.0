From: "terry l. ridder" <artisticforge@gmail.com>
Subject: Re: iptables leaking blocked ip addresses.
Date: Mon, 20 Jun 2005 11:17:15 -0500
Message-ID: <49bf7d7050620091748a270fc@mail.gmail.com>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<200506201055.25861.rob0@gmx.co.uk>
Reply-To: "terry l. ridder" <artisticforge@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200506201055.25861.rob0@gmx.co.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org

hello

reply below.

On 6/20/05, /dev/rob0 <rob0@gmx.co.uk> wrote:
> On Monday 20 June 2005 10:34, terry l. ridder wrote:
> > i have recently noticed that iptables is leaking blocked ip addresses
> > into the local network.
> >
> > one example of the leak is below:
> >
> > 200.0.0.0/8 is dropped if the destination port is 25 (smtp).
>=20
> iptables-save(8) output, please. What you posted here doesn't tell us
> much.
>

while i have reservations concerning posting the output of iptables-save
i have placed it on my web server:

http://204.238.34.206/iptables-save-20jun2005.txt

>=20
> > the large majority of the packets are dropped but a random few are
> > leaking pass iptables.
> > 404 19712 DROP       tcp  --  eth2   *       200.0.0.0/8
> > 0.0.0.0/0           tcp dpt:25
> > 143   6992 DROP       tcp  --  eth2   *       201.0.0.0/8
> > 0.0.0.0/0           tcp dpt:25
>=20
> Put a logging rule here to prove it:
> iptables -vA $CHAIN -s 200.0.0.0/7 -j LOG --log-prefix "LACNIC-leak: "
>=20
> > at the 2nd lines of defenses the following is seen:
> >
> > date and time is utc.
> >
> > 2005-06-18 08:20:38.310864 IP 200.221.11.147.29937 >
> > 204.238.34.206.25: R 0:0(0) win 0
>=20
> What is this output?
>

tcpdump -tttt -n -r /home/mail/tcpdump-20-jun-2005-00 | grep -e 'IP
200' | less -S

>=20
> > i also have a short web page concerning the iptables leaks at:
> > http://204.238.34.206/iptables-leaks.txt
>=20
> Still not clear to me.
>

what part is not clear? i will attempt to clarify.

>=20
> I do see that you've disabled CONFIG_IP_NF_CONNTRACK, which is a very
> odd choice. Connection tracking is the strength of iptables!
>

--=20
terry l. ridder ><>

