From: Turritopsis Dohrnii Teo En Ming <ceo.teo.en.ming@gmail.com>
Subject: How to install iptables as a systemd service and allow outgoing
 connection to Synology NAS
Date: Sun, 22 Aug 2021 17:01:00 +0800
Message-ID: <CAMEJMGHM0KACoXgB_UHOm9Uc9j_VRmDUR4G-6Gt+3_o+hMVerA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=zrFBmnSSvhl4EwzdB4AFevTFLJRhnLw0LG46tKYlflM=;
        b=RL25lzfcbItnBhSgQpDBkFAuqrzR90LGlOgPpB4z1mvjwbTHrL8sr+Bhbd66L7KitN
         wIYXx6eDH1qJtqqKrTRbYjyeMVal/Jr3yxQDrmKHlrBYWWzMmPRPbo6LRXVkI9YXB7Yr
         af4ZPlbLt1M6WDbcpkcFTYq4yCUhScIuB2eOwDHZ02PG/WJ2qP/bkCZdyNm1zMr+WgJv
         ek1CNO/EELc+Uvx/jpBOcRBNUT3nQIbgt979AGVl1DqtrIGCGBUBASF3dcQ5e2QuYSF3
         3IhfOowFrn7AkYCxd2oJvYJEdDhdj9nkXGw/un7nbeXQmhYQpf+6Hbw2uB6lPCSBQGh6
         Ydlg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: ceo@teo-en-ming-corp.com

Subject: How to install iptables as a systemd service and allow
outgoing connection to Synology NAS

Author: Mr. Turritopsis Dohrnii Teo En Ming (TARGETED INDIVIDUAL)
Country: Singapore
Date: 22 August 2021 Sunday Singapore Time

Type of Publication: Plain Text

Document version: 20210822.01

DETAILED STEPS
===============

Save the existing iptables firewall rules to a file named
/etc/sysconfig/iptables.

# iptables-save > /etc/sysconfig/iptables

Add the following lines to /etc/sysconfig/iptables, to allow outgoing
connection to Synology NAS.
Assume 192.168.1.5 is the IP address of the Synology NAS.

# nano /etc/sysconfig/iptables

-A OUTPUT -d 192.168.1.5/32 ! -o lo -p tcp -m tcp --dport 135:139 -j ACCEPT
-A OUTPUT -d 192.168.1.5/32 ! -o lo -p udp -m udp --dport 135:139 -j ACCEPT
-A OUTPUT -d 192.168.1.5/32 ! -o lo -p tcp -m tcp --sport 135:139 -j ACCEPT
-A OUTPUT -d 192.168.1.5/32 ! -o lo -p udp -m udp --sport 135:139 -j ACCEPT
-A OUTPUT -d 192.168.1.5/32 ! -o lo -p tcp -m tcp --dport 445 -j ACCEPT
-A OUTPUT -d 192.168.1.5/32 ! -o lo -p udp -m udp --dport 445 -j ACCEPT
-A OUTPUT -d 192.168.1.5/32 ! -o lo -p tcp -m tcp --sport 445 -j ACCEPT
-A OUTPUT -d 192.168.1.5/32 ! -o lo -p udp -m udp --sport 445 -j ACCEPT

Reload iptables firewall rules from /etc/sysconfig/iptables.

# iptables-restore < /etc/sysconfig/iptables

Install iptables systemd service.

# yum install iptables-services

Start iptables systemd service.

# systemctl start iptables

Allow iptables systemd service to start across reboots.

# systemctl enable iptables

# service iptables save

Above command will save iptables firewall rules into /etc/sysconfig/iptables.

Mr. Turritopsis Dohrnii Teo En Ming, 43 years old as of 22 August
2021, is a TARGETED INDIVIDUAL living in Singapore. He is an IT
Consultant with a System Integrator (SI)/computer firm in Singapore.
He is an IT enthusiast.





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
