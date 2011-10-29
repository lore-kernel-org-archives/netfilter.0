From: Ronald <ronald645@gmail.com>
Subject: Re: Redirecting ports with netfilter: unexpected varying results
 possibly correlated with NAT
Date: Sat, 29 Oct 2011 22:10:33 +0200
Message-ID: <CAF1_xX1dEMaGr+GhdPky-Efdh=nXof4ZS4NvmpnuL-xannZkSw@mail.gmail.com>
References: <CAF1_xX2Np35vKHvqmCu-7yVFOm=CQEJPxw8BdUObAP94omWrog@mail.gmail.com>
	<1319669075.26402.6892.camel@andybev-desktop>
	<CAF1_xX3Qwc_d2q9KLQqHcoXmS0hd+xUvNwOVkbK7zWASShxTbw@mail.gmail.com>
	<1319696663.26402.6931.camel@andybev-desktop>
	<CAF1_xX3-AOvXDhieJe6Wdw_v8GCwgW_5Q0UNN6bnaR_58citZQ@mail.gmail.com>
	<1319912591.2993.8.camel@steve-pc>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=UyP78yBMy4OKrpyiHHQcyC4liQMPMvWvnllJqJ+7qKU=;
        b=PumJrgRqz+5qDyfcYd7/ExYaOblZ+UchNKNim/SRFJs27AKwDm1KYHwLpMjQPoai9a
         P3dKyQzzZ6i4i7KqsMOa67XTaQ2t9a2fHPCiWPZSOJx04q1CLx7gAH2XdtK7eFxLNr5C
         DLXsf7FCYeR/18vtYoQAq2QvKzD5Vhaxxa5bg=
In-Reply-To: <1319912591.2993.8.camel@steve-pc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

> On Thu, 2011-10-27 at 08:45 +0200, Ronald wrote:
>> >> > I assume that you have the relevant rules for the returning pac=
kets?
>> >>
>> >> What you see above is the entire iptables configuration that is
>> >> relevant for port redirection. I made these based on examples fro=
m the
>> >> internet. In order to redirect a port, you have to apply 1 rule t=
o the
>> >> client and 1 rule to the server.
>> >
>> > For packets going in one direction, yes. But surely you need simil=
ar
>> > rules from the server back to the client? That said, it's probably
>> > working (with the cable connection) because you're not doing it at
>> > either end, so the packets are using the default ports.
>>
>> No I don't. If I redirect packets from the client that originally go
>> to udp/500 to udp/56301 (for example).
>
> Okay, I don't know VPN, but assuming that the return packets originat=
e
> from the server's port 500, then these will not have the port number
> changed using your rules.

That is a correct observation, but not the point. I redirect packets
so that they can reach the server, without using udp port 500. And now
they do. I don't care how they leave. For the server, incoming packets
that target udp port 56301 are being redirected to udp port 500. How
they are send back, I don't care.

>> =A0I can even add the following
>> line to my server. (This is in the case I use port redirection. Then=
 I
>> use this line to make it an effective security enhancement):
>>
>> iptables -I PREROUTING -t raw -p udp --dport 500 -j DROP
>
> Yes, but the packets originating from the server will not pass throug=
h
> the PREROUTING chain.

Correct, they go through POSTROUTING (all packets do), and OUTPUT
(because these packets are locally generated). This is consistent with
Jan Engelhardt's response.

>> If I use a cable, the connection succeeds. If port redirection would
>> fail, this rule would catch it and make a connection impossible. So =
I
>> can conclude that port redirection works as expected when using a
>> cable.
>
> Maybe your cable connection has a firewall that is only allowing rela=
ted
> packets to return? Thus, if it sees the packets destined to the serve=
r
> for port 56301 and returning from port 500 then it may not associate
> them and thus drop them.

That is correct. And that is exactly what makes these symptoms so
confusing. Because, if I use a cable, there is another gateway that
applies NAT. And if I use port redirection using the cable, it works.

Conclusion: If the packets were not properly associated, this setup
shouldn't function as well.

Which is consistent with the idea that something in 'between' is doing
something 'weird'.

>> Besides, I designed my netfilter configuration to not differentiate
>> between interfaces. I use the addrtype extension, works better.
>
> I like that, but remember that any packets leaving the server will on=
ly
> traverse the OUTPUT and POSTROUTING chains. They therefore are not
> affected by any of the iptables rules that you previously posted.

Could be. But if you look at the tcpdump snippets:

Client:
17:05:48.523138 IP 130.37.154.14.isakmp >
144-144-144-144.ip.telfort.nl.56301: [|isakmp]
17:05:50.523711 IP 130.37.154.14.isakmp >
144-144-144-144.ip.telfort.nl.56301: [|isakmp]
17:05:52.524039 IP 130.37.154.14.isakmp >
144-144-144-144.ip.telfort.nl.56301: [|isakmp]

If the rule failed to work, then it would be:
144-144-144-144.ip.telfort.nl.isakmp (which is not the case).
So I can conclude that the first rule functions properly.

Server:
17:05:44.794566 IP 10.1.9.253.56301 > 130.37.154.14.isakmp: [|isakmp]
17:05:44.817648 IP 130.37.154.14.isakmp > 10.1.9.253.56301: [|isakmp]
17:05:44.819641 IP 10.1.9.253.56301 > 130.37.154.14.isakmp: [|isakmp]
17:05:46.925299 IP 130.37.154.14.isakmp > 10.1.9.253.56301: [|isakmp]

If the rule failed to work, then packets designated for udp port 56301
would be delived to udp/56301. There is nothing listening on that
port, so there would be no UDP packet responses.

If you look at the output of tcpdump, you can see that this is not the
case. Outgoing packets are redirected to sender. So I can conclude
that both rules function properly.

Keep in mind, this setup (with port redirection) works if, for
example, I use my phone as a modem. Or if I use a cable at the
University. But not with wireless.

> Andy
>
>
>
