From: Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
Subject: How to restrict Fortigate firewall WAN-side GUI to certain IP
 addresses (Untested CLI commands)
Date: Wed, 28 Jul 2021 21:09:21 +0800
Message-ID: <de6d4f8002102732ef96dbb0000be744@teo-en-ming-corp.com>
Reply-To: ceo@teo-en-ming-corp.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        teo-en-ming-corp.com; h=content-transfer-encoding:content-type
        :organization:message-id:user-agent:reply-to:subject:to:from
        :date:mime-version; s=dkim; t=1627477761; x=1630069762; bh=M1Feb
        hWZu7fBdbbNRawgQ2fbkzlinS+coovLbR4V+Zk=; b=ua4mwRj0nfFl1NsowOlmP
        v/9XEFic1ThLrcG8JgnpAfolXrPQOsPs6HsEfZNgV+NUiUerxbbs9ksRSNgSi8os
        ZYrhX0IT3+uZrRVEcaWzzIEBxsUrIVrj1+SdhDg+j1vg0rq/NkfZRNGKjQTfy4MQ
        k7xSXAEdOu5Sk+aBxwi0W8FHmaBR9oIA/aLF52P58PigBvWHgKRZNMBes+yAU39G
        D/AsfLPLSNm8m3MznTgTXryHvDTtZf3gAfHBFo2LIsfHH/83mkaBayPRKpB2CYzx
        bZaGMY4YN3OrLfQj5lv7mzt/zLUqyhsDMM5AgaKvnugR0IGkwSx5j9XfdHOIZWUu
        A==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Subject: How to restrict Fortigate firewall WAN-side GUI to certain IP 
addresses (Untested CLI commands)

Good day from Singapore,

Fortigate firewall appliances are based on Linux.

I came up with the following CLI commands after studying an existing 
Fortigate 60F firewall configuration. These are untested CLI commands. 
Use them at your own risk!
The objective is to restrict Fortigate firewall WAN-side GUI to certain 
IP addresses.

config firewall address
     edit "SKYNET_1"
	set subnet 1.2.3.4 255.255.255.255
     next

     edit "SKYNET_2"
	set subnet 5.6.7.8 255.255.255.255
     next

config firewall addrgrp
     edit "SKYNET"
         set member "SKYNET_1" "SKYNET_2"
     next

config firewall local-in-policy
     edit 1
	set intf "wan1"
	set srcaddr "SKYNET"
	set dstaddr "all"
	set action accept
	set service "Fortigate_HTTPS" "SSH"
	set schedule "always"
     next

Mr. Turritopsis Dohrnii Teo En Ming, 43 years old as of 28 July 2021, is 
a TARGETED INDIVIDUAL living in Singapore. He is an IT Consultant with a 
System Integrator (SI)/computer firm in Singapore. He is an IT 
enthusiast.





-- 
-----BEGIN EMAIL SIGNATURE-----

The Gospel for all Targeted Individuals (TIs):

[The New York Times] Microwave Weapons Are Prime Suspect in Ills of
U.S. Embassy Workers

Link:
https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-microwave.html

********************************************************************************************

Singaporean Targeted Individual Mr. Turritopsis Dohrnii Teo En Ming's
Academic Qualifications as at 14 Feb 2019 and refugee seeking attempts
at the United Nations Refugee Agency Bangkok (21 Mar 2017), in Taiwan
(5 Aug 2019) and Australia (25 Dec 2019 to 9 Jan 2020):

[1] https://tdtemcerts.wordpress.com/

[2] https://tdtemcerts.blogspot.sg/

[3] https://www.scribd.com/user/270125049/Teo-En-Ming

-----END EMAIL SIGNATURE-----
