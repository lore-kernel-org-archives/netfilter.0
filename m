From: Igor S <nat4592@scarlet.be>
Subject: SNAT range does not use unique IP
Date: Thu, 12 Dec 2013 22:55:53 +0100
Message-ID: <e7ab2e194832d5b3253cf7d6cdde9f63@scarlet.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scarlet.be;
	s=scarlet; t=1386885355;
	bh=m7J2j9U7SIpS+Tib3bgTM4fiOl3tg9O9JuXCeBGPBeA=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:
	 Subject:Message-ID;
	b=VuVeb1FK8xSOunvfHEjGTAxQyyZNNgkHHUHHAZQnu3y7aP1bhUS9v7MmQUgwBqy4H
	 0OoW27d3hnT4W+iKWGWvl+DHZZopkb7bQp91gyo6sE+Dd3Lz7kmuvLQM6bJWKy9/in
	 CHdJfWohpiRbBrUjEQMRttgs3xFjTQI/MdFOQ+ao=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Dear netfilter guru's

I am trying to build a kind of a dynamic 1:1 SNAT gateway that is 
supposed to build every incoming IP to a unique internal IP in the 
internal network without any port mangling.

I did setup an SNAT range big enough to uniquely translate more than 8K 
addresses:
iptables -t nat -A POSTROUTING -s 100.0.0.0/8 -j SNAT -o eth2 --to  
12.0.1.1-12.0.33.254 --persistent

However before the range was exhausted conntrack started to report 
multiple source IP addresses translated to the same SNAT IP:
e.g. both 100.0.58.1:7 and 100.0.29.1:7 connections were translated to 
the same 12.0.8.241:7

cat /proc/net/nf_conntrack |grep 12.0.8.241
ipv4     2 udp      17 3 src=100.0.58.1 dst=12.2.58.1 sport=7 dport=7 
[UNREPLIED] src=12.2.58.1 dst=12.0.8.241 sport=7 dport=7 mark=0 zone=0 
use=2
ipv4     2 udp      17 3 src=100.0.29.1 dst=12.2.29.1 sport=7 dport=7 
[UNREPLIED] src=12.2.29.1 dst=12.0.8.241 sport=7 dport=7 mark=0 zone=0 
use=2

Isn't the nat module supposed to select a unique NAT IP in this case?

What would be a more appropriate way to make a unique 1:1 translation 
without knowing the exact source IP in advance?
Thanks,
Igor


