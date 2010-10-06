From: Christoph Anton Mitterer 
	<christoph.anton.mitterer@physik.uni-muenchen.de>
Subject: which reject code fits the most when rejecting non-IPsec packets
Date: Wed, 06 Oct 2010 14:15:01 +0200
Message-ID: <20101006141501.19435w4srtz81cco@webmail.physik.uni-muenchen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	physik.uni-muenchen.de; h=user-agent:content-transfer-encoding
	:content-disposition:content-type:content-type:mime-version
	:subject:subject:from:from:date:date:message-id:received
	:received:received:received; s=sel-2010; t=1286367302; bh=/NxAOB
	rQWvi6SeZ+T4rX18PTpZc2IxONoASNBqY6OOI=; b=a5Y/+hozKhrcYde9dtMJYj
	lVbMUYx3q2keJWL35rWy8qs6U687hx39CliE4I1Z+iPyzR07X7srTtTL+KLsyozU
	z0bO9gnKU9HvaWoooi1oUss9xC5RqsLzvJ7N3X0FTRGLvBcAibBO2yLlalNKkJw8
	aniHJjwIx2zM3MZaGzn/U=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: netfilter@vger.kernel.org

Hi.

I've recently set up IPsec and added some rules to prevent any  
incoming/outgoing packets from/to the respective peers, about like that:
#########################################################
*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]

-A INPUT	--in-interface lo	-j ACCEPT
-A OUTPUT	--out-interface lo	-j ACCEPT
-A INPUT	-m state  --state UNTRACKED	-j DROP
-A FORWARD	-m state  --state UNTRACKED	-j DROP
-A OUTPUT	-m state  --state UNTRACKED	-j DROP
-A INPUT	-m state  --state INVALID	-j DROP
-A FORWARD	-m state  --state INVALID	-j DROP
-A OUTPUT	-m state  --state INVALID	-j DROP

-A INPUT	--protocol udp  -m multiport  --destination-ports  
isakmp,isakmp-nat_espinudp	-j ACCEPT
-A OUTPUT	--protocol udp  -m multiport  --destination-ports  
isakmp,isakmp-nat_espinudp	-j ACCEPT
-N ipsec-only-in
-N ipsec-only-out
-A INPUT	--source <peeraddresses>	-j ipsec-only-in
-A OUTPUT	--destination <peeraddresses>	-j ipsec-only-out

-A INPUT	-m state  --state ESTABLISHED,RELATED	-j ACCEPT
-A INPUT	--protocol icmp  -m icmp	-j ACCEPT


-A ipsec-only-in	-m policy  --strict --dir in --pol ipsec --mode  
tunnel --proto esp	-j RETURN
-A ipsec-only-out	-m policy  --strict --dir out --pol ipsec --mode  
tunnel --proto esp	-j RETURN
-A ipsec-only-in	! --protocol esp	-j REJECT  --reject-with  
icmp-admin-prohibited
-A ipsec-only-out	! --protocol esp	-j REJECT  --reject-with  
icmp-admin-prohibited

#normal rules like:
-A INPUT	--destination eth0.localhost  --protocol udp  -m udp   
--destination-port domain		-j ACCEPT

#final rule
-A INPUT	-j REJECT  --reject-with icmp-port-unreachable

COMMIT
#########################################################

As you can see, I use --reject-with icmp-admin-prohibited to REJECT  
such packages which have been blocked because they were not  
"IPsec'ed"...
Is this the most appropriate ICMP error? I've looked up several RFCs,  
and to me also those sound usable:
icmp-host-unreachable
icmp-host-prohibited
or even
port-unreachable

there is however no explicit documentation in the RFC (ok at least I  
haven't found one) when to exactly use which.

Thanks,
Chris.

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.

