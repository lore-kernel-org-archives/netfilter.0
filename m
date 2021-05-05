From: Turritopsis Dohrnii Teo En Ming <ceo.teo.en.ming@gmail.com>
Subject: [SOLVED] Webmin web user interface on Linux mail server is inaccessible
Date: Wed, 5 May 2021 22:05:13 +0800
Message-ID: <CAMEJMGHrC4-qETY_wJwXgf29Fg5xAMkGwQEEPkpf=aCNbYaDYw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=+kUG2TF6F8iWfu+HwbHtfgMioS65PmKIUJ2leMhWyQE=;
        b=RZobEzB3txbKPu+R2neeGzM6dsvQVzLdb2djIHG1gVDJABj1TksFXGSM+oS/I25JGN
         CRvvhKpHt1MpuLve80gk6c57+hUkEzdei7ENwRGyB5en3+qDv3ph1NXLf3R8Js1j4QsI
         O/pQ32K4sa2CPYqXITgGOq0ZHT0un6lT0JibJnd4g3YJMzlXLdY8XiIe/17ZmaiXRLtr
         VBS1R6AN1OBNOc1ZyHz+oWuXuO4JPoyWgyRCVS229A7YgqeUAEHajRa3DYJ2y0BiCglU
         5oYWWOXwG+9zI3DEQm6ua6jN7eCH8jAJUHLHyjatZq3jNq9qKQnToBB8X+CB7x7xvwCI
         pzoQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: ceo@teo-en-ming-corp.com

Subject: [SOLVED] Webmin web user interface on Linux mail server is inaccessible

Good day from Singapore,

Today 5th May 2021 Wed, my colleague Edward Joseph Snowden (fictitious
name used here) told me that Webmin web user interface on client's
Linux mail server is not accessible.

So I putty/ssh into the Linux mail server, which is a CentOS 6.8.

First thing, I checked the configuration of Webmin.

# ps -ef | grep webmin

/usr/bin/perl /usr/libexec/webmin/miniserv.pl /etc/webmin/miniserv.conf

# nano /etc/webmin/miniserv.conf

Partial Contents of /etc/webmin/miniserv.conf:

port=10101

listen=10101

From the above snippets, Webmin is not listening on the default port
of 10000 but 10101.

Then I proceeded to check the running Linux iptables firewall rules.

# iptables -S | grep 10101

I noticed that TCP port 10101 is NOT open.

I checked /etc/init.d/iptables

Partial Contents of /etc/init.d/iptables

IPTABLES=iptables

IPTABLES_DATA=/etc/sysconfig/$IPTABLES

IPTABLES_FALLBACK_DATA=${IPTABLES_DATA}.fallback

IPTABLES_CONFIG=/etc/sysconfig/${IPTABLES}-config

IPV=${IPTABLES%tables} # ip for ipv4 | ip6 for ipv6

[ "$IPV" = "ip" ] && _IPV="ipv4" || _IPV="ipv6"

PROC_IPTABLES_NAMES=/proc/net/${IPV}_tables_names

VAR_SUBSYS_IPTABLES=/var/lock/subsys/$IPTABLES

From the above snippet, Linux iptables firewall rules are saved in
/etc/sysconfig/iptables

I checked /etc/sysconfig/iptables and noticed that it contains the
following line:

[root@mail.teo-en-ming-corp.com init.d]# cat /etc/sysconfig/iptables |
grep 10101

-A INPUT ! -i lo -p tcp -m state --state NEW -m tcp --dport 10101 -j ACCEPT

Apparently the saved iptables firewall rules DO allow TCP port 10101.

To solve the problem, I executed the following command.

# service iptables restart

This allows the saved iptables firewall rules to be reloaded. Now TCP
port 10101 is open in the Linux iptables firewall.

Besides the above issue, I also noticed that new iptables firewall
rules were added to block the Windows Server in the same subnet from
accessing it.

# iptables -S | grep xxx

-A DENYIN -s 192.168.1.xxx/32 ! -i lo -j DROP

-A DENYOUT -d 192.168.1.xxx/32 ! -o lo -j LOGDROPOUT

I proceeded to delete the above 2 iptables firewall rules.

# iptables -D DENYIN -s 192.168.1.xxx/32 ! -i lo -j DROP

# iptables -D DENYOUT -d 192.168.1.xxx/32 ! -o lo -j LOGDROPOUT

Now Webmin web user interface is accessible from the Windows Server in
the same subnet. Turritopsis Dohrnii Teo En Ming has solved the
problem.

Mr. Turritopsis Dohrnii Teo En Ming, 43 years old as of 5th May 2021,
is a TARGETED INDIVIDUAL living in Singapore. He is an IT Consultant
with a System Integrator (SI)/computer firm in Singapore. He is an IT
enthusiast.





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
