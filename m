From: Patrick McHardy <kaber@trash.net>
Subject: Re: nf_conntrack_sip and nf_nat_sip can do this??
Date: Thu, 14 Jan 2010 11:51:09 +0100
Message-ID: <4B4EF71D.7010104@trash.net>
References: <20091214104526.93556bb1q7xj41s0@ek2pim.upc.edu>	<20100111132614.14651hiwfxvj3h8k@ek2pim.upc.edu>	<4B4D82E2.6090405@trash.net>	<20100113143859.18292p3kbz00a60g@ek2pim.upc.edu>	<4B4DD05A.4000606@trash.net> <20100114111329.216832szeqp9zdyc@ek2pim.upc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100114111329.216832szeqp9zdyc@ek2pim.upc.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rebeca.martinez-garcia@estudiant.upc.edu
Cc: netfilter@vger.kernel.org, vhuertas@indra.es, devel@thom.fr.eu.org

rebeca.martinez-garcia@estudiant.upc.edu wrote:
> I have been investigating and the registration process is done correctly:
> a private user inside the LAN sends the REGISTER to the Proxy via the
> gateway and it changes the private IP for the public IP. When the Proxy
> answers it, the gateway does the same but in the other way round.
> 
> It is during the INVITE that I have seen some problems.
> 
> When a private client sends an INVITE directed to a client outside the
> LAN (a public client) again it works ok. However, when a public client
> sends an INVITE to call a private client there is an error:
> 
> Public Client to my Proxy:
> INVITE sip:private_client@domain_name
>        From:caller@domain_name
>        To:callee@domain_name
>        contact: caller@10.1.x.x
> 
> The proxy talks with my server to know the location of the callee and it
> answers with the public IP of my gateway in a determined port. So the
> Proxy sends the invite to it:
> INVITE sip:private_client@10.1.x.y
>        From:caller@domain_name
>        To:callee@domain_name
>        contact: caller@10.1.x.x
> 
> And now the gateway redirects the invite to my private client but it
> DOES NOT change the R-URI. However, when the invite reaches the client,
> it answers with a "183 Session progress" and then it puts its correct
> contact:
> 183 SESSION PROGRESS
>        From:caller@domain_name
>        To:callee@domain_name
>        contact: callee@192.168.x.x
> 
> And now, in the following messages between the caller and the callee, it
> changes correctly the private address for the public one and in the
> other way round.
> It is as the gateway only starts to work correctly if the message comes
> from the LAN.

Please send me a binary tcpdump (-w file -s0) containing the
traffic of both the incoming and outgoing interface of the
NAT GW.

> I have checked the /proc/net/nf_conntrack_expect and it contains this:
> 
> 598000 l3proto = 2 proto=17 src=0.0.0.0 dst=10.1.x.x sport=0 dport=1061
> PERMANENT
> 597394 l3proto = 2 proto=17 src=0.0.0.0 dst=10.1.x.x sport=0 dport=1081
> PERMANENT
> 
> Is it correct that the source is 0.0.0.0 in both cases?

Yes, that's correct since you specified sip_direct_signalling=0.
