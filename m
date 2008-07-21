From: "Anatoly Muliarski" <x86ever@gmail.com>
Subject: Re: More ethernet port same ip address
Date: Mon, 21 Jul 2008 10:00:29 +0300
Message-ID: <38db14850807210000v3f33643fne46f28f03ea00cdc@mail.gmail.com>
References: <48819901.6030604@unipex.it> <4883CD35.3060704@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=Wt5Y6Nlj+ujlxYjVbEJOO/NczRMDDVRaJfhQk6ffq6M=;
        b=SENHg+aMJzFLhwqPxPmAm1GYvotF2OYCvVEw6VNkAZOUUofICbDi1/cyxBiFKoyLUO
         NKJyOr7XHxlr/x0TOauYwArp+u7leRzUrYhHDexp479KPiH4BZph1mjM1/e4Zc84LSke
         6WbV4f5d3bVV1VXJtrgMGkaYnkzm31P31eSeM=
In-Reply-To: <4883CD35.3060704@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

I'll try to put in my 5 cents ...
A working example from openet.ru
---
(x.x.x.99 ... x.x.x.110) --- (eth1, x.x.x.98 | eth0, x.x.x.98) --- (x.x.x.97)

1. Delete default routes
   ip route del x.x.x.96/28 dev eth0
   ip route del x.x.x.96/28 dev eth1

2. Set up routes for subnets
   ip route add x.x.x.97 dev eth0
   ip route add x.x.x.96/28 dev eth1

3. Turn on Proxy ARP
   echo 1 > /proc/sys/net/ipv4/conf/eth0/proxy_arp
   echo 1 > /proc/sys/net/ipv4/conf/eth1/proxy_arp
---


-- 
Best regards
Anatoly Muliarski
