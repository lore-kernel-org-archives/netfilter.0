From: Florian Westphal <fw@strlen.de>
Subject: Re: bug report and future request
Date: Mon, 21 Mar 2022 22:27:50 +0100
Message-ID: <20220321212750.GB24574@breakpoint.cc>
References: <AE6DAC96-EC3E-43C9-A95A-B230842DD7B1@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AE6DAC96-EC3E-43C9-A95A-B230842DD7B1@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Zaharinov <micron10@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter <netfilter@vger.kernel.org>, netfilter-devel@vger.kernel.org, pablo@netfilter.org

Martin Zaharinov <micron10@gmail.com> wrote:
> if have 1k rule
> 
> table inet nft-qos-static {
>         chain upload {
>                 type filter hook postrouting priority filter; policy accept;
>                 ip saddr 10.0.0.9 limit rate over 12 mbytes/second burst 50000 kbytes drop
> .........
> ip saddr 10.0.0.254 limit rate over 12 mbytes/second burst 50000 kbytes drop
>         }

1k rules? Thats insane.  Don't do that.
There is no need for that many rules, its also super slow.

Use a static/immutable ruleset with a named set and then add/remove elements from the set.

table inet nft-qos-static {
	set limit_ul {
		typeof ip saddr
		flags dynamic
		elements = { 10.0.0.9 limit rate over 12 mbytes/second burst 50000 kbytes, 10.0.0.254 limit rate over 12 mbytes/second burst 50000 kbytes }
	}

	chain upload {
		type filter hook postrouting priority filter; policy accept;
		ip saddr @limit_ul drop
	}
}

static ruleset: no need to add/delete a rule:

nft add element inet nft-qos-static limit_ul "{ 10.1.2.4 limit rate over 1 mbytes/second burst 1234 kbytes  }"
nft delete element inet nft-qos-static limit_ul "{ 10.1.2.4 limit rate over 1 mbytes/second burst 1234 kbytes }"

You can add/delete multiple elements in { }, sepearate by ",".

