From: khawar shehzad <shehzad.khawar@gmail.com>
Subject: Re: Why can't we use DNAT in the INPUT Chain?
Date: Sat, 19 Aug 2017 15:16:56 +0100
Message-ID: <6ae93686-46d2-416e-b736-ca6e7fa45231@gmail.com>
References: <5c984fa5-a2a5-340d-7cb6-6b21c3768e45@gmail.com>
 <20170819132827.GY2027@harrier.slackbuilds.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=UrOLJ3obcR6msmsrS9F1tv2jBryb+YcjGlqD/Gjqkro=;
        b=mmwszAQqFs1vRpgk4KqtPzwLgQ6KV6wLh1DDUFfy5oEKWSxp9wmC6kYJpnIAwyNGMH
         r0cnSifqex2AG6NcQFxLIjW92iu2cFz5YLEqTiNHY9cHjeHg+0ohl6zK1L+fIUs7KoMM
         MITaC41rd7k2IQdCu1KkqqZu5ax3GQMsQamh9MMzMV27fg7x4w3aT6Eou9Lxz0laoE88
         lfGGMr86mZbtbHBTjMs3xoOJsTnr9VvHsg6B/3lPdmk6wAbqi8Z4nKD8yooHrG3HLUaW
         VSYi5O0K+dYBUhqQgpSmUwdE9LZQ/tlDPp0zMgZePogQRwqzV8rX/HDzcAvs+lLlCbyr
         2NUA==
In-Reply-To: <20170819132827.GY2027@harrier.slackbuilds.org>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org



On 8/19/2017 2:28 PM, /dev/rob0 wrote:
> On Sat, Aug 19, 2017 at 01:36:20PM +0100, khawar shehzad wrote:
>> I have a simple question,
> But the question seems to lack necessary understanding.
ok.
>
>> but I have a very compeling application which
>> requires this feature.
>>
>> I want to do DNAT in the INPUT chain. I am doing filtration at the
>> PREROUTING chain (getting rid of some source IPs based on a vmap).
>>
>> Those IPs which are accepted after the prerouting filter, I need
>> to DNAT them only. I don't want to use router to do it in the
>> FORWORD chain.
> The thing you seem to be missing is the concept of tables.  Refer to
> the iptables(8) manual discussion about tables.
>
> Network address translation (NAT) only happens in the "nat" table;
> this table has no "INPUT" nor "FORWARD" (note: spelling counts! ;) )
> for your use.
>
> Filtering is done in the "filter" table, which likewise, has no
> "PREROUTING" chain.  To some extent you could filter in the "raw"
> table, but there's not much benefit to that.
>
> You did not describe your use case very well, but from the little
> which did come across, perhaps you could drop certain source IP
> addresses in raw/PREROUTING.  Then do DNAT in nat/PREROUTING as
> normal.  These connections will be seen again in filter/FORWARD.
>
> (If the list of blocked source addresses is large and/or dynamic,
> consider ipset(8) and the -m set match.)
>
> http://inai.de/images/nf-packet-flow.png might help you to see how
> packets flow through the various tables and chains.
>
> Try describing your problem and goal a bit better (what does "don't
> want to use router to do it in the FORWORD chain" mean?  What's the
> problem with normal DNAT?) then perhaps we can offer more and better
> suggestions.
I want to the following:
1- Maintain a list of source IPs which will be granted access (I am 
using verdict maps, and added all source IPs there with an ACCEPT verdict)
2- The verdict map is used by the FILTER chain (which will reject the 
traffic unless there is an entry in the verdict map)
3- Once the packet is accepted by the FILTER chain (i.e. there is a 
mapping in the verdict map), I want to do DNAT (i.e. changing the 
destination address of the packet)

My interface is configure like this:
eth4 ==> 2001::21
eth4 ==> 2001::1:0:0:2

The example client (which will be allowed an access to the server) is 
2001::20.

My solution is like the following, which is not working.

table ip6 natcap {
         map natcap_vmap {
                 type ipv6_addr . ipv6_addr : verdict
                 elements = { 2001::20 . 2001::1:0:0:2 : accept}
         }
         chain prerouting_filter {
                 type filter hook prerouting priority -101; policy drop;
                 ip6 saddr . ip6 daddr vmap @natcap_vmap
         }

         chain prerouting_nat {
                 type nat hook prerouting priority -100;
                 dnat to 2001::21
         }
         map natcap_map {
                 type ipv6_addr : ipv6_addr
                 elements = { 2001::20 : 2001::1:0:0:2 }
         }

         chain postrouting_nat {
                 type nat hook postrouting priority 100; policy drop;
                 snat to ip6 daddr map @natcap_map
         }
}


Note the have set the priority such that chains work in order. But still 
no luck.

Thanks
