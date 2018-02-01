From: hdemir <hdemir@metu.edu.tr>
Subject: Re: nftables set - network/netmask
Date: Thu, 1 Feb 2018 10:50:53 +0300
Message-ID: <beb5146e-837f-fb5d-c766-e69547a6287f@metu.edu.tr>
References: <39fdc646-1ef4-a42c-c9f1-705c18b709ec@metu.edu.tr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <39fdc646-1ef4-a42c-c9f1-705c18b709ec@metu.edu.tr>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I found this conversation;

https://www.spinics.net/lists/netfilter/msg56947.html

It would be useful to have NET function as ipset has.


hash:net,net
hash:net,port,net
hash:net,iface

etc.

Thanks.





On 31-01-2018 10:25, hdemir wrote:
> Hi,
> 
> 
> I am trying to translate ipset to nftables; I could not add networks as
> below; How can I add block IP addresses to the set. Am I missing
> something? If not is it possible to add this function.
> 
> -------------------------
> add table filter
>         add set filter whitelist2 { type ipv4_addr . inet_proto .
> inet_service . ipv4_addr ;}
>         add element filter whitelist2 { \
>                 10.10.1.0/24 . tcp . 25 . 10.1.1.1  comment "test", \
>                 10.1.1.0 . tcp . 2 . 1.1.1.1  comment "test2" \
>         }
> 
> 
> 
> # nft -c -f abcd
> abcd:4:30-30: Error: syntax error, unexpected ., expecting comma or '}'
>                 10.10.1.0/24 . tcp . 25 . 10.1.1.1  comment "test", \
> 
> 
> 
> There is no error message without this line;
> -------------------
> add table filter
>         add set filter whitelist2 { type ipv4_addr . inet_proto .
> inet_service . ipv4_addr ;}
>         add element filter whitelist2 { \
>                 10.1.1.0 . tcp . 2 . 1.1.1.1  comment "test2" \
>         }
> 
> # nft -c -f abcd
> #
> 
> 
> Thanks.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
