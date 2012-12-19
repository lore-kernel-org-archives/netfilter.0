From: Jack Bates <uo4zau@nottheoilrig.com>
Subject: Re: Discriminate client requests from transparent proxy requests?
Date: Wed, 19 Dec 2012 10:33:48 -0800
Message-ID: <50D2088C.5060903@nottheoilrig.com>
References: <50D01F13.7030707@nottheoilrig.com> <50D0713D.4070800@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nottheoilrig.com;
	s=mail; t=1355942067;
	bh=1x7Jn+eJRyFNNq5V4DBUUc5ERLhlU8XxjovyyImIdD4=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=Zce1lJRoc92xpMiya54MCHlG+1DGURvOJr3jMvm8NqV4CFBqkV2RWJifMFnf3AQ00
	 pm82mTVo57CLGvmKvDqiM780cJyh1J6ct8hYmlxotinr9QQvRayej6qCl7e0ry/nlt
	 yp/Nm0UG3JRzKOndbXmL8VOqFM8sM1aOpE2MTkvw=
In-Reply-To: <50D0713D.4070800@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Leonardo Rodrigues <leolistas@solutti.com.br>
Cc: netfilter@vger.kernel.org

Thank you, but what I want is for our *router* to be able to tell the 
difference between requests from clients to origin servers (and 
intercept these) and requests from our transparent proxy to origin 
servers (and not intercept these). I'm wondering what options there are 
to do this because our proxy makes "transparent" requests to origin 
servers, with the same source address as the request from the client.

I think what you're describing instead is how the *proxy* can tell the 
difference between requests that were intercepted and requests that were 
explicitly sent to the proxy.

On 18/12/12 05:35 AM, Leonardo Rodrigues wrote:
>
>      How about configuring two ports, one for transparent proxy and
> other for your 'normal' proxy? Doing that, you could create ACLs for
> matching your normal and transparent ports
>
>      Changing the port on your transparent proxy rule will be absolutely
> transparent to your users ...
>
> http_port 12345 transparent
> http_port 3128
>
> acl transparent_access myport 12345
> acl normal_access myport 3128
>
>
>      i cant think on any easier way of discriminating normal and
> transparent-intercepted traffic ...
>
>
> Em 18/12/12 05:45, Jack Bates escreveu:
>> Do you have any advice how to discriminate traffic from clients from
>> traffic from our transparent proxy?
>>
>> Our proxy sends requests to origin servers with the same source
>> address as the request from the client, so we can do per-host traffic
>> shaping on our router. But consequently I wonder how to discriminate
>> client requests from proxy requests, and route the former to the
>> proxy, but not route the latter. What options are there?
>
