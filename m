From: Notify Me <notify.sina@gmail.com>
Subject: Help Needed In Modifying Standalone Firewall Rules to Support Port-Forwarding
Date: Sun, 8 Dec 2013 22:36:58 +0100
Message-ID: <CACK8u8JPTENmRkdQ5LX4C1jctqMgYYEeF-FfzHOWd2jZfyMyoA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=D6/inP9N6IsYaqSZDtN/nG7HVJLyCWEAhkb9L4hCMgw=;
        b=e43ztwJA1NgR8e7N5sAB1gtT0xup1epSMgHeX14F/NflG48LI1eEIGMOoasrGl2gQa
         l17r1KJJXuwLmBqjJTeeagYpsEgKkUeKIiiURXkpR/TOtnUpQFZn1yH+X70g8zZS1WF+
         olDMphxkA9CqHKUOsDDsoCVMZ2TY2QfhfKdeeJgBhKTJkX4wudU+2LG1GUXEWdxeaU1c
         ZDFtA/f7anN3GqcXSlrEFi33H5EoNm9Cvocnosxe/Zw93IaFFiUFPmsSCiJiiRhb6J8m
         SnbayCkOm+rUUxL4ljhRf4sBbpXATg7N3VqCWid+BYp/xHbkYrQheHSejZyaw2eZ109K
         isBg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi!

I apologize if this is too much of a newbie question, but I'm really stumped.

Please I need some assistance with an iptables ruleset.
Its for a standalone server (A) with a single interface. This single
interface's IP is the only one allowed to reach an external network
socket 1.1.1.1:8085 (not controlled by me).
I thought I can allow another system (B) to access to this network by
portforwarding connections from B through A and back again.
In order to do this, I enabled ip forwarding on A, and created a
virtual interface on A that I want B to be able to connect to A to
access 1.1.1.1:8085.
Unfortunately this isn't working as expected.
Please can someone take a look at my ruleset and show me what I am doing wrong?
Very grateful for the assist!

A's iptables ruleset:
(B's IP address: 192.168.X.1)
*filter
:INPUT DROP [88:23672]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [294:21022]
-A INPUT -i lo -j ACCEPT
-A INPUT -i eth0 -p tcp -m multiport --dports
22,85,86,443,5666,8080,8088,8443,9443,60514 -m state --state
NEW,ESTABLISHED -j ACCEPT
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p icmp -m icmp --icmp-type 0 -j ACCEPT
-A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT
-A INPUT -p tcp -m tcp --tcp-flags SYN,ACK SYN,ACK -m state --state NEW -j DROP
-A INPUT -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j DROP
-A INPUT -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
-A INPUT -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
-A INPUT -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG
FIN,SYN,RST,ACK,URG -j DROP
-A INPUT -p tcp -m tcp --tcp-flags FIN,RST FIN,RST -j DROP
-A INPUT -p tcp -m tcp --tcp-flags FIN,ACK FIN -j DROP
-A INPUT -p tcp -m tcp --tcp-flags PSH,ACK PSH -j DROP
-A INPUT -p tcp -m tcp --tcp-flags ACK,URG URG -j DROP
-A INPUT -i eth0 -p tcp -m state --state NEW -m recent --set --name
DEFAULT --rsource
-A INPUT -i eth0 -p tcp -m state --state NEW -m recent --update
--seconds 30 --hitcount 10 --name DEFAULT --rsource -j DROP
-A FORWARD -i eth0 -p tcp -m state --state NEW -m recent --set --name
DEFAULT --rsource
-A FORWARD -i eth0 -p tcp -m state --state NEW -m recent --update
--seconds 30 --hitcount 10 --name DEFAULT --rsource -j DROP
-A OUTPUT -o lo -j ACCEPT
-A OUTPUT -o eth0 -p tcp -m multiport --sports
22,85,86,443,5666,8080,8088,8443,9443,60514 -m state --state
ESTABLISHED -j ACCEPT
-A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A OUTPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT
-A OUTPUT -p icmp -m icmp --icmp-type 0 -j ACCEPT
COMMIT

#
*nat
:PREROUTING ACCEPT [16:3245]
:POSTROUTING ACCEPT [5:300]
:OUTPUT ACCEPT [5:300]
-A PREROUTING -s 192.168.X.1/32 -i eth0 -p tcp -m tcp --dport 8085 -j
DNAT --to-destination 1.1.1.1:8085
-A POSTROUTING -j MASQUERADE
COMMIT
