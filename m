From: Julien Vehent <julien@linuxwall.info>
Subject: Re: Netfilter and Iptables talk at AWeber
Date: Thu, 02 Aug 2012 12:01:20 -0400
Message-ID: <db887c8d7eef2e925dec079c0601b4e5@linuxwall.info>
References: <0191896170a6fdc7c917390b79464804@linuxwall.info>
 <alpine.LNX.2.01.1208021742120.10019@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=linuxwall.info;
	s=samchiel; t=1343923281;
	bh=VwCTWplDlhjfaZX2aX9Y9AqcRQv81Jyylncr6AXA46A=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=x+6bpIIOGP5azCWirTUJtpk5EQvIJNNCnapcx5U+uorSVirMNEsFHwmRrDzHojKN2
	 4SUO+I9/+1LokwMSstiiP2rl34F+b8lYk6ncv0A5O+A++lnOcetFh9QwLIIESoQmCW
	 D1OUmboj4hgo/v7xrCnDeq5sSMOhVyuQcQ0xrpXg=
In-Reply-To: <alpine.LNX.2.01.1208021742120.10019@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@vger.kernel.org>

On 2012-08-02 11:46, Jan Engelhardt wrote:
> On Wednesday 2012-08-01 23:34, julien wrote:
>>
>>I figured it would of interest to this list. I am also curious to get
>>feedback from the community, as I will be holding a Netfilter workshop
>>at Fosscon Philadelphia on August 11th. So if you have any comment,
>>please reply here, or to me directly.
>>
>>http://jve.linuxwall.info/blog/index.php?post/2012/08/01/Netfilter-and-Iptables-talk-at-AWeber
>
> For geoip blocking, there is also -m geoip from Xtables-addons.
>

I was more interested in ipset than I was in geoip. The latest is on my todo 
list though.

> AFW is not using -m conntrack though you used it earlier.
>

I need to make that change, and open source AFW. That's in the pipe.

>
> And a big grin for the christmas example.

There shall be no talk without cat. That's an AWeber motto :)
But I'm really considering that type of rule for some systems. Keep a ssh 
relay accessible at all time, but block direct SSH on servers themselves at 
night.

- Julien
