From: Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
Subject: Configuring Firewalld on CentOS 7.9 2009 Linux Server
Date: Wed, 09 Jun 2021 22:37:39 +0800
Message-ID: <ab789b9dacaa7527b159d8830eb53403@teo-en-ming-corp.com>
Reply-To: ceo@teo-en-ming-corp.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        teo-en-ming-corp.com; h=content-transfer-encoding:content-type
        :organization:message-id:user-agent:reply-to:subject:to:from
        :date:mime-version; s=dkim; t=1623249459; x=1625841460; bh=42jhP
        mZQl3bgOqG6o+s9M1muNWPrWbr04YvnF/Z/cvE=; b=VYH0iyEo8HDyD7z+81PNl
        8AGofJJapAF38zXHBYI5rJv7UhvIq42u3/svGGjALQFireokoNJgVpLpQD0CdAGC
        5c1vf4fA5CpqbwPN2rJqSKGvz+t6EKY2Amrgbdfz1k8Z5Zm/xWoc0W7qw0E7gCIn
        bwQBI+ac8h/Mtsirnw5p8Rbxvy1m2AXh876OU2WTMzfWFrpaa6dnIds0f+fUp7zr
        X3URoyOd5Mi4ootCm0waRtIRKpMzZb9IIGRRCANXab9Hsv7Uf0a2nKl6tAW4nFJy
        CRlfGw/Z09Fs6lcxrgzVVCpx4ZOg5BCnFS0hSks6nbaub1pXxT1A7neQiGPFwYlX
        Q==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Subject: Configuring Firewalld on CentOS 7.9 2009 Linux Server

Good day from Singapore,

I had a chance to setup CentOS 7.9 2009 Linux on Lenovo ThinkSystem 
SR550 (2U) server for a customer on 8 Jun 2021 Tuesday.

The hardware specifications of the server are as follows:

Lenovo ThinkSystem SR550 (2U) Server
=====================================

1x Intel Xeon Silver 4210R 10 Cores 100W 2.4 GHz Processor
1x ThinkSystem 16 GB TruDDR4 2933 MHz (2Rx8 1.2V) RDIMM
2x ThinkSystem 32 GB TruDDR4 2933 MHz (2Rx4 1.2V) RDIMM
1x ThinkSystem 8 GB TruDDR4 2933 MHz (1Rx8 1.2V) RDIMM
1x ThinkSystem RAID 530-8i PCIe 12Gb Adapter (RAID 0,1,5,10 - Zero 
Cache)
1x ThinkSystem 2U x16/x8 PCIe FH Riser 1
2x ThinkSystem 750W (230/115V) Platinum Hot-Swap Power Supply
1x 2.8 m, 13A/100-250V, C13 to C14 Jumper Cord
1x 2.8 m, 13A/100-250V, C13 to C14 Line Cord
1x ThinkSystem Toolless Slide Rail
2x Integrated 1 GbE RJ-45 ports
8x 2.5" HS Open HDD bays
Warranty: 3 Y P L, Onsite, 2Hr, 24x7
ThinkSystem XClarity Controller Standard to Advanced Upgrade
ThinkSystem XClarity Controller Advanced to Enterprise Upgrade
4x ThinkSystem 2.5" 2.4TB 10K SAS 12Gb Hot Swap 512e HDD (RAID 5)
2x ThinkSystem 2.5" 5300 960GB Entry SATA 6Gb Hot Swap SSD (RAID 1)

After completing the installation of CentOS 7.9 2009 Linux Server, I 
proceeded to install and configure Firewalld.

Firewalld is a frontend for netfilter iptables firewall.

Installing Firewalld
====================

# yum install firewalld

# systemctl enable firewalld

# reboot

Checking if Firewalld is running
=================================

# firewall-cmd --state

Output:

running

Checking for default zone
=========================

# firewall-cmd --get-default-zone

Output:

public

Checking for active zone
========================

# firewall-cmd --get-active-zones

Output:

public
   interfaces: eno1

List all services of the active zone
====================================

# firewall-cmd --list-all

Output:

public (active)
   target: default
   icmp-block-inversion: no
   interfaces: eno1
   sources:
   services: dhcpv6-client ssh
   ports:
   protocols:
   masquerade: no
   forward-ports:
   source-ports:
   icmp-blocks:
   rich rules:

Creating new zone
=================

# firewall-cmd --permanent --new-zone=custom

Output:

success

Listing all zones
=================

# firewall-cmd --permanent --get-zones

Output:

block custom dmz drop external home internal public trusted work

Restart Firewalld
=================

# firewall-cmd --reload

Output:

success

List all zones
==============

block custom dmz drop external home internal public trusted work

Assigning network interface to the new zone
===========================================

# firewall-cmd --zone=custom --change-interface=eno1

Output:

success

Open TCP port 22 for ssh
========================

# firewall-cmd --zone=custom --permanent --add-service=ssh

Output:

success

Restart Network and Firewalld
=============================

# systemctl restart network

# systemctl reload firewalld

Checking for active zone
=========================

# firewall-cmd --get-active-zones

Output:

public
   interfaces: eno1

Setting the default zone
========================

# firewall-cmd --set-default-zone=custom

Output:

success

Checking for default zone
=========================

# firewall-cmd --get-default-zone

Output:

custom

Checking for active zone
=========================

# firewall-cmd --get-active-zones

Output:

custom
   interfaces: eno1

Reboot the Linux Server
=======================

# reboot

Checking for default zone
==========================

# firewall-cmd --get-default-zone

Output:

custom

Checking for active zone
=========================

# firewall-cmd --get-active-zones

Output:

custom
   interfaces: eno1

Listing all services of active zone
====================================

# firewall-cmd --list-all

Output:

custom (active)
   target: default
   icmp-block-inversion: no
   interfaces: eno1
   sources:
   services: ssh
   ports:
   protocols:
   masquerade: no
   forward-ports:
   source-ports:
   icmp-blocks:
   rich rules:

===END===

Reference Guide: How To Set Up a Firewall Using FirewallD on CentOS 7
Link: 
https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-using-firewalld-on-centos-7

Mr. Turritopsis Dohrnii Teo En Ming, 43 years old as of 9 Jun 2021, is a 
TARGETED INDIVIDUAL living in Singapore. He is an IT Consultant with a 
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
