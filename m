From: Devin Bayer <dev@doubly.so>
Subject: meter directive
Date: Fri, 4 Sep 2020 10:38:55 +0200
Message-ID: <2781f10c-a5e5-0bdc-b701-617f9476c57b@doubly.so>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=doubly.so; s=MBO0001;
        t=1599208738;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=cb+i56YGpwf2orTo4h1r0lIje962Sv/5WxINY+RpKso=;
        b=YERcz+44h4OfwV184j63YxCISove07UWHjr6ie92/lMjfsXocKmEoL7HQDnEntiRweiQ4j
        2lbTArdOpSQPeZDRHCD+AoLRtSOcZa01jYeHvaolsp6qstZ+Owc77MujrXzScFtFLzVSre
        nDnhLurr8XZbLjXeu8Ecb6b2kyvCbfgQEaHJSHOpYMAzErAjEo8/E7+dNBwknW/0c2Lm4n
        gy8q2etROQ9IUQUIikq0uElm2Z5NGVwS2NQ9D6PXQLdR8M0Y3JJrVGBxZQ/6OCno441dT+
        7IzoCBw5A08+qd3bNNxvknT0xPRHrnpDAMlbULDac+V4l/mS14vZbssjyA5uVw==
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I am looking for some docs on the `meter` directive. Should it still be 
used instead of `map` or `set` and what are the arguments?

I see it's used in examples in the man page and also on this page:

    https://wiki.nftables.org/wiki-nftables/index.php/Meters

However the example does not work as described. When I do

     nft list map my_filter_table my_ssh_meter

I don't get the output like is described. First, it's a "set", not a 
"map", so I just see "Error: No such file or directory". But when 
changing to "list set", I don't see the counters:

table ip my_filter_table {
	set my_ssh_meter {
		type ipv4_addr . inet_service
		size 1000
		flags dynamic,timeout
		elements = {
	3.10.95.11 . 22 expires 14s492ms limit rate 10/second,
	3.123.217.208 . 22 expires 38s596ms limit rate 10/second,
	...}
     }
}

1) I wondering if someone can clarify.
2) If meter is obsolete, as the wiki suggests, can the examples in the 
man page be updated?
3) If meter isn't obsolete, can it's usage be added to the man page?

I am using nftables v0.9.6 on kernel 5.7.0.


Thanks,
Devin
