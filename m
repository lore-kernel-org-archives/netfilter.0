From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: traffic shapping with squid in the middle
Date: Thu, 18 Nov 2010 18:46:34 +0100
Message-ID: <20101118184634.0e423e47@catus>
References: <423773.22919.qm@web62508.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <423773.22919.qm@web62508.mail.re1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Landy Landy <landysaccount@yahoo.com>
Cc: netfilter@vger.kernel.org

>Hello.

Hi,

>I've been experiencing some problems trying to shape our network
>bandwidth. We have a gw with squid doing the contents cache and would
>like to assign each client a fair bw trying to avoid sluggish
>connections. 
>...
>I've been trying to get this working for a while now but, can't get it.
>Please guide me to where I can find a light at the end of the tunnel
>since, that's how I feel: Have no way out.

You can use IFB [1] to shape upload traffic before it's "eaten" by
squid. Do this:

tc qdisc add dev eth1 ingress
tc filter add dev eth1 protocol ip parent ffff: prio 4 u32 match ip \
dst 0.0.0.0/0 flowid :1 action mirred egress redirect dev ifb0

... and now you can shape upload traffic on ifb0. Solution would work
ok with or without squid in the middle.

With this solution you won't be able to use mark based shaping
(prerouting marking is done after ingress shaping). You'll have to use
u32 tc classifier [2].

Good luck!

[1] http://www.linuxfoundation.org/collaborate/workgroups/networking/ifb
[2] http://tldp.org/HOWTO/Adv-Routing-HOWTO/lartc.adv-filter.u32.html

Best regards,
Marek
