From: "Eliezer Croitor" <ngtech1ltd@gmail.com>
Subject: Flowtable in a load balancer
Date: Mon, 7 Dec 2020 17:18:05 +0200
Message-ID: <000901d6ccac$2b39fc70$81adf550$@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding:thread-index:content-language;
        bh=j/zVDOhMott5VeLwcgdxm+OJO1BnJQdSdUB3lMLg5Vs=;
        b=jXb72txYdOtyuKRxc9YuRimNQ3vHlgu4SnS7EM+zxm8QUS67xJFmm2RdHg0r2cV8G/
         CcrH80TFgFOmPOl/Hv+4UARv0Ziwcbi6u3nHj97lK+DVGxOBvMZTFPD/Hwk0M3GH/CH+
         YWvTY3GhMvgbZHIf6T0fhf9+e3D/5dUJaIps/WcxU4dWLigwwG6kZo1o2ze+ufVyUrDa
         I70/6tvBMagmO/38CRNy6HBaGAFIxrND7eBWSd5YGN/bUKiPvP8f/Jy1PYY0rFauIfKo
         VKy/85XbUQNQfvBs61UIg18h1+A8EAIAtwe6QWXq5AX6g2zTL6fapQfb/Ah4u8z+3L4Y
         4cOw==
Content-Language: en-us
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I am trying to understand where can I use flowtable on a load  balancer.
Also if and how it will work with PBR.

I have created a nftables load balancer lab at:
.	https://github.com/elico/mwan-nft-lb-example
.	https://github.com/elico/mwan-nft-lb-example/blob/main/run-lab.sh

I know that flow tables cannot work with PBR but not sure on what degree.
Also maybe something is needed possible..

I will try to describe the lab:
1 client 
  ether0: 192.168.125.100/24 gw 192.168.125.254
1 Lan GW 
  ether0: 192.168.125.254/24
  ether5-15: 192.168.205-215.254/24 (10 ~ wan interfaces with ip addresses)
15 WAN Routers
  ether0:  192.168.101.5-15/24( a single ip per WAN Router) (SNAT ie
MASQUERADE)
  ether1:  192.168.205-215.254/24( a single ip per WAN Router)

1 Edge_R_Web_service
   ether0:  192.168.89.99/24 (SNAT ie MASQUERADE) GW 192.168.89.254
(MASQUEARDE to the Real WORLD)
  ether1: 192.168.101.254/24


This lab tests the LB of the LAN GW towards the WAN Routers and verifies the
result via a HTTP request.
The client sends a http request towards 192.168.101.254 and then receives
the ip address of the WAN Router at the 192.168.101.0/24 net.

If it's possible to use flowtable on any of the Routers on this network I
would like to make sure I understood right.

Thanks,
Eliezer

----
Eliezer Croitoru
Tech Support
Mobile: +972-5-28704261
Email: ngtech1ltd@gmail.com


----
Eliezer Croitoru
Tech Support
Mobile: +972-5-28704261
Email: ngtech1ltd@gmail.com


