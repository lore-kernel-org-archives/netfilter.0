From: Christoph Anton Mitterer 
	<christoph.anton.mitterer@physik.uni-muenchen.de>
Subject: netfilter and IPsec?
Date: Sat, 02 Oct 2010 20:11:35 +0200
Message-ID: <20101002201135.20008i4gzdc62t3s@webmail.physik.uni-muenchen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	physik.uni-muenchen.de; h=user-agent:content-transfer-encoding
	:content-disposition:content-type:content-type:mime-version
	:subject:subject:from:from:date:date:message-id:received
	:received:received:received; s=sel-2010; t=1286043095; bh=QF9zhK
	C8/e1KrWAzgTGDupVtA5PuHCh0tmmUMQsdMCQ=; b=LrH60AYd9rsEFv+MpMxoqC
	BFL4RS3t2zY0KHPQCZlzuLZkCTJV2+EMxd3f9ra59VXBnieICJL0rcWV/Zlzr921
	6dThEGGGK0NM4fWWvePaOBV0UlpDZuuSbp3f7FSEBD9AWaqg3i8I0XRTkxRjKMw6
	KZJQ3sZIeJRHFoVSz+lQk=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: netfilter@vger.kernel.org

Hi.

I recently started trying to set up stronswan, to create a  
encrypted/authenticated tunnel between two of my servers (so it's  
always a host-host scenario), using IKEv2 and esp.

Now I was trying to set up some clever iptables rules and while doing  
so, I found out that my understanding is probably totally wrong ^^

What I want to do is:
1) allow key negotiation
2) reject any traffic from hostA to hostB that is NOT secured with  
esp, otherwise (e.g. in case strongswan crashes or so). Packets which  
are secured using esp, should not automatically be accepted however.
3) optionally, allow exceptions from 2, when e.g. the protocol is  
already secured (e.g. TSIG with DNS).

So I started with about this (rules from hostA):
*filter

:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]

#Basic Rules
#allow incomming and outgoing packets on the loopback network interface
-A INPUT        --in-interface lo       -j ACCEPT
-A OUTPUT       --out-interface lo      -j ACCEPT

#deny packets which are not subject to connection tracking
-A INPUT        -m state  --state UNTRACKED     -j DROP
-A FORWARD      -m state  --state UNTRACKED     -j DROP
-A OUTPUT       -m state  --state UNTRACKED     -j DROP

#deny packets which are considered to be invalid by connection tracking
-A INPUT        -m state  --state INVALID       -j DROP
-A FORWARD      -m state  --state INVALID       -j DROP
-A OUTPUT       -m state  --state INVALID       -j DROP

#handle IPsec only destinations (guess that should be before the  
establised/related rule from below)
-N ipsec-only
-A INPUT       --source hostB            -j ipsec-only
-A OUTPUT      --destination hostB       -j ipsec-only

#allow incomming packets for all established and all related connections
-A INPUT        -m state  --state ESTABLISHED,RELATED   -j ACCEPT

#allow incomming ICMP packets
-A INPUT        --protocol icmp  -m icmp        -j ACCEPT


#allow IKE to/from these hosts without IPsec
-A ipsec-only   --protocol udp  -m udp  --source-port isakmp   
--destination-port isakmp -j ACCEPT
-A ipsec-only   --protocol udp  -m udp  --source-port isakmp-nat   
--destination-port isakmp-nat -j ACCEPT

#otherwise, deny all non IPsec ESP to/from these hosts
-A ipsec-only   --protocol !esp -j REJECT  --reject-with icmp-admin-prohibited

#other rules e.g.
# Allow incomming packets for the nameserver
-A INPUT        --destination eth0.localhost  --protocol udp  -m udp   
--destination-port domain         -j ACCEPT
-A INPUT        --destination eth0.localhost  --protocol tcp  -m tcp   
--destination-port domain  --syn  -j ACCEPT


1) As you see, I tried to first allow from/to hostB: udp/500 and  
udp/4500 for the key negotiations.
2) Reject then everything !esp from/to hostB.
3) Next I wanted to accept incomming packets "just normal" (as without  
IPsec) based on e.g. destination address and dport (given the fact  
that those packages should be already authenticated/decrypted).
And outgoing packets should simply pass out (as they're esp, and my  
OUTGOING policy is ACCEPT).

But that doesn't work like this, does it?
So when during netfilter are packets still esp, and when are they  
authenticated/decrypted, and I see (and can match) the "normal" IP  
packet?
Does the INPUT/OUTPUT queues even ever see esp packets?

Thanks,
Chris.

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.

