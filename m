From: Christoph Paasch <christoph.paasch@gmail.com>
Subject: Re: IP Forwarding works on local port but not a remote port
Date: Fri, 5 Feb 2010 22:10:03 +0100
Message-ID: <201002052210.03815.christoph.paasch@gmail.com>
References: <81ed8b881002050747s73a79b0fqcb35ac2d15f3ddfd@mail.gmail.com> <81ed8b881002051204q42413b75p6e83564f055a35aa@mail.gmail.com> <81ed8b881002051246i241b325mac3463efce13e151@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=1GGigkYAMfb5NvuQE0UJacCJiDWN5NIIxKbPBLkMu24=;
        b=HbolXUABCEl/PcYn06fnSVTU+LQiQpzagPk2gXvmuNFGXLcQaU0mUDZ9c6isouXsph
         rvQ6yj2rvvkk5DKRbn57bkd7c2mm5Rnil45mH8FOl/01keFgRvYVoYkNHwwU05HXnzpv
         iX0TZPDfiNxFk08lRvXNH5AkP8N52bd/D5OvM=
In-Reply-To: <81ed8b881002051246i241b325mac3463efce13e151@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Dan Daugherty <rescue@ddaniscool.com>
Cc: =?utf-8?b?0J/QvtC60L7RgtC40LvQtdC90LrQviDQmtC+0YHRgtC40Lo=?= <casper@meteor.dp.ua>, netfilter@vger.kernel.org

MASQUERADE is just the same as SNAT. The only difference is, that it takes its 
src-ipaddress dynamically from the interface.

It should work also with the rule
iptables -t nat -A POSTROUTING -j SNAT --to-source [ip of your router]

In fact, iptables recommends using SNAT, when you have a static ip address on 
your router.

In fact, in the previous posts we all messed up a little bit with the changing 
IP-addresses and ports that were not consistent.


On Fri 5 February 2010 wrote Dan Daugherty:
> Well, I ended up figuring it out.  I swear I tried this early on
> because this is how I wanted it to work in the first place.
> 
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> iptables -t nat -A PREROUTING -p tcp --dport 1524 -i eth0 -j DNAT --to
> 10.117.1.203:1524
> 
> That is all I needed.  The machine sits behind another firewall so
> none of the other chains are necessary.  Thanks for all the help.
> 
> Dan
> 
> On Fri, Feb 5, 2010 at 3:04 PM, Dan Daugherty <rescue@ddaniscool.com> wrote:
> > Forgot to mention I'm on a Redhat Enterprise Linux 5 box with the
> > stock kernel.  Tried to compile my own and the build fails
> > immediately.  I assumed that since I can route requests locally, the
> > kernel was compiled properly for iptables.
> >
> > On Fri, Feb 5, 2010 at 3:01 PM, Dan Daugherty <rescue@ddaniscool.com> 
wrote:
> >>> Are you using /16 netmask?
> >>
> >> No, I just took the 10.117 part off the ip's to shorten the message.
> >>
> >>> None of them got SNATed. Why? Should they go out through eth0? Try to
> >>> remove "-o eth0".
> >>
> >> Removed it and no change
> >>
> >>> Also do you have ip.forwarding enabled (sysctl -a | grep forward")?
> >>
> >> net.ipv6.conf.eth0.forwarding = 0
> >> net.ipv6.conf.default.forwarding = 0
> >> net.ipv6.conf.all.forwarding = 0
> >> net.ipv6.conf.lo.forwarding = 0
> >> net.ipv4.conf.eth0.mc_forwarding = 0
> >> net.ipv4.conf.eth0.forwarding = 1
> >> net.ipv4.conf.lo.mc_forwarding = 0
> >> net.ipv4.conf.lo.forwarding = 1
> >> net.ipv4.conf.default.mc_forwarding = 0
> >> net.ipv4.conf.default.forwarding = 1
> >> net.ipv4.conf.all.mc_forwarding = 0
> >> net.ipv4.conf.all.forwarding = 1
> >>
> >>> Can you reach 10.117.1.205:1521 from sethra (telnet 10.117.1.205 1521)?
> >>
> >> Negative, but the command from sethra fails immediately with nothing
> >> showing in the logs
> >>
> >> There has also been mention of a FORWARD chain being necessary.  I
> >> haven't done anything outside of the commands listed in this thread.
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

--
Christoph Paasch

Alcatel-Lucent
IP Development

www.rollerbulls.be
--
