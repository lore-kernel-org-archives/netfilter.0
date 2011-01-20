From: Arthur Titeica <arthur@psw.ro>
Subject: iptables/ipset syntax
Date: Thu, 20 Jan 2011 17:38:46 +0200
Message-ID: <a1bd277586d221277f8a4566fc37355c@psw.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=psw.ro; h=
	user-agent:message-id:organization:subject:subject:from:from
	:date:date:content-transfer-encoding:content-type:content-type
	:mime-version:received:received; s=mail; t=1295537932; x=
	1298129932; bh=z68J2TWilUvGGtMwLso7fAsRp5CwZjMS3SjEAushqFY=; b=0
	IVPYmFn6GGSKKzUUmVZ/7ahD7HuQ6lNT2ZZOEzTrpefQbXvEHXmX+AX2wF0rOcgi
	VXau6RSRN3I4x6WrJRF3ul1ygFrEwGu06OgJIJFUbF3szxJ3t+MXJjnp6qABoZtd
	Lg0pS6d8O4Cc+XUqP+P42z5Caz9o7ewtTqX3NzNn2A=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

 Hello

 I'm having some trouble understanding the correct syntax for an 
 iptables rule involving ipset.

 I need to forward between IPs within the same ipset. So I've tried 
 using something like this:

 iptables -A FORWARD -i eth0 -o eth0 -m set --match-set testset src,dst 
 -p tcp --dport 9000:9020 -j ACCEPT

 However this allows forwarding to all the eth0 network for the 
 'testset' IPs.

 Instead
 iptables -A FORWARD -i eth0 -o eth0 -m set --match-set testset src -m 
 set --match-set testset dst -p tcp --dport 9000:9020 -j ACCEPT
 seems to do what I need but I'm not 100% certain.

 Anyone with a better understanding?

 iptables v1.4.10
 ipset v5.3.

 Thank you.

-- 
 Arthur Titeica

