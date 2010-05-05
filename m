From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: symmetric NAT and ICMP
Date: Wed, 5 May 2010 15:59:03 +0530
Message-ID: <AANLkTinm_rvGHEZQ_RpBqfvERQgI1JXNlBjn00owut6o@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=drzAxeiPJxXrixMJAkZTZ9lRSTfOniEBCb9ab41Xawk=;
        b=Rzg6zLOe9g38YD1isijTBOs2+alvjSAqvzlebuSB1qfjPGW9pJwCph0Kful+r5ui0a
         RJ1hywribrQQIc1KzNEvZH32/PiImMmx0B4OBpNDNOjKpW9ZQ44OqcIQbzRPVUFEGeD6
         KhyLrgWU/Bm71vRmBUAY5fnXVV4Bv/5gpYzwg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have two machine , say A ,B connected to lan subnet of  Router R .
Router R is a linux (2.6.18 ) machine with two interface eth0 and eth1
.
eth0 is connected to lan side and eth1 is connected to wan side .

192.168.1.100/24
A ----- |                                                            |    |
         | --------------->  lan (eth0 ) (192.168.1.1/24) | R |
wan(eth1) 10.232.18.100  ----------->
B------ |                                                            |    |
192.168.1.200/24

My understanding is : - NAT on Router R is  symmetric nat . I am able
to browse internet from both machine A  and B .

My question is : Can Router R can support different types of NAT
simultaneously ( full cone nat  ,address restricted nat ....etc ) ?

IF only one type of nat is supported , how "ping  google.com " works
from both machine ? icmp dont have any port information .Still
icmp-reply gets routed to correct machine ?

Thanks,
Ratheesh
