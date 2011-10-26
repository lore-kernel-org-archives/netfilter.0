From: Andrew Beverley <andy@andybev.com>
Subject: Re: Redirecting ports with netfilter: unexpected varying results
 possibly correlated with NAT
Date: Wed, 26 Oct 2011 23:44:35 +0100
Message-ID: <1319669075.26402.6892.camel@andybev-desktop>
References: <CAF1_xX2Np35vKHvqmCu-7yVFOm=CQEJPxw8BdUObAP94omWrog@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1319669076;
	bh=C2YqyRKgL2jF6ieRH3SvRsAJHZtyz//f+E4OhP4GR6w=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=tL/7I1E6xqPzJc/a3Gapks/Gu342dsPJQ4wdCpYUwy3m6H5HhWDktZbbYD6r+9rpB
	 +aEQC7SBN7eoFPPLj1AeE0In5k566Kosl/X/gH1emM3gWb6bpW5M2l7bCtAw2yEtgJ
	 4Gy9gZcJeEtyVfi9E4+5VaLpVwnDM5uJvz3HhlC8=
In-Reply-To: <CAF1_xX2Np35vKHvqmCu-7yVFOm=CQEJPxw8BdUObAP94omWrog@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ronald <ronald645@gmail.com>
Cc: netfilter@vger.kernel.org

On Sun, 2011-10-23 at 14:29 +0200, Ronald wrote:
> (Please cc me as I'm not subscribed to this list.)
>=20
> Hello netfilter enthousiasts,
>=20
> I'm seeing a problem which is highly probably related to netfilter. I
> asked around on several forums, but have never received an answer. So
> therefore, my last option is this mailing list. Hence this mail.
>=20
> After a rather lengthy struggle with the IPSEC stack, I managed to ge=
t
> my IPSEC VPN working.

Is there any way you can you try it without IPSEC?

>  The next step was to properly secure it with
> netfilter.

Okay, so if it's running in a VPN, do you really need to "secure" it by
changing the port number? Am I missing something?

>  However, when trying to use the setup from university,
> something went wrong. The cause is the fact that I try to use port
> redirection to prevent charon from listening on the default udp port
> 500. Charon is the IPSEC IKEv2 daemon. As far as I'm aware, there is
> no way of configuring the listening port for charon, hence I tried to
> use netfilter for this. So we have this:
>=20
> On the client:
> iptables -t nat -A OUTPUT -p udp --dport 500 -j DNAT --to-destination
> :56301 (--persistent)
>=20
> On the server:
> iptables -t nat -A PREROUTING -p udp --dport 56301 -m addrtype
> --dst-type LOCAL -j REDIRECT --to-port 500
> or, as a viable alternative (yet having the exact same failing outcom=
e):
> iptables -t nat -A PREROUTING -p udp --dport 56301 -m addrtype
> --dst-type LOCAL -j DNAT --to-destination :500 (--persistent)

I assume that you have the relevant rules for the returning packets?

> When using tcpdump, it seems to fail when the server sends a respons
> back to the cli=C3=ABnt (my external telfort ip is obfuscated):

Do you really need to obfuscate? It just complicates your post.

>=20
> For clarity:
>=20
> Server --- Home Gateway --- --- --- The Internet --- --- ---
> University Gateway --- Client
>=20
> - Client: 130.37.154.14 is the local ip assigned to wlan0 when I'm at
> the university, which is also my external ip
> - Home Gateway: 144-144-144-144.ip.telfort.nl:56301 is the external i=
p
> of my home network with port 56301 redirecting to Server:
> 10.1.9.253:56301
>=20
> Client:
> 17:05:48.523138 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], prot=
o
> UDP (17), length 788) 130.37.154.14.isakmp >
> 144-144-144-144.ip.telfort.nl.56301: [|isakmp]
> 17:05:50.523711 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], prot=
o
> UDP (17), length 788) 130.37.154.14.isakmp >
> 144-144-144-144.ip.telfort.nl.56301: [|isakmp]
> 17:05:52.524039 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], prot=
o
> UDP (17), length 788) 130.37.154.14.isakmp >
> 144-144-144-144.ip.telfort.nl.56301: [|isakmp]
> 17:05:54.524365 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], prot=
o
> UDP (17), length 788) 130.37.154.14.isakmp >
> 144-144-144-144.ip.telfort.nl.56301: [|isakmp]
>=20
> Server:
> 17:05:44.794566 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], prot=
o
> UDP (17), length 29) 10.1.9.253.56301 > 130.37.154.14.isakmp: [udp su=
m
> ok] [|isakmp]
> 17:05:44.817648 IP (tos 0x0, ttl 57, id 0, offset 0, flags [DF], prot=
o
> UDP (17), length 788) 130.37.154.14.isakmp > 10.1.9.253.56301:
> [|isakmp]
> 17:05:44.819641 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], prot=
o
> UDP (17), length 493) 10.1.9.253.56301 > 130.37.154.14.isakmp:
> [|isakmp]
> 17:05:46.925299 IP (tos 0x0, ttl 57, id 0, offset 0, flags [DF], prot=
o
> UDP (17), length 788) 130.37.154.14.isakmp > 10.1.9.253.56301:
> [|isakmp]
> 17:05:46.926450 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], prot=
o
> UDP (17), length 493) 10.1.9.253.56301 > 130.37.154.14.isakmp:
> [|isakmp]

> It seems that the responses from the server are dropped somewhere. Th=
e
> client never receives them. And so, these lines go on forever. I have
> raw packet dumps ready if anyone would like to see those.

There's been some posts about tcpdump on here before. I can't remember
exactly where it fits into the networking system, but I would have
thought that it would be at the end, in which case if the packets are
leaving the server interface but not arriving at the client interface,
then your answer is a problem with the bearer in between.=20

>=20
> However, things get even more confusing. It turns out, that if:
> - I connect from university using wireless, the IP assigned to my
> wireless interface (wlan0) equals the ip reported on
> http://whatismyipaddress.com/
> - I connect from university using a lan, the IP assigned to my
> ethernet interface (eth1) does not equal the ip reported on
> http://whatismyipaddress.com/
>=20
> That means that wireless is just forwarded, while ethernet is NAT-ed,
> by the University Gateway. Is this conclusion correct?
>=20
> This seems relevant because if:
> - I connect from university using wireless (apparently without NAT)
> and applying port redirection: connection fails

Agree that's strange, but no idea why. All I can think is it's an issue
with the wireless network...

> - I connect from university using wireless (apparently without NAT)
> and not applying port redirection: connection succeeds
> - I connect from university using cable (apparently with NAT) and
> applying port redirection: connection succeeds
> - I connect from university using cable (apparently with NAT) and not
> applying port redirection: connection succeeds

=2E..especially as it works over the cable connection, albeit with NAT.

Andy


