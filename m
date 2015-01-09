From: Kristian Evensen <kristian.evensen@gmail.com>
Subject: Re: Stateless NAT with iptables
Date: Fri, 9 Jan 2015 20:14:53 +0100
Message-ID: <CAKfDRXgQJ8zkyBjdyhLFCgpV7z7yiR497G7XOTubM5y2rYxDMg@mail.gmail.com>
References: <SNT152-W84CAD14ACDD2F149C65D88B8440@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=YccJpmDKl9FjhkgkIV+sgpFzO8ezb+ZNPU9uFkTbwtk=;
        b=uxzcoZeomGTSGATw6FJ97Th20LqUxpNVyYbpQ+vpjN9lbD4bagMYvj1qitWBQAweDl
         4goATr0VEM5t5kX8LMB+b3CIeTgwvsAtC6+wnuo+3iITD1soUNN117do/NAT+Oi2Fvws
         yHLqEdwTva4YN8EjblGP3LrEs6edmZ4sqHh2lCFyaYxPJScPreDC1q1Yv5T8dSStA+c6
         Uas9yxnBX1KyIqO9lbWmX6g0TYY5Z5tk6sEoXeor27FQ8emMRr20chmJ4Gopwj+igc3x
         vhizA7VemSBZH7O6SXZMZothwDP1I9uxQxuGEsSoKT9gYAIHdd59SirNNQZP8S8Iw5qB
         3zNw==
In-Reply-To: <SNT152-W84CAD14ACDD2F149C65D88B8440@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glen Miner <shaggie76@hotmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,

On Fri, Jan 9, 2015 at 7:38 PM, Glen Miner <shaggie76@hotmail.com> wrote:
>
> After a day of hacking around and trolling the internet I'm more or less convinced this isn't possible with iptables but I figured I should ask in case I missed something.
>
> What we're trying to do is set up UDP NAT proxy for a pair of clients on demand.
>
> The mappings are preceded by some application layer traffic used to figure out where the mapping should go -- we're essentially trying to use the netfilter stack to do a blazing fast STUN/TURN server with no packet overhead. We need to bounce a few packets around on the ports we're going to proxy because this is how we figure out the remote peer address & ports we'll need to bind together.
>
> In my prototype this works but there's a problem: nf_conntrac gets in the way of the hand-off between the application layer socket and the NAT rule. I've tried telling iptables to go stateless:
>
> iptables -t raw -F
>
> iptables -t raw -I PREROUTING -j NOTRACK
> iptables -t raw -I OUTPUT -j NOTRACK
>
> But of course this means that none of my -t nat rules are checked; I've read the documentation several times now and I can't seem to find a way to have my cake and eat it too.
>
> In more detail here's how it currently works (and what goes wrong):
>
> Alice sends a message to the relay server saying "can you help me talk to Bob?" (the mechanics of this communication channel are unimportant)
>
> The relay server binds a pair of UDP sockets $anPort and $bnPort to be used for the proxy on $nAddr and tells
>
> Alice: send me a packet to $nAddr:$bnPort so I can figure out how your router NATs to that endpoint
> - this gives us $aAddr and $aPort
>
> Bob: send me a packet to $anPort
> - this gives us $bAddr and $bPort
>
> With that, the server then has enough information to create the following rules
>
> # A->B
> iptables -t nat -I PREROUTING -p udp -s $aAddr --sport $aPort -d $nAddr --dport $bnPort -j DNAT --to $bAddr:$bPort
> iptables -t nat -A POSTROUTING -p udp -d $bAddr --dport $bPort -j SNAT --to $nAddr:$anPort
> iptables -t nat -I OUTPUT -p udp -s $aAddr --sport $aPort -d $nAddr --dport $bnPort -j DNAT --to $bAddr:$bPort
>
> # B->A (NOTE: these are not needed per se if Alice sends a packet to Bob first)
> iptables -t nat -I PREROUTING -p udp -s $bAddr --sport $bPort -d $nAddr --dport $anPort -j DNAT --to $aAddr:$aPort
> iptables -t nat -A POSTROUTING -p udp -d $aAddr --dport $aPort -j SNAT --to $nAddr:$bnPort
> iptables -t nat -I OUTPUT -p udp -s $bAddr --sport $bPort -d $nAddr --dport $anPort -j DNAT --to $aAddr:$aPort
>
> And now as far as Alice is concerned Bob is at $nAddr:$bnPort and as far as Bob is concerned Alice is at $nAddr:$anPort
>
> We can technically close the sockets we used to discover the bind points -- they aren't needed any more -- but here's the rub: nf_conntrack_udp_timeout seconds has to elapse with NO traffic from Alice or Bob to the bind ports; evidently there is a connection kicking around that is preventing the NAT rules I added from taking over and the system default is 30 seconds.
>
> I can see the connection with this command:
>
> conntrack -L --proto udp --dport=$anPort
>
> Until this times out I get no joy and any stray packet from the respective peer will reset the countdown.
>
> There are two workarounds I can think of:
>
> 1) reduce nf_conntrack_udp_timeout
> 2) try a conntract -D command to clear the connection
> 3) before binding the local sockets I create rules to NOTRACK them while they're in userland
>
> The fourth option that I dream of, however, is a "please don't bother with nf_conntrack, I really don't need it, honest" -- this would be the ideal case but try as I might I can't find any way to make this work. NOTRACK means no -t nat and you can't rewrite source or dest headers without -t nat.
>
> Here's why I'd really like to ditch conntrack: it's a waste of resources for us. In fact, when we get up to around 40,000 users on a server (not doing this NAT stuff, just doing other things), the conntrack table can overflow and cause all kinds or problems. I could be wrong but I'm pretty confident we don't need it for anything -- our firewall rules can be really simple.
>
> I read some of the new nftables documentation but as far as I can tell it's still doing the same hooks and doesn't get me any closer to success. As far as I can tell I can't escape conntrack for what I'm doing.
>
> If you've read this far, thanks for reading; if you have any light to shed, thanks in advance!
>
> -g

I was recently working on something similar. My solution was to
combine NOTRACK with RAWDNAT/RAWSNAT in the raw/rawpost-tables. Of
course, this requires that you manage timeouts yourself. The raw table
is part of iptabes (iptables-extension?) but rawpost, RAWDNAT and
RAWSNAT requires xtables-addons and that you revert commit
9414a5df343bf30ba13e76dbd7181c55683b11cb.

I hope this helps!

-Kristian
