From: Tomasz Chmielewski <mangoo@wpkg.org>
Subject: ebtables and anti-spoofing rules not working 100%?
Date: Sun, 29 Aug 2010 15:59:15 +0200
Message-ID: <4C7A67B3.4070505@wpkg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=wpkg.org; h=message-id
	:date:from:mime-version:to:subject:content-type
	:content-transfer-encoding; s=default; bh=VryXiorBEgRCajFoheWncq
	INme4=; b=l8UJ8W4DLHfj1zwb+rdlxitg4/IizPLBkvIcbUP/6Jl2hraDAO8PJn
	/lDj6XwPg79I2nEAlcDgzNdyppZleP1yGndMZmucIOLpUEBY+xOycPWgxO8B+p0g
	2nhCwk+IoDods6Bv9d1QRWjUWixY0ycFMCvvwiXJ/9qJjWRObkdyE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have a kvm host and two kvm guests running on it.


kvm1 is assigned 1.2.3.4 IP with 11:22:33:44:55:66 MAC; uses vmtab107i0 bridged tap interface.

kvm2 is assigned 1.2.3.22 IP with AA:BB:CC:DD:EE:FF MAC.



To prevent spoofing, I created these ebtables rules:

# create a chain for kvm1
ebtables -N vm107

# drop everything, unless it's accepted later
ebtables -P vm107 DROP

# guest communication with the gateway
ebtables -A INPUT -i vmtab107i0 -j vm107
ebtables -A OUTPUT -o vmtab107i0 -j vm107

# guest communication with the world
ebtables -A FORWARD -o vmtab107i0 -j vm107

# allow 1st IP with this MAC
ebtables -A vm107 -p IPv4 -s 11:22:33:44:55:66 --ip-src 1.2.3.4 -j ACCEPT 
ebtables -A vm107 -p IPv4 -d 11:22:33:44:55:66 --ip-dst 1.2.3.4 -j ACCEPT 

# allow broadcast traffic
ebtables -A vm107 -p IPv4 --ip-dst 1.2.3.64 -j ACCEPT 

# log everything else
ebtables -A vm107 --log-level debug --log-prefix "unexpected vm107 traffic: " --log-ip --log-arp -j CONTINUE 


And it works - if kvm1 changes IP address, it's not able to communicate and "unexpected" traffic is logged.


However, when I change MAC and IP on kvm1 to match this on kvm2:

ifconfig eth0 hw ether AA:BB:CC:DD:EE:FF
ifconfig eth0 1.2.3.22

and then arping the gateway from kvm1:

arping 1.2.3.1

kvm2 "looses" its connectivity.


I see these packets logged, so they should be dropped as well (policy is set to DROP). However, it doesn't seem to be the case.

Why do these packets get through?

What anti-spoofing rules I need to have to prevent some kvm guests pretending to be other kvm guests (or, even pretending to be "gateways")?


-- 
Tomasz Chmielewski
http://wpkg.org
