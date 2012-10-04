From: tlhackque <tlhackque@yahoo.com>
Subject: Odd use of netmasks - Supported?
Date: Thu, 04 Oct 2012 18:07:07 -0400
Message-ID: <506E088B.8000203@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1349388429; bh=oBCSATABX1RdApX/70QGE9JyLKrVcwAHX/euVp520Ew=; h=X-Yahoo-Newman-Id:X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:Content-Type:Content-Transfer-Encoding; b=zgj+s6dBFCE7OglQdoxqLebFo6Yeq3coj5ROqUwaMcyif9uGWNwsm7pqCyph0jOpzMZB5j74MF3xI/8kqJKvguXp9QY64u3qy0WrEkLgQI/SNvI2mbgw1ffri9cDj2Rlut8UbXf3wia1UEzsjjjJQKZQv6w1/D93JrQYUCsNAnM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I have some very long (thousands of rules) rule chains, which I wish to 
shorten by dispatching on part of the address.

Clearly, I can do something like  -A FOO -s 2001:db8:1000/36 -j SUBCHAIN-81.

But in IPV6, the high order bits really aren't interesting.

The syntax -A FOO -s 001:c000::0/0f:f000::  (note the leading 1s in the 
"netmask") seems to be accepted by iptables, and the rule appears with -L.

I would expect an address to be XORed with the -s address, ANDed with 
the mask, and be true if 0.  Even though this is an illegal mask for 
routing, it's interesting for this.

Rather than experiment and rely on some undocumented behavior, I thought 
I should ask:

Is this usage supported (in the sense that it will behave as described 
and will continue to do so)?  Or is this living dangerously?

Of course, it would be nice to have a chain type that didn't have 
sequential evaluation semantics and just dispatched based on netmask and 
address... but that's how things might be, not how they are...

(Why ridiculous chain lengths, you ask?  Country blocking.  But no 
philosophical discussions about why this is a bad idea/easy to subvert, 
please.)

Thanks.

-- 

---------------------------------------------------------
This communication may not represent my employer's views,
if any, on the matters discussed.

