From: Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
Subject: [UPDATE 1] Decommissioned Cisco ASA 5506-X Firepower Firewall and
 Deployed Fortigate 60F Firewall for an Investment Company in Singapore on 8
 July 2021 Thursday
Date: Fri, 09 Jul 2021 22:10:59 +0800
Message-ID: <b5ba9a8b2b59fd0fff8d6d2aabbfcb0f@teo-en-ming-corp.com>
Reply-To: ceo@teo-en-ming-corp.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        teo-en-ming-corp.com; h=content-transfer-encoding:content-type
        :organization:message-id:user-agent:reply-to:subject:to:from
        :date:mime-version; s=dkim; t=1625839860; x=1628431861; bh=bwEEU
        ChHB35yVkJoQfaa1mW0ZyUELEecprCjBIKOngM=; b=g5skeBi0wU2lMgFgyIHai
        3V0QMMjjjq+uJz9xklZ+j7OX34G3sSpnB6MCDQDbGS4kaY0+vjmEa3cl6o7s+xmZ
        bBxSwxQ1S8TWET+XDgcPxivLa7pLfT7Y3CChM/QJah/MHlScIQFZFL+K/288mZU2
        Bed2YyUJTC1+LVlzco2pIJUmAjSwLgzYARwD60LMVxMjJMxSvpeumN3c4SHVkOBF
        bpg4FRTWHYoL5Uo8f2TPN4W/5roGzyUsiaTKL283Z/wgCrXNjRmFcyg6C0jCRBEo
        okAYaqYJEcXpPs/6aqtEXPU7Obv0yQcrBJHlpYdkJA3X8Jxm8ZOR8Pgu+cHyabHz
        A==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Subject: [UPDATE 1] Decommissioned Cisco ASA 5506-X Firepower Firewall 
and Deployed Fortigate 60F Firewall for an Investment Company in 
Singapore on 8 July 2021 Thursday

Good day from Singapore,

On 8 July 2021 Thursday, between 2 PM and 5 PM Singapore time, I have 
decommissioned a Cisco ASA 5506-X Firepower Firewall and 
deployed/replaced it with Fortigate 60F firewall for an investment 
company in Singapore.

Configuration of the Fortigate 60F firewall appliance includes Duo 2FA 
integration and SSL VPN. You will also need to configure a RADIUS server 
on your Windows Server 2016/2019 in the same network as the Fortigate 
using Duo Authentication Proxy. No other RADIUS server is necessary.

The firmware of Fortigate 60F firewall has been upgraded to the latest 
version 7.0.0.

The most singular point about this Fortigate 60F firewall appliance 
deployment is that the SSL VPN uses Duo 2FA instead of Fortitokens. It 
is a rather unusual setup. You can read about Duo 2FA integration with 
Fortigate SSL VPN below.

Reference Guide: Fortinet FortiGate SSL VPN with RADIUS Auto Push
Link: https://duo.com/docs/fortinet

If your enterprise/business/corporate internet plan has a dynamic IP 
address, you need to configure FortiGuard Dynamic DNS (DDNS).

Reference Guide: DDNS
Link: 
https://docs.fortinet.com/document/fortigate/latest/administration-guide/685361/ddns

Before you can configure FortiGuard DDNS, you need to register your 
Fortigate firewall appliance at https://support.fortinet.com/ with the 
serial number and contract number.

To configure the SSL VPN tunnel, you need to read the following guide.

Reference Guide: Configuring the SSL VPN tunnel
Link: 
https://docs.fortinet.com/document/fortigate/6.0.0/cookbook/690301/configuring-the-ssl-vpn-tunnel

It is also mandatory to add firewall security policies otherwise your 
SSL VPN tunnel will not work.

Reference Guide: Adding security policies
Link: 
https://docs.fortinet.com/document/fortigate/6.0.0/cookbook/364638/adding-security-policies

In short, you will need to configure the following security policies on 
your Fortigate firewall:

(1) internal/LAN to WAN1 (otherwise known as outgoing internet access 
policy)

(2) allow SSL VPN tunnel to access your internal network

(3) allow SSL VPN tunnel to access the internet (optional)

The last one will be an IMPLICITY DENY security policy to block all 
incoming connections.

There are, of course, many other guides to follow but I will only list 
the above guides for now.

Single-handedly, I spent a few days (over a period of about 2 weeks) to 
configure this Fortigate 60F firewall appliance before actual day 
deployment on 8 July 2021 Thursday. On the day of deployment at our 
customer's site, it is just plug and play. The whole process was very 
smooth. There were no hiccups.

Fortigate firewall appliances are based on open source Linux. Sophos 
firewall appliances are also based on open source Linux. Cisco ASA 
firewall appliances are also based on open source Linux.

Mr. Turritopsis Dohrnii Teo En Ming, 43 years old as of 9 July 2021, is 
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
