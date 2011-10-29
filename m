From: Andrew Beverley <andy@andybev.com>
Subject: Re: Redirecting ports with netfilter: unexpected varying results
 possibly correlated with NAT
Date: Sat, 29 Oct 2011 23:59:26 +0100
Message-ID: <1319929166.2993.100.camel@steve-pc>
References: <CAF1_xX2Np35vKHvqmCu-7yVFOm=CQEJPxw8BdUObAP94omWrog@mail.gmail.com>
	 <1319669075.26402.6892.camel@andybev-desktop>
	 <CAF1_xX3Qwc_d2q9KLQqHcoXmS0hd+xUvNwOVkbK7zWASShxTbw@mail.gmail.com>
	 <1319696663.26402.6931.camel@andybev-desktop>
	 <CAF1_xX3-AOvXDhieJe6Wdw_v8GCwgW_5Q0UNN6bnaR_58citZQ@mail.gmail.com>
	 <1319912591.2993.8.camel@steve-pc>
	 <CAF1_xX1dEMaGr+GhdPky-Efdh=nXof4ZS4NvmpnuL-xannZkSw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1319929169;
	bh=LPXEq1c6bfRcOo/ELmqqCKkO73LDt1ABy8NtUbxanl4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=Yt5XDhN4j+rESy+atD+Bs7FFAaeqklCXD3HsLoG006cFGAw+MgVf7S6rKz6s2k6Kj
	 tM6+UG/vs1mQP+Wx7vfWiY1po2aCHkPAcP/AvMRChc3fHef+DWWlJm3JgV9+i17SoU
	 BqeBH7rki46rUD0o/kubbV66au6iRDsx6sJNSBsI=
In-Reply-To: <CAF1_xX1dEMaGr+GhdPky-Efdh=nXof4ZS4NvmpnuL-xannZkSw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ronald <ronald645@gmail.com>
Cc: netfilter@vger.kernel.org

On Sat, 2011-10-29 at 22:10 +0200, Ronald wrote:
> > On Thu, 2011-10-27 at 08:45 +0200, Ronald wrote:
> >> >> > I assume that you have the relevant rules for the returning packets?
> >> >>
> >> >> What you see above is the entire iptables configuration that is
> >> >> relevant for port redirection. I made these based on examples from the
> >> >> internet. In order to redirect a port, you have to apply 1 rule to the
> >> >> client and 1 rule to the server.
> >> >
> >> > For packets going in one direction, yes. But surely you need similar
> >> > rules from the server back to the client? That said, it's probably
> >> > working (with the cable connection) because you're not doing it at
> >> > either end, so the packets are using the default ports.
> >>
> >> No I don't. If I redirect packets from the client that originally go
> >> to udp/500 to udp/56301 (for example).
> >
> > Okay, I don't know VPN, but assuming that the return packets originate
> > from the server's port 500, then these will not have the port number
> > changed using your rules.
> 
> That is a correct observation, but not the point. I redirect packets
> so that they can reach the server, without using udp port 500. And now
> they do. I don't care how they leave. For the server, incoming packets
> that target udp port 56301 are being redirected to udp port 500. How
> they are send back, I don't care.

So are you saying that they are sent back from a different port than
they arrive at?

> >>  I can even add the following
> >> line to my server. (This is in the case I use port redirection. Then I
> >> use this line to make it an effective security enhancement):
> >>
> >> iptables -I PREROUTING -t raw -p udp --dport 500 -j DROP
> >
> > Yes, but the packets originating from the server will not pass through
> > the PREROUTING chain.
> 
> Correct, they go through POSTROUTING (all packets do), and OUTPUT
> (because these packets are locally generated). This is consistent with
> Jan Engelhardt's response.
> 
> >> If I use a cable, the connection succeeds. If port redirection would
> >> fail, this rule would catch it and make a connection impossible. So I
> >> can conclude that port redirection works as expected when using a
> >> cable.
> >
> > Maybe your cable connection has a firewall that is only allowing related
> > packets to return? Thus, if it sees the packets destined to the server
> > for port 56301 and returning from port 500 then it may not associate
> > them and thus drop them.
> 
> That is correct. And that is exactly what makes these symptoms so
> confusing. Because, if I use a cable, there is another gateway that
> applies NAT. And if I use port redirection using the cable, it works.
> 
> Conclusion: If the packets were not properly associated, this setup
> shouldn't function as well.

I would be inclined to agree, although the network device doing the NAT
is different to "whatever" is on the wireless network, and this could be
using different connection tracking techniques.

> 
> Which is consistent with the idea that something in 'between' is doing
> something 'weird'.
> 
> >> Besides, I designed my netfilter configuration to not differentiate
> >> between interfaces. I use the addrtype extension, works better.
> >
> > I like that, but remember that any packets leaving the server will only
> > traverse the OUTPUT and POSTROUTING chains. They therefore are not
> > affected by any of the iptables rules that you previously posted.
> 
> Could be. But if you look at the tcpdump snippets:
> 
> Client:
> 17:05:48.523138 IP 130.37.154.14.isakmp >
> 144-144-144-144.ip.telfort.nl.56301: [|isakmp]
> 17:05:50.523711 IP 130.37.154.14.isakmp >
> 144-144-144-144.ip.telfort.nl.56301: [|isakmp]
> 17:05:52.524039 IP 130.37.154.14.isakmp >
> 144-144-144-144.ip.telfort.nl.56301: [|isakmp]
> 
> If the rule failed to work, then it would be:
> 144-144-144-144.ip.telfort.nl.isakmp (which is not the case).
> So I can conclude that the first rule functions properly.

I have no doubt that your rules to route packets to the server are
working correctly.

> Server:
> 17:05:44.794566 IP 10.1.9.253.56301 > 130.37.154.14.isakmp: [|isakmp]
> 17:05:44.817648 IP 130.37.154.14.isakmp > 10.1.9.253.56301: [|isakmp]
> 17:05:44.819641 IP 10.1.9.253.56301 > 130.37.154.14.isakmp: [|isakmp]
> 17:05:46.925299 IP 130.37.154.14.isakmp > 10.1.9.253.56301: [|isakmp]

All that said, it does appear that the packets are leaving the same port
that they are arriving at, which contradicts our statements above.

> If the rule failed to work, then packets designated for udp port 56301
> would be delived to udp/56301. There is nothing listening on that
> port, so there would be no UDP packet responses.
> 
> If you look at the output of tcpdump, you can see that this is not the
> case. Outgoing packets are redirected to sender. So I can conclude
> that both rules function properly.
> 
> Keep in mind, this setup (with port redirection) works if, for
> example, I use my phone as a modem. Or if I use a cable at the
> University. But not with wireless.

I understand that. My point was that if the wireless connection is only
allowing "related" packets through, and if the ports are completely
different between send and receive, then it could be dropping them.


