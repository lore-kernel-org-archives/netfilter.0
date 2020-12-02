From: "Eliezer Croitor" <ngtech1ltd@gmail.com>
Subject: RE: re-routing multicast pkts after mangle table marking
Date: Wed, 2 Dec 2020 17:57:25 +0200
Message-ID: <002e01d6c8c3$d4fa4e00$7eeeea00$@gmail.com>
References: <CAGsPj3=Hchb0VW8nt=4cfKm2pxxnvC7zKyzW1f4sYQmmkXRaMg@mail.gmail.com> <X8aQRtjwMXfstjRr@flatwhite> <CAF4tN+_YNz+0iCQzW7Fd+P5ZkDkU5g95Jv5fdHPNcqhzWtOOng@mail.gmail.com> <X8bE6GMR6U37cfH/@flatwhite> <CAN_K0LS+U95rxmhCtiE3sX_hdjEQySnV1HBB9sF1qrrVAz0n-w@mail.gmail.com> <X8d5JZT5cmBFUvNA@flatwhite> <001f01d6c8a4$0faac590$2f0050b0$@gmail.com> <X8eKYjtPSINtYYnl@flatwhite>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=1TvEh1WLJ0RtN00/WqYx5pKVIse2ItKgyvIhMDB9T2w=;
        b=fv1T0GG1n8z6FiFWbr638dHOd5P2DOH95f/OoT+UiFo+f9O+kgMUlE3HGwoVZFsCWC
         R95OGWlKJNgcEzgGj5aEQLnm4ghotmCvmCdIlF8e0FbDQTyNKbMPxXJLz5tygdA8BbEI
         9er9OhM7gfWn6mwZj6iGy376dmxau2lMM6P4nojtl00xD/qzDGwH5n76VZbwK7ga5cHP
         0JcSjXSUHRo3US1XvdVTOr/8ZlClTzGuuDtpAIYSqSKOA0528+U/yR2RdlF9CsZUYZWx
         drDvQLJm0KxD04eIu+BFf0qDIkcUfjtHhpaIH1kHlo53NG5iUdMCHB/gQFCS2fX/lhlL
         IriA==
In-Reply-To: <X8eKYjtPSINtYYnl@flatwhite>
Content-Language: en-us
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Marcin Szewczyk' <marcin.szewczyk@wodny.org>
Cc: 'Fatih USTA' <fatihusta86@gmail.com>, 'Netfilter Users Mailing list' <netfilter@vger.kernel.org>

Thanks for taking the time to reply.

I have seen a similar "issue" with outgoing traffic generated locally.
From what I understand the diagram:
*
https://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.sv
g

Doesn't talk about locally generated traffic..
I can try to regenerate this issue to understand it better.

There is a big difference in the linux kernel routing cache since the time
of the test...
If you want to re-produce this issue you can try to use iperf3 instead of
iperf.
iperf3 -c 224.1.1.1 -u  -b 10k

Can you create a test lab using netns ?
You can see a fully automated example lab that I wrote at:
https://github.com/elico/mwan-nft-lb-example/blob/main/run-lab.sh

Or another lab examples can be seen at Vincent blog posts github repository:
https://vincent.bernat.ch/en/blog/2018-route-based-vpn-wireguard

I don't understand if there is something to verify at all..

Thanks,
Eliezer

----
Eliezer Croitoru
Tech Support
Mobile: +972-5-28704261
Email: ngtech1ltd@gmail.com

-----Original Message-----
From: Marcin Szewczyk <marcin.szewczyk@wodny.org> 
Sent: Wednesday, December 2, 2020 2:37 PM
To: Eliezer Croitor <ngtech1ltd@gmail.com>
Cc: 'Fatih USTA' <fatihusta86@gmail.com>; 'Netfilter Users Mailing list'
<netfilter@vger.kernel.org>
Subject: Re: re-routing multicast pkts after mangle table marking

On Wed, Dec 02, 2020 at 02:10:00PM +0200, Eliezer Croitor wrote:
> On Tue, Dec 01, 2020 at 07:49:43PM +0100, Marcin Szewczyk wrote:
> > Brian Aanderud on 23 Mar 2015 wrote:
> > > What must I do to get the multicast frames routed out a 'different'
> > > interface from the default one after applying a fwmark in iptables the
> > > routing table?  I am able to do this with unicast with a combination
> > > of 'ip rule', 'ip route' to a different table, and iptables to apply a
> > > 'mark'.  But, the marked multicast frames never seem to follow the
> > > other routing table's routes.
> > > [...]
> > 
> > I've stumbled upon the same problem as the one discussed over 5 years
> > ago (with no answer) on this mailing list[1], ie. locally generated
> > multicast and broadcast traffic do not seem to follow policy routing
> > when it is constructed using `iptables --set-mark` and `ip rule fwmark`.

> Just wondering, how can I reproduce this issue on my local network?

The configuration is actually in the message you quoted[1]. You do not
need a network adhering to any specific configuration to reproduce it.
It's a local phenomenon.

> First a broadcast address cannot be "routed" elsewhere then a
> connected network, there is no real "routing" so to speak.

Here routing is limited to the local machine. `ip rule dport` actually
produces positive results so there is a way to force broadcast traffic
to adhere to local routing rules even though the traffic is not going to
be routed on the next layer 3 hop.

In general -- broadcast and multicast traffic adheres to rules in any
table not guarded by the fwmark criterion.

> I do not know how the kernel looks at it but I assume it can only be sent
> towards a connected device such as:
> * ethernet
> * tunnel(these which support broadcast)

I am using my wifi interface but one can reproduce the experiments I
mentioned with a veth device as well:

    ip link add ve1 type veth peer ve2

> Also I am missing some of the thread emails so, What kernel are we talking
> about?
> Let say Debian/Ubuntu/RHEL/CentOS , what version? Etc..

I mentioned Debian Jessie (kernel 4.9) and Debian Buster (kernel 4.19).

> Reproducing is important to understand what the issue is.

As I mentioned -- configuration is in the quoted email[1] and in the
original email[2] (not mine) from 2015.

[1]: https://marc.info/?l=netfilter&m=160690828202259
[2]: https://marc.info/?l=netfilter&m=142714167809246

-- 
Marcin Szewczyk
http://wodny.org

