From: Andrew Beverley <andy@andybev.com>
Subject: Re: tc filter connmark
Date: Wed, 13 Aug 2014 16:14:16 +0100
Message-ID: <1407942856.9948.15.camel@andy-laptop>
References: <53EB7DA3.8020505@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <53EB7DA3.8020505@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1407942858;
	bh=8UCuPRjdO3pFF0LhBcr9vHdX+viZyN8PCSloFb+GFUA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version:Content-Transfer-Encoding;
	b=VoqyuduTLr25sGdCb6qJdKy6RzpYeGSsEOupMU5fmBeTDjXk5ZiaeMydQAsFWqRcy
	 U+nsLeY0yLhAPgvaENSEw9JiHu9ohDzpLzBHjusYoZIRXO5jiKUYNL0te5w1XjFi7A
	 gLo8S4BuUF2FNvQvIZn4Jw9zAEpQumoDvo224tV4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: George Amanakis <gamanakis@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, 2014-08-13 at 17:00 +0200, George Amanakis wrote:
> Dear All,
> 
> I would be glad if you could help me out. I am running the following 
> script:
> 
> -------------- cut - here -----------------
> 
> iptables -t mangle -N QOS
> iptables -t mangle -A FORWARD -o eth0 -j QOS
> iptables -t mangle -A OUTPUT -o eth0 -j QOS
> iptables -t mangle -A QOS -j MARK --set-mark 3
> 
> iptables -t mangle -A PREROUTING -m mark --mark 3 -j ACCEPT ### (counter)
> 
> tc qdisc add dev eth0 root handle 1: htb
> tc filter add dev eth0 parent 1: protocol ip prio 1 u32 \
>      match u32 0 0 classid :1 \
> action xt -j CONNMARK --save-mark
> 
> tc qdisc add dev eth0 ingress handle ffff:
> tc filter add dev eth0 parent ffff: protocol ip prio 1 u32 \
>      match u32 0 0 classid :1 \
> action xt -j CONNMARK --restore-mark
> 
> -------------- cut - here -----------------
> 
> Now if I insert (-I) in "PREROUTING" a "CONNMARK --restore-mark", my 
> counter shows that egress filter "tc filter ... parent 1: ... CONNMARK 
> --save-mark"marked them correctly.
> 
> However, if I remove the "CONNMARK --restore-mark" from "PREROUTING" my 
> counter shows no traffic. This means that the ingress filter "tc filter 
> ... parent ffff: ... CONNMARK --restore-mark" is not working.

If I've understood correctly, you're trying to restore a netfilter MARK
during ingress? If so, I'm not sure this will be possible, as any
ingress processing is done before the traffic hits the netfilter stack,
so it will have no knowledge of connection tracking:

http://inai.de/images/nf-packet-flow.svg

Happy to be corrected if I'm wrong!

Andy


