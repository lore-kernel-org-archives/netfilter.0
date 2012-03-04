From: Jack Bates <uo4zau@nottheoilrig.com>
Subject: How to mirror traffic received on WAN interface *before* NAT?
Date: Sat, 03 Mar 2012 20:14:33 -0800
Message-ID: <4F52EC29.9080607@nottheoilrig.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nottheoilrig.com;
	s=mail; t=1330834353;
	bh=/EYxYECsmdPGgL+Pe7z6QaBKiKNA7eaMeVpSq+YjxDM=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
	 Content-Transfer-Encoding;
	b=HGJY46yr7VTs4zX1bc9ApYSTQS77ls98IKFW8Thudh2ir50Z/Vku9M54/X3L4RAFn
	 CQeTXSqzKocedVMZ8X3H5rupLNXWtDiH246R8VUZaa1B5FadkX9Bc0h2KZhwGzpimq
	 GgBGBc101akr6lcq5S5NANct5PaU6Jzvco36vAIk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

We run "ntop" on a computer connected to our router, for traffic 
analysis: 
http://jdbates.blogspot.com/2012/02/this-is-followup-to-this-post-on-how-to.html

We forward all traffic sent and received on our WAN interface to the 
"ntop" computer with the following lines in /etc/firewall.user:


> iptables -A PREROUTING -t mangle -i eth0.1 -j TEE --gateway 192.168.1.7
> iptables -A POSTROUTING -t mangle -o eth0.1 -j TEE --gateway 192.168.1.7


This works well, except that we also NAT traffic on our WAN interface. 
We want to monitor traffic *before* NAT

Currently the source addresses of mirrored outgoing traffic are our 
"private" addresses, e.g. 192.168.1.123, 192.168.1.234, etc. so these 
rules happily mirror *outgoing* traffic before NAT

However the destination address of mirrored *incoming* traffic is our 
"public" address. I guess I want to mirror incoming traffic after NAT, 
so I tried "POSTROUTING" for incoming traffic:


> iptables -A POSTROUTING -t mangle -i eth0.1 -j TEE --gateway 192.168.1.7
> iptables -A POSTROUTING -t mangle -o eth0.1 -j TEE --gateway 192.168.1.7


  - but I get the following error:


> iptables v1.4.6: Can't use -i with POSTROUTING


Any advice, how to improve these rules to monitor traffic *before* NAT? 
so analysis of incoming and outgoing traffic consistently references our 
"private" addresses associated with the traffic?

Any general advice concerning this setup?
