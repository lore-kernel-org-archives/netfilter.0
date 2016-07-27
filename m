From: Saeed Abbassi <saeed144@gmail.com>
Subject: ulogd.c:522 error during propagate_results
Date: Wed, 27 Jul 2016 15:47:18 -0400
Message-ID: <CALp86C6itcb69x=t8z-qAWzs=aZeK75mp_LVVe+X3r+nHGz70Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=dt4SkzJAKBQpQLAN44RwMQ47EKedfHNTcIca9OMrkqY=;
        b=JdJu8LbhRPJQShtlzsXvqKfxqzDLsVEo86kRNMf2YLmFGTI4oY3dSMPe11Va0ss18l
         hoXmUqFuFctOBC4dAKazkLedWqkPwr2C9WwzbCn4PCLNZanZk9GfJ6jPGyUi4Ch6mNpu
         lCcuTRHO2z5vzDjYxV903c9ZF8eenyfG9znrpFT+klt+xpLYe4nqmi1iZPLeV/aVSX3i
         5bPUguYNdu7jv/1Mw7wD1K0h26Hbzbr16kW0PKo0PKQdpZpiAQ/3NDy1YRqJzTt1BaU/
         Ksb/Vf5RXfw9Y1GjBFGR8V3lobFXTPTyH769LUOcvi7gGSrxvwkL97PkE4npoNugVya1
         5B+g==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello all

I thank you for the great package you provided for logging of iptables
flow/policy.

#Issue
 I'm getting a lot of "ulogd.c:522 error during propagate_results" in
the /var/log/ulogd/ulogd.log file.
Which sometimes breaks the ulogd logging functionality.

#Specs
  In my lab, I'm using ulogd-2.0.4-3.el7.lux.1.x86_64 on CentOS 7,
4.6.3-1.el7.elrepo.x86_64.
Mostly, it works, and logs the packets into
/var/log/ulogd/ulogd_syslogemu.log file.
The command to enable NFLOG in iptables
sudo ip netns exec namespace1 iptables -A FORWARD -j NFLOG
--nflog-group 1 --nflog-prefix namespace1

#Config
Here's the configuration I'm using in /etc/netns/namespace1/ulogd.conf
stack=log1:NFLOG,base1:BASE,ifi1:IFINDEX,ip2str1:IP2STR,mac2str1:HWHDR,print1:PRINTPKT,emu1:LOGEMU

[log1]
group=1
netlink_socket_buffer_size=1736704
netlink_socket_buffer_maxsize=1085440
netlink_qthreshold=10
netlink_qtimeout=5

#Question
Is there anything I'm missing, or is this a known bug?

Thank you in advance
Saeed
