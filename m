From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.13 released
Date: Mon, 02 Jul 2012 14:11:29 +0100
Message-ID: <4FF19E01.6090400@googlemail.com>
References: <alpine.DEB.2.00.1206292201340.29738@blackhole.kfki.hu> <4FF02A93.8080603@googlemail.com> <alpine.DEB.2.00.1207011405160.2289@blackhole.kfki.hu> <4FF04038.4080306@googlemail.com> <alpine.DEB.2.00.1207011434010.2486@blackhole.kfki.hu> <4FF04647.7060807@googlemail.com> <alpine.DEB.2.00.1207011446260.2486@blackhole.kfki.hu> <4FF04DDA.3020609@googlemail.com> <alpine.DEB.2.00.1207011646110.2749@blackhole.kfki.hu> <f1ffdaf291ae86a1e111d3edbae4cfa3@treenet.co.nz> <alpine.DEB.2.00.1207020916030.4335@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=s6rf7XjknW4OSBFwGNaMLjQib8WyyyNr4JU2jil+q4s=;
        b=nyOIR5O7xYT56qgYXhXisnfifnFuFnN5n18oHIM00+i991kQbzjDSfepMqMOpSZdYU
         kKcanJjIk/1aJ329nCcZtvVX7OzNp5DtFtgzh7HX0uZcSAEvCvukJzGokdwFM/LVIwMv
         gnJDWs63ECXzP+R+WFY43ai6OHy5VX7LIiyrSkVmYj5dm2+U6D9LD+mMdkyGmenDZYdB
         B8146Ii6L/J3AlfXIx7rDOPGYvlOMegS0R5+kp2kriWmzHEiq4chIfBk+OtaKuLdAIsv
         x+6FMEMHoxU5QI7sxOpTAMJ4qtPziem24Ty+lqHfMkPBau0MYEa26z446NjhC9ZVl0Q1
         IsxA==
In-Reply-To: <alpine.DEB.2.00.1207020916030.4335@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Amos Jeffries <squid3@treenet.co.nz>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org, Patrick McHardy <kaber@trash.net>


> Maybe ASCII art helps better to explain the different views:
>
> - Mr Dash Four
>
>                      -----------
>   pkt comes in ----- | machine | ----- pkt goes out
>                    ^ ----------- ^
>                  destination   source
>
> - my view follows how the subsytem sees the interfaces
>
>                              ------------------
>   pkt comes in --- interface | ipset subsytem | interface --- pkt goes out
>                            ^ ------------------ ^
>                        source               destination
>
>   
How do you explain that the same "ipset subsystem" treats the IP address 
of the "source" interface (according to your diagram above) as 
"destination" when I match the same (incoming) packet above?

In other words, when I match a packet arriving on the "source" interface 
(again, according to the diagram above) against the IP address this 
"source" interface belongs to, I have to use "dst" designation, not 
"src", but when I match it against the interface then I have to use 
"src" instead? Also, how do you explain that the same designation 
(destination) applies for everything else but the hash:net,iface set for 
the same type of match (incoming packet)?

Give me a reasonable and coherent explanation and I'll accept your argument.

> "src" and "dst" are generic keywords of the set match and SET target of 
> iptables/ip6tables and independent of the set types. The match and target 
> have no idea what is "src" and "dst", the given set interprets them 
> according to the type.
>   
Regardless of whether the set match and SET target use these two 
keywords, across the whole netfilter terminology, there is consistency 
applied with the notable exception of the hash:net,iface and the "iface" 
part in particular.

