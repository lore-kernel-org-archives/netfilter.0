From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: NAT Port Forward problem in a not so simple network
Date: Tue, 27 Jan 2009 21:34:27 +0100
Message-ID: <20090127213427.54f5ee07@catlap>
References: <497F5C18.8010703@naxe.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <497F5C18.8010703@naxe.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabio De Paolis <fabiodepaolis@naxe.it>
Cc: netfilter@vger.kernel.org

>Hi to all,

Hi,

>This limit should be for upstram and dowstream
>I searched around and have read a lot about:
>shaper, wondershaper, tc, qdisc, etc.
>But I'm not sure what are pro and cons of each method.
>I'm sure you can tell more!

I recommend using tc tool[1]& IFB device[2] & htb qdisc[3] & u32
filter[4] for the job. Following page contains HTB user guide with
examples[5]. Building configuration to suit your needs shouldn't be too
hard. If you have any problems just ask.

General idea:
- Let's assume eth0 is your upstream interface (to Internet) that you do
NAT on and eth1 is downstream interface connected to servers,
- Downstream shaping would be done on eth1,
- Ingress traffic on eth1 would be redirected to ifb0 [2],
- Upstream shaping would be done on ifb0 (source addresses of
traffic from your servers would be pre-nat addresses, so no need for
iptables packet marking - u32 filter[4] is usable).

>And also about monitoring to see if it work:
>ntop, sntop, iptraf, etc.

tc tool[1] with specific parameters (eg. "tc -s -d class sh dev eth0")
can show you rates and pps of each class on specified interface.

Good luck in your endeavours.

[1] http://linux.die.net/man/8/tc
[2] http://www.linuxfoundation.org/en/Net:IFB
[3] http://linux.die.net/man/8/tc-htb
[4] http://tldp.org/HOWTO/Adv-Routing-HOWTO/lartc.adv-filter.u32.html
[5] http://luxik.cdi.cz/~devik/qos/htb/manual/userg.htm

Regards,
Marek Kierdelewicz
