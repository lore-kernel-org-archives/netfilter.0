From: Olivier Alabeatrix <oalabeatrix@gmail.com>
Subject: validate IPsec outgoing packets using NFtables
Date: Mon, 06 Apr 2020 17:33:11 +0200
Message-ID: <6db313e5d1d7ff43bfbf5a3457b40059daf10c69.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=jD33Ld8klsQjlNCTPKf2A27nGQAOamDt2NZjY0Md8dY=;
        b=uFoFAq9jMHEhvRjZlgPlFT2BCJNvyZ0nGvwCWvFc0nW/KfhD9F3eK6Rl4se7jwMp9U
         fdbyoJD4IMmfCc6uqj96mjYR2dodHCZuRBJ48NWBTjMrIZoFIpV149+O+85RBQlTh1qw
         Pg/QTO9Scgw8ruPJIaVTIzMsoSujc5/Y7SE8NIMa5ifXJu/t1kq2O14WYNv46cpZxYSa
         aWXKDXasCznkxN3AUdCby/8NrO/yxZ+jSVshDOVvAIR8OMQ9/ubBUQKRrTMHfP8GKPs+
         tG9xwuBZIVsYWj+sclIJRs1Q4wZzK7Pbu/EPWm0Nu0pj6Gr6INZ3lTUIxkSPhI7KXUWI
         Fb/g==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi!

Using Debian 10/nftables v0.9.0, i'm having troubles having nftables
validate outgoing ipsec packets using the secpath meta.
This is part of a ruleset on R1, an IPsec gateway, that is supposed to
only forward traffic between 172.16.11.0/24 and 172.16.12.0/24 if it is
secured by Ipsec:

172.16.11.0/24-R1-----ESP-----R2-172.16.12.0/24

chain forward {
                type filter hook forward priority 0; policy drop;
		ip saddr 172.16.12.0/24 ip daddr 172.16.11.0/24 meta
secpath exists counter accept
		ip saddr 172.16.11.0/24 ip daddr 172.16.12.0/24 counter
accept
		log prefix "NFtables: FWD:"
                counter drop
        }


chain postrouting {
		type filter hook forward priority 0; policy drop;
#never matching:
		ip saddr 172.16.11.0/24 ip daddr 172.16.12.0/24 meta
secpath exists counter accept
		ip saddr 172.16.12.0/24 ip daddr 172.16.12.0/24 counter
accept
		log prefix "NFtables: POST:"
		counter drop
	}

While the forward chaine does match incoming ipsec-secured packets
using:

ip saddr 172.16.12.0/24 ip daddr 172.16.11.0/24 meta secpath exists
counter accept

The postrouting chain secpath rule never matches:
ip saddr 172.16.11.0/24 ip daddr 172.16.12.0/24 meta secpath exists
counter accept

What may I be doing wrong? Any help is welcomed.

 

