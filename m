From: Ronald <ronald645@gmail.com>
Subject: Redirecting ports with netfilter: unexpected varying results possibly
 correlated with NAT
Date: Sun, 23 Oct 2011 14:29:54 +0200
Message-ID: <CAF1_xX2Np35vKHvqmCu-7yVFOm=CQEJPxw8BdUObAP94omWrog@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=3fSYnUA5FXyKDEciYFojVpU64hI8U8KqZS9a4dUO+Eo=;
        b=UJ18bXYavnKN/TdM46Aqz0BftllucOCaOWwB11+WcFrmIrW9VtGs1Kofh7eows5w/Y
         MwEkprSiPGFistIE5/Oe1TpizPghvgfpFlsaw5oSCGi0QHAkaa4F2sOXyi5u4c0JzcK1
         PASmMNoB7/De2117z+4bsODJnbPDOm8rLHbcc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

(Please cc me as I'm not subscribed to this list.)

Hello netfilter enthousiasts,

I'm seeing a problem which is highly probably related to netfilter. I
asked around on several forums, but have never received an answer. So
therefore, my last option is this mailing list. Hence this mail.

After a rather lengthy struggle with the IPSEC stack, I managed to get
my IPSEC VPN working. The next step was to properly secure it with
netfilter. However, when trying to use the setup from university,
something went wrong. The cause is the fact that I try to use port
redirection to prevent charon from listening on the default udp port
500. Charon is the IPSEC IKEv2 daemon. As far as I'm aware, there is
no way of configuring the listening port for charon, hence I tried to
use netfilter for this. So we have this:

On the client:
iptables -t nat -A OUTPUT -p udp --dport 500 -j DNAT --to-destination
:56301 (--persistent)

On the server:
iptables -t nat -A PREROUTING -p udp --dport 56301 -m addrtype
--dst-type LOCAL -j REDIRECT --to-port 500
or, as a viable alternative (yet having the exact same failing outcome)=
:
iptables -t nat -A PREROUTING -p udp --dport 56301 -m addrtype
--dst-type LOCAL -j DNAT --to-destination :500 (--persistent)

When using tcpdump, it seems to fail when the server sends a respons
back to the cli=EBnt (my external telfort ip is obfuscated):

=46or clarity:

Server --- Home Gateway --- --- --- The Internet --- --- ---
University Gateway --- Client

- Client: 130.37.154.14 is the local ip assigned to wlan0 when I'm at
the university, which is also my external ip
- Home Gateway: 144-144-144-144.ip.telfort.nl:56301 is the external ip
of my home network with port 56301 redirecting to Server:
10.1.9.253:56301

Client:
17:05:48.523138 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], proto
UDP (17), length 788) 130.37.154.14.isakmp >
144-144-144-144.ip.telfort.nl.56301: [|isakmp]
17:05:50.523711 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], proto
UDP (17), length 788) 130.37.154.14.isakmp >
144-144-144-144.ip.telfort.nl.56301: [|isakmp]
17:05:52.524039 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], proto
UDP (17), length 788) 130.37.154.14.isakmp >
144-144-144-144.ip.telfort.nl.56301: [|isakmp]
17:05:54.524365 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], proto
UDP (17), length 788) 130.37.154.14.isakmp >
144-144-144-144.ip.telfort.nl.56301: [|isakmp]

Server:
17:05:44.794566 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], proto
UDP (17), length 29) 10.1.9.253.56301 > 130.37.154.14.isakmp: [udp sum
ok] [|isakmp]
17:05:44.817648 IP (tos 0x0, ttl 57, id 0, offset 0, flags [DF], proto
UDP (17), length 788) 130.37.154.14.isakmp > 10.1.9.253.56301:
[|isakmp]
17:05:44.819641 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], proto
UDP (17), length 493) 10.1.9.253.56301 > 130.37.154.14.isakmp:
[|isakmp]
17:05:46.925299 IP (tos 0x0, ttl 57, id 0, offset 0, flags [DF], proto
UDP (17), length 788) 130.37.154.14.isakmp > 10.1.9.253.56301:
[|isakmp]
17:05:46.926450 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], proto
UDP (17), length 493) 10.1.9.253.56301 > 130.37.154.14.isakmp:
[|isakmp]

It seems that the responses from the server are dropped somewhere. The
client never receives them. And so, these lines go on forever. I have
raw packet dumps ready if anyone would like to see those.

However, things get even more confusing. It turns out, that if:
- I connect from university using wireless, the IP assigned to my
wireless interface (wlan0) equals the ip reported on
http://whatismyipaddress.com/
- I connect from university using a lan, the IP assigned to my
ethernet interface (eth1) does not equal the ip reported on
http://whatismyipaddress.com/

That means that wireless is just forwarded, while ethernet is NAT-ed,
by the University Gateway. Is this conclusion correct?

This seems relevant because if:
- I connect from university using wireless (apparently without NAT)
and applying port redirection: connection fails
- I connect from university using wireless (apparently without NAT)
and not applying port redirection: connection succeeds
- I connect from university using cable (apparently with NAT) and
applying port redirection: connection succeeds
- I connect from university using cable (apparently with NAT) and not
applying port redirection: connection succeeds

Conclusion: Using wireless, which is not NAT-ed, port redirection
seems to fail. Responses to the client are dropped somewhere along the
way.

Why? I have absolutely no clue of what causes these symptoms or why
this does not work. Does anyone here have an idea?

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 Thanks, Ronald
