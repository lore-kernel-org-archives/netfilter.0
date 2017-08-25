From: gazoxtapod <gazoxtapod@embarqmail.com>
Subject: Can't override filter section OUTPUT DROP / INPUT DROP Policy
Date: Fri, 25 Aug 2017 14:16:28 +0000
Message-ID: <59A0313C.1020409@embarqmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; d=embarqmail.com; s=ctl201402; c=relaxed/simple;
        q=dns/txt; i=@embarqmail.com; t=1503670592;
        h=From:Subject:Date:To:MIME-Version:Content-Type;
        bh=OdE2JPKyNjPBZdggWW3Ni0AxnB0=;
        b=A9RSfoWaLe9UftUsxrHdyxcPyl2JMXLJzU0JRz6Nj/FRe8zTmUUBPPmjkPiZpviV
        9KzI+vMmiNRfISb4knzZflAI3sFa3anSHyaYjs/ZuxRoFCoXok34vzboqnqJKx+c
        FwvOGU1OyrQzUxiB1Eu4nZVEYmdqKsZX1Gg6UWgKbvsi64tNtdw3emrR6phZUCxg
        xNuAw9MhmiVGltzwu6RI8Wp0BOQgpUXUAvaTMrSGmg9Nq+g0Fad0oWybHSNU7iXQ
        4jSasDkmU4cxHYT7iy9pZb1katISGkf/iIy9J+YSG6hEmLKEU0XPghAkD2VWLPwI
        M+/e3C+/R2SRsLkbQ2A4OA==;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Esteemed List Participants and Lurkers:    NEWBIE ALERT!
==============================================================
Raspberry Pi 2 - Raspbian GNU/Linux 8 (jessie)
iptables v1.4.21  -  ufw v0.33-2
==============================================================
I'm trying to use the Pi2 as an appliance to monitor DSL Usage from my 
DSL modem (192.168.0.1), which is between a (nearly default 
configuration) firewall router for my LAN and the ISP.  The Pi2 box 
project, when completed, is strictly an appliance that is a client to 
the modem, reading date/time and DSL usage and error status, and 
displaying this on an LCD display.

* I need to allow the Pi2 to negotiate a DHCP request for an IP address 
from the router on bootup. (This is the system default - no need to do 
anything)
* I need to allow the Pi2 to make a periodic connection to the modem and 
fetch data. (I do this with Python Requests - it works)
* I am trying to block all other types of incoming and outgoing 
connections. This is what I can NOT do.

I have tried to research this extensively and at least found this thread 
which is somewhat similar to my basic approach:
  . . DROP policy, serious vulnerability?
  . . http://www.spinics.net/lists/netfilter/msg56020.html

I have tried various tests using 'ufw' and 'iptables' with little to no 
success.  I did discover that "ufw" commands are persistent, and 
"iptables" are dynamic, but not persistent (I think that is right?).

Here is what I 'think' I am trying to do:

sudo iptables -P INPUT DROP        <--  P:Policy
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT DROP
sudo iptables -A OUTPUT -s 192.168.0.1 -j ACCEPT  <--A:Append s:source 
j:jump
sudo iptables -A INPUT -s 192.168.0.1 -j ACCEPT   <--don't need this?

I found the rule for what I think is the DHCP negotiation in the 
unmodified original iptables --list:
-A ufw-before-input -p udp --sport 67 --dport 68 -j accept

OK.  I did discover that "iptables -F" cleans out everything in the 
(non-persistent) --list very nicely and leaves only the 3 filter section 
default policies.  With "ufw enable", as soon as I set "default deny 
outgoing" (-P OUTPUT DROP) as the policy, NOTHING I do overrides that 
and I have no browser connection ability to the modem.  As soon as I set 
"default deny incoming" (-P INPUT DROP) as the policy, NOTHING I do 
overrides that.  I have been using "ping" from an adjacent desktop on 
the LAN (192.168.1.104) to test incoming connections, and it works only 
with "ufw disable" ... EVERYTHING works wide open when disabled, as 
expected, so the firewall router is not getting in the way.

I have managed to get the --list in this configuration, but all access 
to the modem (via the browser) and is blocked. (using ping system URL, 
ping blocked as well):

root@artypi:~# iptables -L -v
Chain INPUT (policy DROP 2 packets, 64 bytes)
  pkts bytes target   prot opt in   out  source      destination
     0     0 ACCEPT   all  --  any  any  192.168.0.1 anywhere

Chain FORWARD (policy DROP 0 packets, 0 bytes)
  pkts bytes target   prot opt in   out  source      destination

Chain OUTPUT (policy DROP 2 packets, 152 bytes)
  pkts bytes target   prot opt in   out  source      destination
     0     0 ACCEPT   all  --  any  any  192.168.0.1 anywhere

* Is the order of the Policies and the rules wrong? can it be changed?
* How can I achieve my objectives to block all access, except allow 
Python Requests (and browser?) access to the modem?

After that, is the above rule for DHCP correct if I use INPUT and/or 
OUTPUT chains instead of the "ufw-before-input" chain?

Thank you for your gracious patience, and for any and all comments, 
suggestions, and assistance.
Blessings in abundance, all the best, & ENJOY!
Art in Carlisle, PA USA

P.S.: I also found this article, but it didn't seem to help me at all: 
Iptables Drop rule - strange behaviour, 
https://www.spinics.net/lists/netfilter/msg52940.html
