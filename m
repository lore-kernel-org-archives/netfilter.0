From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Simple newbie's question
Date: Tue, 17 Feb 2004 08:49:22 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402170849.22453.Antony@Soft-Solutions.co.uk>
References: <001701c3f4b2$648798f0$a704a8c0@mpro4167> <200402170026.41874.Antony@Soft-Solutions.co.uk> <000401c3f52f$bd85b3b0$a704a8c0@mpro4167>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000401c3f52f$bd85b3b0$a704a8c0@mpro4167>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Tuesday 17 February 2004 8:26 am, Oriol Magran=E9 wrote:

>     I'm telnetting from the machine with the netfilter rules on it (so =
you
> say that it won't work).
>     But why it won't work?

Because the PREROUTING rule applies to packets coming in to the machine f=
rom=20
the network, before they get routed, either locally or remotely.

Packets which start on the machine itself do not go through PREROUTING.

>     Is there any other way to achieve it?

Sure - run the telnet command from a machine inside your LAN, or else con=
nect=20
to the correct address & port from the firewall.

The first (telnet from a LAN machine) would be the best choice, because t=
his=20
is more representative of how you want the system to work in practice=20
(because surely you don't have any applications generating packets runnin=
g on=20
your firewall itself, do you :) ?)

You might be able to get the DNAT target in the OUTPUT chain working (alt=
hough=20
I have seen reports that people find this problematic, and I've never nee=
ded=20
to use it).   The OUTPUT chain is the correct place for you to do this,=20
because that and POSTROUTING are the only two chains your locally-generat=
ed=20
packets will go through.

Regards,

Antony.

> ----- Original Message -----
> From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
> To: <netfilter@lists.netfilter.org>
> Sent: Tuesday, February 17, 2004 1:26 AM
> Subject: Re: Simple newbie's question
>
> On Monday 16 February 2004 5:29 pm, Oriol Magran=E9 wrote:
> >     Hello!!
> >     I have a linux box (with ip 192.168.4.172) connected to the Inter=
net
> > through an ADSL router (with ip 192.168.4.10). Now I'd like to do som=
e
>
> port
>
> > forwarding on the box itself, so that outgoing connections to port 80=
 of
> > host 212.59.199.45 goes to port 110 of host 212.59.199.75.
> >
> >     So I do:
> >
> >         iptables -t nat -A PREROUTING -p tcp -d 212.59.199.45 --dport
>
> 80 -j
>
> > DNAT --to 212.59.199.75:110
> >
> >     Which it seems the logical thing to do.
> >     But when I telnet 212.59.199.45 80 the kernel continues to send
>
> packets
>
> > to port 80 of 212.59.199.45 ignoring my wishes and commands. What am =
I
> > doing wrong?
>
> 1. Where are you testing the telnet from?   The machine with the netfil=
ter
> rules on it (won't work) or a machine on your LAN which is routed throu=
gh
> the
> netfilter machine (should work)?
>
> 2. Do you have a suitable FORWARD rule to allow the packets to get to
> 212.59.199.45 TCP port 110?
>
> Regards,
>
> Antony.

--=20
This email is intended for the use of the individual addressee(s) named a=
bove=20
and may contain information that is confidential, privileged or unsuitabl=
e=20
for overly sensitive persons with low self-esteem, no sense of humour, or=
=20
irrational religious beliefs.

If you have received this email in error, you are required to shred it=20
immediately, add some nutmeg, three egg whites and a dessertspoonful of=20
caster sugar.   Whisk until soft peaks form, then place in a warm oven fo=
r 40=20
minutes.   Remove promptly and let stand for 2 hours before adding some=20
decorative kiwi fruit and cream.   Then notify me immediately by return e=
mail=20
and eat the original message.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


