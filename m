From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Simple newbie's question
Date: Tue, 17 Feb 2004 00:26:41 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402170026.41874.Antony@Soft-Solutions.co.uk>
References: <001701c3f4b2$648798f0$a704a8c0@mpro4167>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001701c3f4b2$648798f0$a704a8c0@mpro4167>
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

On Monday 16 February 2004 5:29 pm, Oriol Magran=E9 wrote:

>     Hello!!
>     I have a linux box (with ip 192.168.4.172) connected to the Interne=
t
> through an ADSL router (with ip 192.168.4.10). Now I'd like to do some =
port
> forwarding on the box itself, so that outgoing connections to port 80 o=
f
> host 212.59.199.45 goes to port 110 of host 212.59.199.75.
>
>     So I do:
>
>         iptables -t nat -A PREROUTING -p tcp -d 212.59.199.45 --dport 8=
0 -j
> DNAT --to 212.59.199.75:110
>
>     Which it seems the logical thing to do.
>     But when I telnet 212.59.199.45 80 the kernel continues to send pac=
kets
> to port 80 of 212.59.199.45 ignoring my wishes and commands. What am I
> doing wrong?

1. Where are you testing the telnet from?   The machine with the netfilte=
r=20
rules on it (won't work) or a machine on your LAN which is routed through=
 the=20
netfilter machine (should work)?

2. Do you have a suitable FORWARD rule to allow the packets to get to=20
212.59.199.45 TCP port 110?

Regards,

Antony.

--=20
There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


