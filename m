From: Matt <matt-nft@mailtower.de>
Subject: minor change recommendation for https://wiki.nftables.org
Date: Fri, 04 Oct 2019 17:14:50 +0200
Message-ID: <59f4e1f10b66ae00008608ec2290dc63@mailtower.de>
References: <b99d882d69f5e152919339c65ac26163@mailtower.de>
 <20191004145813.GG13866@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mailtower.de x94FEok5025013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailtower.de; s=mail;
        t=1570202090; bh=VQ2mtwoLDO9u06Sqwnc1CZrhIHEhl8kV6NJ9bgGVsA0=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=c2y5WdwH3ScSYKo4VVitivDZMkp2KpMKzrDVqAtyQJHVIkWanohivhNxkrgEA0Jfc
         a7kJ0b1+HyCgWEFnuZTtO2UCIpXBvYp7383kO59YUwoIq2WMiVJY9+cSaDkwUX6M6W
         +uJotyU+f/NBljbhMwgZPsHa7NUhT1Qj/W+S2R9Q=
In-Reply-To: <20191004145813.GG13866@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org, netfilter-owner@vger.kernel.org

Dear nft team,
may i recommend a small change on the nft wiki on the page "Sets" ?
instead of
% nft add set filter saddrs {type ipv4_addr \; size 2 \;}

add the proto (valid ip or ip6)
% nft add set ip filter saddrs {type ipv4_addr \; size 2 \;}


because that had lead me into the below question

Cheers
Matt



On 2019-10-04 16:58, Florian Westphal wrote:
> Matt <matt-nft@mailtower.de> wrote:
>> However, doing the same with ipv6 doesn't work for me:
>> #nft add set filter_v6 my_drop \{type ipv6_addr \; flags timeout \;
>> elements=\{fda5:2c8a:af4c:a95e::64 timeout 60s\} \;\}
> 
> Try:
> nft add set ip6 filter_v6 ...
