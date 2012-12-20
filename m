From: Jack Bates <uo4zau@nottheoilrig.com>
Subject: Re: Discriminate client requests from transparent proxy requests?
Date: Wed, 19 Dec 2012 23:10:16 -0800
Message-ID: <50D2B9D8.8000701@nottheoilrig.com>
References: <50D01F13.7030707@nottheoilrig.com> <50D0713D.4070800@solutti.com.br> <50D2088C.5060903@nottheoilrig.com> <50D21009.50702@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nottheoilrig.com;
	s=mail; t=1355987432;
	bh=SXc+YaJxcJJJ0Imke9oGBBxg157aOz9Y7ggA+70fQxc=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=ZGxj4hS9agBZ211MumDuA/0ehCf9NietwWkjAgJl3mdzLipkdK3M+3p1ndlgLkLRy
	 y+dAgBXtuuitwV0by0fB0kF9/dZKOYEpN3SQaXzTXUOlYLgpmtTIw4lePgACOZ1ukF
	 RKyFkkMqkuotzVLgD3cWDkL0EUJJkUWJM3qg1DfU=
In-Reply-To: <50D21009.50702@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Leonardo Rodrigues <leolistas@solutti.com.br>
Cc: netfilter@vger.kernel.org

Cool, using the TOS/DSCP field to discriminate client requests from 
proxy requests would work, with "iptables -m tos --tos ..." Thank you!

Are there any other options?

On 19/12/12 11:05 AM, Leonardo Rodrigues wrote:
>
>      how about adjusting TOS values on the packets using those created
> ACLs ?? That would probably make identification easier/possible on
> routing layers, your routers included.
>
>      you can specify a specific TOS value for your 'normal proxy' port
> and another one for your 'transparent proxy'.
>
>      but you're right, i didnt catch your idea and, maybe, my answer was
> for a different scenario than yours. But i think that using the
> transparent port ACL and adjusting TOS on those packets, you could catch
> that on your routers.
>
>
>
> from http://www.squid-cache.org/Doc/config/tcp_outgoing_tos/
>
>      Allows you to select a TOS/Diffserv value for packets outgoing
>      on the server side, based on an ACL.
>
>      tcp_outgoing_tos ds-field [!]aclname ...
>
>      Example where normal_service_net uses the TOS value 0x00
>      and good_service_net uses 0x20
>
>      acl normal_service_net src 10.0.0.0/24
>      acl good_service_net src 10.0.1.0/24
>      tcp_outgoing_tos 0x00 normal_service_net
>      tcp_outgoing_tos 0x20 good_service_net
>
>      TOS/DSCP values really only have local significance - so you should
>      know what you're specifying. For more information, see RFC2474,
>      RFC2475, and RFC3260.
>
>      The TOS/DSCP byte must be exactly that - a octet value  0 - 255, or
>      "default" to use whatever default your host has. Note that in
>      practice often only multiples of 4 is usable as the two rightmost bits
>      have been redefined for use by ECN (RFC 3168 section 23.1).
>
>      Processing proceeds in the order specified, and stops at first fully
>      matching line.
>
>
> Em 19/12/12 16:33, Jack Bates escreveu:
>> Thank you, but what I want is for our *router* to be able to tell the
>> difference between requests from clients to origin servers (and
>> intercept these) and requests from our transparent proxy to origin
>> servers (and not intercept these). I'm wondering what options there
>> are to do this because our proxy makes "transparent" requests to
>> origin servers, with the same source address as the request from the
>> client.
>>
>> I think what you're describing instead is how the *proxy* can tell the
>> difference between requests that were intercepted and requests that
>> were explicitly sent to the proxy.
>>
>
>
