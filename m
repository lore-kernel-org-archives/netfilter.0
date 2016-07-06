From: John Wayne <conna666@gmail.com>
Subject: Re: iptables TCP DDoS filtering
Date: Wed, 6 Jul 2016 09:07:05 +0200
Message-ID: <577CAE19.3040905@gmail.com>
References: <loom.20160705T084958-392@post.gmane.org>
 <20160705190849.GA26405@Mail.DDoS-Mitigator.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=G2s+80Ac86pcRdqUslOZxcx/t+FD2WRAOVbIkyOXdLA=;
        b=rqOqWK9ECiOmxY0latBJkLPBTu2YLKMYMPhqQ6LjOlSudcjPyN9MbehxN+pKXmiuvW
         Js4xac1viksxxcUNs3ciWkOf5/Ky7SI2WYBZaqC7v+WwF0xmigUK5U+1pV852YHQoAgP
         MzIsX0jmaRNY30LX+f7ZF/mMqJL6ygGPk0j98yvHvqFasSEGC3uV0UmSZT/dE7s3/gyz
         WGfsihFYJwlchZUEOeVeWEcEup/tAO3Wm5COFLxxN9dg3RiKny5zpRB3u0ms+wDX8vBv
         OzRF/DIIPUKVuFRoTQlbYNoLw7Gn3M9miVV/p7gFrjOY/nMu1/+de9cJKFoG1YsaXtoK
         pG9Q==
In-Reply-To: <20160705190849.GA26405@Mail.DDoS-Mitigator.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: alvin.ml@Mail.DDoS-Mitigator.net
Cc: netfilter@vger.kernel.org

Thank you for your response. However, I can't make too much sense of it.

 > some of the rules in javapipe.com seems way tooo complicated

Can you provide an example of simpler rules to achieve the same?

 > i claim iptables + tarpit is ideal to defend against tcp-based ddos 
attacks

Can you elaborate on that? From what I know you could only use 
tarpitting for unused ports. But most of the time it's the actual ports 
of services that get attacked. How does tarpitting help against TCP 
attacks on say port 80 if you run a web service? Also doesn't it only 
work for botnets? What about spoofed attacks, say SYN with random flags?

 > there are roughly 65,535 tcp-ports that should be protected with tarpits

But attacking random ports isn't that common, they are mostly directed 
to one port a service is listening on. Also 65k ports isn't that many, 
there are enough botnets that are larger. Therefore I doubt that tarpit 
even makes much sense for botnet attacks, considering they can be huge 
and also just wait for the TCP timeout.

 > limiting incoming is sorta misleading, since you cannot 
limit/stop/block/drop incoming packets.

You can put a firewall in front of your servers effectively protecting 
the servers behind it. So I don't really get this either. Of course you 
need to mitigate the bad packets at some point in your network and the 
further upstream the better, that's for sure. Yet they will always reach 
some device in your network..

On 05.07.2016 at 21:08 alvin.ml@Mail.DDoS-Mitigator.net wrote:
> On 07/05/16 at 06:53am, Josh Day wrote:
>> I'm curious if anyone of you has read this article
>> https://javapipe.com/iptables-ddos-protection and tried any of the
>> rules/settings. I read it today but I'm not sure what to make of it, so
>> thought you guys could maybe share your opinion.
> i've seen/read most of the various articles/howto/snipplets of using
> iptables for ddos mitigation .. the list of various iptables howto
> for ddos mitigation at the bottom of http://iptables-blacklist.net/Howto
>   
> some of the rules in javapipe.com seems way tooo complicated ...
> ( i think pre-routing and post-routing is un-necessary )
> #
> # more importantly, the iptables rules in javapipe is incomplete and
> # "droping" packets is NOT ddos mitigation because you already received
> # the packets.
> #
> the sysctl variables should be tuned per your server, cpu/mem, bandwidth,
> and amt and type of DDoS attacks
>   
> i keep wondering which of the big brand-name ddos mitigation appliances
> are using iptables under the hood ( under their "propritory os" )
>   
> i claim iptables + tarpit is ideal to defend against tcp-based ddos
> attacks ... the attacking zombie-host has to sit and wait the
> tcp-timeout ..  there are roughly 65,535 tcp-ports that should
> be protected with tarpits :-) .. how one builds the LAMP servers
> and how the network infrastrucure is configugred greatly affects
> your ability to mitigate tcp-based ddos attacks
>   
> ---
>
> i think that dropping or limiting icmp-based or udp-based attacks are
> pointless since you've already received the ddos packets
>
> udp-based and icmp-based attacks must be mitigated at the uplink ISP
> and not at the server under attack
>   
> also, limiting incoming is sorta misleading, since you cannot
> limit/stop/block/drop incoming packets.  you can only limit which
> of the incoming packets you are replying to
>   
> there are some icmp-packets you should reply to while ignoring
> un-necessary and un-used udp services
>
> there are some udp-packets you should reply to while ignoring
> un-necessary and un-used udp services
>
> magic pixie dust
> alvin
> #
> # DDoS-Mitigator.net ... automated tcp-based iptables + tarpits
> # DDoS-Simulator.net
> #
>

