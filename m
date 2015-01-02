From: Stig Thormodsrud <stig@ubnt.com>
Subject: Re: Parsing conntrack entries
Date: Thu, 1 Jan 2015 16:26:31 -0800
Message-ID: <CAL-yc890hQjr0TnH3B4CFks_=1RCTHOABiKA+YkmC17vQpGR-Q@mail.gmail.com>
References: <54A5C6CE.6090409@conversis.de>
	<m84nn2$mv7$1@ger.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <m84nn2$mv7$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karsten Hohmeier <karsten.hohmeier@tu-ilmenau.de>
Cc: netfilter@vger.kernel.org

I wrote this script to parse nat translations, maybe it could be a
starting point.
https://github.com/vyos/vyatta-nat/blob/lithium/scripts/vyatta-nat-translations.pl

On Thu, Jan 1, 2015 at 4:10 PM, Karsten Hohmeier
<karsten.hohmeier@tu-ilmenau.de> wrote:
> Hi Dennis,
>
>> What is the best way to parse this information in a reliable way?
>
> Maybe you could try dumping the table in XML as mentioned by the manpage?
>
> conntrack -L -o xml
>     Dump the connection tracking table in XML
>
> Best Regards
>
> Karsten
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
