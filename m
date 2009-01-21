From: David J Craigon <david@craigon.co.uk>
Subject: Re: Conntrack not recording packets going through a firewall
Date: Wed, 21 Jan 2009 17:37:23 +0000
Message-ID: <c1ace6860901210937m375a8f38g87a86e6264ff6023@mail.gmail.com>
References: <c1ace6860901210632m6d9e5b12g71010545a57be1b5@mail.gmail.com>
	 <4977522B.5030007@mailinator.com>
	 <c1ace6860901210920l1922c626x124b83e7f02d0844@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type:content-transfer-encoding;
        bh=va3EobM2IiNTFFVXgHedE6O/3E0153K7TNBWOHg3yZM=;
        b=FG12g3M3hBUSCUpsFZlcjdYpjkFy3Yr9LBhZnOllHWG3qX6v781FdFt4nj0WWQcO/z
         3UBkKzPwGkN+i43L7KltzLP0y0Vzx+ZQCLX+XO58jwMHerBGDk3mt+jshWouBWyZFgH+
         dKOOXUU6fEevSD+zgZkFkQ6ToxVBfGAzoSdi0=
In-Reply-To: <c1ace6860901210920l1922c626x124b83e7f02d0844@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Wright <mike.wright@mailinator.com>
Cc: netfilter@vger.kernel.org

Think I might of misunderstood your email. What I want to happen is
for all traffic to go through the firewall. Customer 1 and Customer 5
are on separate VLANs. I want Customer 5 to be able to access Customer
1's server as if it was any other host on the internet.

Does that make more sense?

2009/1/21 David J Craigon <david@craigon.co.uk>:
> No, the routing is definitely working 8-). Otherwise how could all
> traffic go from the internet to these servers? They have no other
> internet connection than through the firewall.
>
> It all works OK if you turn off iptables on the firewall, too.
>
> 2009/1/21 Mike Wright <mike.wright@mailinator.com>:
>> David J Craigon wrote:
>>>
>>> Hello,
>>>
>>> I'm trying to build a firewall using Linux, iptables and conntrack. My
>>> set up is pretty simple- I've got a computer with three interfaces-
>>> one pointing to the internet, and two networks for different
>>> "customers".
>>>
>>>
>>> Internet--------Firewall------Customer 1
>>>                           |
>>>                           ----------Customer 5
>>>
>>>
>>>
>>> Customer 1 has 10.72.2.0/24. Customer 5 has 10.72.3.0/24. Both
>>> customers have a server 10.72.2/3.3 running httpd on port 80.
>>>
>>> Now, both Customer servers can get to the internet, and the internet
>>> can get to them, but Customer 1's server can't get to Customer 5's
>>> server.
>>
>> Hi David,
>>
>> Perhaps you need "routes" established for those subnets.
>>
>> ip route add 10.72.2.0/24 dev ethX   #customer1's nic
>> ip route add 10.72.3.0/24 dev ethY   #customer5's nic
>>
>> hth,
>> :m)
>>
>
