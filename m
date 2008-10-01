From: Marcio Veloso Antunes <mveloso@tecnologiaip.com.br>
Subject: Re: Something weird
Date: Wed, 1 Oct 2008 11:51:53 -0300
Message-ID: <200810011151.53192.mveloso@tecnologiaip.com.br>
References: <200810010834.51705.mveloso@tecnologiaip.com.br> <48E38584.60704@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48E38584.60704@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Grant,

  I found out what is happening, it is exactly what you've said.

  The reason this occurs is related to conntrack, the specific route is=
 getting up after=20
the first packet leaves the internal network (via VPN interface, withou=
t masquerade), then=20
when the specific route enters, the connection has been established alr=
eady.

=A0 Even when the interface changes from TUN0 to PPP0 the connection pe=
rsists and the packets=20
keep NOT being re-verified.

=A0 I don't know if it can be considered a Bug, but it seems to me an o=
dd situation as the interface=20
have changed, other networks will be crossed, i think the rules should =
be re-validated, don't you ?

root@fw:/proc/net# grep 172.18.0.13 ip_conntrack
udp =A0 =A0 =A017 2809 src=3D172.18.0.13 dst=3D200.198.184.204 sport=3D=
5060 dport=3D5060 packets=3D977 bytes=3D537937 src=3D200.198.184.204 ds=
t=3D172.18.0.13 sport=3D5060 dport=3D5060 packets=3D30 bytes=3D16384=20
[ASSURED] mark=3D0 use=3D1

=A0 Thanks for your help,

Em Quarta 01 Outubro 2008, voc=EA escreveu:
> On 10/01/08 06:34, Marcio Veloso Antunes wrote:
> > Can you bring me some light on why packets from 172.18.0.13 are
> > crossing ppp0 whithout being masqueraded?
>
> I can't tell for sure (you did not provide your IP addresses per say)
> but it looks like the traffic is from your internal network and heade=
d
> for your external ppp0 interface its self.
>
> Seeing as how you did not actually provide your IPs I'm guessing base=
d
> on the fact that you have a route of 200.198.184.204/32 on your ppp0
> interface that said IP is bound to said interface.  If this is the ca=
se,
> it is possible that the traffic is entering the kernel and going up t=
he
> network stack directly rather than being forwarded like you would exp=
ect.
>
> I believe this is coming back to the fact that IPs are not bound to a=
n
> interface per say, but rather the computer and that in some situation=
s
> any interface in the system will take the traffic and pass it up in t=
o
> the network with out forwarding it over to the interface that it is
> bound to before it takes the traffic and passes it higher in the
> networking stack.
>
>
>
> Grant. . . .
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
Marcio Veloso Antunes
Tecnologia IP Ltda
+55.21.3005.3004
+55.11.3588.0802
+55.21.8539.2949
