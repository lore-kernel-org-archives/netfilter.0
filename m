From: Glen Huang <heyhgl@gmail.com>
Subject: Re: How to trace IPSec packets?
Date: Tue, 30 Jan 2018 12:16:41 +0800
Message-ID: <868912EE-65C5-4873-81AF-4B4C369FBAB7@gmail.com>
References: <2A246279-5BD5-4858-9E81-2132542CD4DA@gmail.com>
 <CALNXhk0TefWZQ7_e+JOuDL7Qs7KFq2DwQ4h+CayKHd3uWd_y_Q@mail.gmail.com>
 <CACuyg267+379fHkBactPOShqsrXzQWxq4TM6ZBFh=WJZvqN0vQ@mail.gmail.com>
 <CALNXhk0ocwWiNyA=x_KVqjLL-tVXE1G2Uj917JXLV-SoG79+cg@mail.gmail.com>
 <CAP9CGviN_ZsMVq2M_bFvd8gkHFgF_uw-Qqb1fkokeVDALMhc7w@mail.gmail.com>
 <CALNXhk1aXDLfQ=+aC3mAHkgvq_Nr3uAjxBFbgt4iXEzW4zwswA@mail.gmail.com>
 <CAP9CGvjOSrYCYNGTD2fScBac-vLG51BwcyfE5u=eKxsai625WQ@mail.gmail.com>
 <CAP9CGvhH78bAfeG_RZn_kLfFzik23ETrccrGSpQxu=H2wLcpug@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:content-transfer-encoding:mime-version:subject:date
         :references:to:in-reply-to:message-id;
        bh=MrZWpM/mWzwoWlng3u6W8jgQ9lEbdq/G2kFHR4P4mCs=;
        b=LsGAySuWzvru7LPKkSNkol1zPvvDmoJvYbMM+tJvlz9+VgJEJ7PFRXm1DiXH8pKoVQ
         RqQTIvEctUvuCGEzJmHRyt1ynlpG/EB6QUnj4DqRKNqykZu32ew+L+TzQqq8rBP1G7wP
         3s9hR64FePdi0DUr9UTasFSJcAREu1jTjfWmsEmaONLOylDH/76Iqbnwe3DQuvmyCKvu
         WkAtdQWuyL50rviiJ0SU9roFz0TGEjFkQuslHS6xJpEr2/umuzCqJxrqHy+YBh6CXk/o
         oOoFVIymz0fwc3cdr8QELUTEpP75cvOghoglJ80t2lew5sw6zRpa84KNTgb+b/eNmQ9+
         c1VA==
In-Reply-To: <CAP9CGvhH78bAfeG_RZn_kLfFzik23ETrccrGSpQxu=H2wLcpug@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Yes! I=E2=80=99m using dnsmasq, and I=E2=80=99m using its add-subnet =
option. But the problem is, I can not hard code an ip there, because the =
client can change. And there might have multiple connected clients with =
different public ips (share the server to some friends). So I use =
add-subnet=3D24, in which case dnsmasq will extract the ip from the =
requestor ip. If I=E2=80=99m not wrong, in this case I need to change =
the dns request source ip to client=E2=80=99s public ip, which I can get =
when vpn is established, but can=E2=80=99t figure out how to match the =
packets and SNAT them.

> On 30 Jan 2018, at 12:42 AM, Chris Clark <rip057@gmail.com> wrote:
>=20
> I honestly rarely get a chance to read and or understand some of these =
but if you are talking dns, you probably want to deal with the dns =
resolver on the server or the client, which in most things Linux (idk =
about iOS) is dnsmasq
>=20
> On Jan 29, 2018 10:39 AM, "Chris Clark" <rip057@gmail.com> wrote:
> Well good volley,
>=20
> Use dnsmasq and redirect the address.
>=20
> Google is your friend...
>=20
> On Jan 29, 2018 9:09 AM, "Glen Huang" <heyhgl@gmail.com> wrote:
> Sigh, sometimes when you try to defend yourself, you start to look =
suspicious.
>=20
> I can see why the question seemed suspect, let me explain myself:
>=20
> =46rom where I live, the internet is censored and dns cache is =
poisoned
> by default. To counter that, I set up an ipsec vpn, but to speed
> things up, I split the connections so when the destination is
> domestic, I connect directly. The problem comes when I need to resolve
> domains. I do it via 8.8.8.8, but since it goes through the server,
> the ips returned from cdns aren't always domestic, thus I lose the
> performance gain. I'm trying to stick the edns client subnet value
> containing my client public ip into the dns query I send to the
> server. Since I'm not always in control of the client wherever I go, I
> plan to do it on the server with an ECS capable dns forwarder. I come
> up with a couple of solutions:
>=20
> 1. Make the dns forwarder listen on the server's public ip, return
> that ip as dns when clients connect vpn, and change the source ip to
> client's public ip when the clients query it with in-tunnel ip. But
> somehow ipsec only protects forwarded packets, I asked a question on
> strongswan mailing list, got no reply yet:
> https://lists.strongswan.org/pipermail/users/2018-January/012165.htm
>=20
> 2. Make the dns forwarder listen on the server's loopback's interface,
> and when clients query 8.8.8.8, redirect to it and also change the
> source ip. This is the case I'm asking.
>=20
> 3. Make the dns forwarder listen on a virtual NIC or an ip alias on
> the wan interface. This isn't very different from #1, but I encounter
> the same problem as I did in #2: I can't match the dns packets from
> ipsec, so there is nothing I can do to them. I figure if I can solve
> #2, I should be able to solve #3 also. Thus the question. :)
>=20
> Maybe #3 would be a better question to ask. Sorry if I made things
> complicated. I'll keep the hacker factor in mind in the future.
>=20
> On Mon, Jan 29, 2018 at 9:53 PM, Chris Clark <rip057@gmail.com> wrote:
> > I know how to do this very easily with one line in a file, but this =
question
> > seems awefully suspect, as one of those, "hey help me hack a =
network."
> >
> >
> > Seriously though, sorry if I offend you, but you should be able to =
just set
> > up another dns on the computer and this is something any user of the
> > machine, your machine, should have access to.
> >
> > This question is sort of like asking someone how to poison a dns =
cache.
> >
> > Thanks but no thanks
> >
> >
> > On Jan 29, 2018 7:14 AM, "Glen Huang" <heyhgl@gmail.com> wrote:
> >
> > Thanks for the reply.
> >
> >> check you source routing address with this command:
> >> ip route get 8.8.8.8
> >
> > I did not know this trick, very useful! But unfortunately my machine
> > is a mac, so can=E2=80=99t use that.
> >
> >> after this, you need rewrite your firewall rules in a OUTPUT chain:
> >> iptables -t nat -I OUTPUT -s $SRC_ADDRESS -d 8.8.8.8 -p udp
> >> --dport 53 -j DNAT --to-destination 127.0.0.1
> >
> > I tried that, doesn=E2=80=99t seem to work. I even removed the "-s
> > $SRC_ADDRESS=E2=80=9D flag to make sure it matches, but it didn=E2=80=99=
t prevent me
> > from querying 8.8.8.8 on my machine (I have shut down the local dns
> > forwarder, so if this rule were matched, I shouldn=E2=80=99t be able =
to query
> > 8.8.8.8 at all)
> >
> > I don=E2=80=99t quite understand why I should use the OUTPUT chain. =
In my
> > mind, the packets flow like this, please correct me if it=E2=80=99s =
not right:
> >
> > on my mac, ipsec0 interface is the default gateway
> >
> > #1 client ip inside tunnel -> 8.8.8.8
> > |
> > | client kernel wraps it in ipsec
> > v
> > #2 client public ip -> server public ip
> > |
> > | server kernel unwraps it from ipsec
> > v
> > #3 client ip inside tunnel -> 8.8.8.8
> > |
> > | server forwards it by doing nat
> > v
> > #4 server public ip -> 8.8.8.8
> >
> > At #3, it should reenter the ip stack and go through the nat =
prerouting
> > chain.
> >
> > On 29 Jan 2018, at 8:25 PM, Humberto Juc=C3=A1 <betolj@gmail.com> =
wrote:
> >
> > Hi Glen Huang,
> >
> >
> > I have an IPSec tunnel set up between my machine and a server.
> >
> >
> > - check you source routing address with this command:
> > ip route get 8.8.8.8
> >
> > "So, replace your source address to *src ip address*"
> >
> >
> > But after dig @8.8.8.8 google.com on my machine, running grep =
'TRACE:'
> > /var/log/kern.log on the server returned nothing.
> >
> >
> > - after this, you need rewrite your firewall rules in a OUTPUT =
chain:
> > iptables -t nat -I OUTPUT -s $SRC_ADDRESS -d 8.8.8.8 -p udp
> > --dport 53 -j DNAT --to-destination 127.0.0.1
> >
> > "Because you are redirecting your internal traffic, use OUTPUT =
chain."
> >
> > 2018-01-29 7:07 GMT-03:00 Glen Huang <heyhgl@gmail.com>:
> >
> > (Previous message seems to get smudged. This is a resent.)
> >
> > Hi,
> >
> > Hope the question isn=E2=80=99t too basic to be asked here.
> >
> > I have an IPSec tunnel set up between my machine and a server. All
> > packets originate from my machine go through that tunnel and then =
get
> > forwarded by the server. I=E2=80=99m trying to redirect DNS request =
from my
> > machine to 8.8.8.8 to a dns forwarder running on the server.
> >
> > I tried this on the server
> >
> > iptables -t nat -I PREROUTING -s $IPSEC_VIRTUAL_IP -d 8.8.8.8 -p udp
> > --dport 53 -j DNAT --to-destination 127.0.0.1
> >
> > But it didn't work. To make sure it wasn't because I hadn't allowed
> > martian packets or anything. I tried to trace the decrypted packets.
> >
> > iptables -t raw -I PREROUTING -s $IPSEC_VIRTUAL_IP -d 8.8.8.8 -p udp
> > --dport 53 -j TRACE
> >
> > But after dig @8.8.8.8 google.com on my machine, running grep =
'TRACE:'
> > /var/log/kern.log on the server returned nothing.
> >
> > According to this picture:
> > =
https://en.wikipedia.org/wiki/Iptables#/media/File:Netfilter-packet-flow.s=
vg
> > after decrypting the ipsec packets, netfilter will make the =
decrypted
> > packets go through the ip stack again, and the trace target should =
be
> > able to catch it.
> >
> > I wonder if my mental model is incorrect or I missed something?
> >
> > Regards,
> > Glen
> >
> > On Mon, Jan 29, 2018 at 5:10 PM, Glen Huang <heyhgl@gmail.com> =
wrote:
> >
> > Hi,
> >
> > Hope the question isn=E2=80=99t too basic to be asked here.
> >
> > I have an IPSec tunnel set up between my machine and a server. All
> > packets originate from my machine go through that tunnel and then =
get
> > forwarded by the server. I=E2=80=99m trying to redirect DNS request =
from my
> > machine to 8.8.8.8 to a dns forwarder running on the server.
> >
> > I tried this on the server
> >
> > iptables -t nat -I PREROUTING -s $IPSEC_VIRTUAL_IP -d 8.8.8.8 -p udp
> > --dport 53 -j DNAT --to-destination 127.0.0.1
> >
> > But it didn't work. To make sure it wasn't because I hadn't allowed
> > martian packets or anything. I tried to trace the decrypted packets.
> >
> > iptables -t raw -I PREROUTING -s $IPSEC_VIRTUAL_IP -d 8.8.8.8 -p udp
> > --dport 53 -j TRACE
> >
> > But after dig @8.8.8.8 google.com on my machine, running grep =
'TRACE:'
> > /var/log/kern.log on the server returned nothing.
> >
> > According to this picture:
> > =
https://en.wikipedia.org/wiki/Iptables#/media/File:Netfilter-packet-flow.s=
vg
> > after decrypting the ipsec packets, netfilter will make the =
decrypted
> > packets go through the ip stack again, and the trace target should =
be
> > able to catch it.
> >
> > I wonder if my mental model is incorrect or I missed something?
> >
> > Regards,
> > Glen
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> >

