From: "Jens Wachtel - Partyfans Ltd." <jens.wachtel@partyfans.com>
Subject: Policy Based Routing Problem
Date: Mon, 24 Sep 2007 20:15:48 +0200
Message-ID: <46F7FED4.7030709@partyfans.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

First i must say, that this is my first mailinglist entry i've ever wrote.
(So, please sorry if i did anything wrong!)

I have the following problem:

I must make a policy based routing, and for that i  tried two tutorials.
One of them
http://lartc.org/lartc.html#LARTC.NETFILTER

First, it does not work and i think it must be something to do with the 
iptables version, cause
-> on a testing machine i use (Debian 3.1 with installed iptables 1.2.11)
-> and my production machine (Debian 4.0 Etch with installed 1.3.6)

To route the traffic i must use this command

# iptables -A PREROUTING -i eth0 -t mangle -p tcp --dport 21 \
 -j MARK --set-mark 1

(i do the other things correctly how discribed)
And on this command my Debian 3.1 machine do not bring a warning!
But if i type this command to my Debian Etch Machine, the following 
error occurs:

www01:~# iptables -A PREROUTING -t mangle -p tcp -d 172.16.32.2 --dport 
21 -j MARK --set-mark 1 -v
MARK  tcp opt -- in * out *  0.0.0.0/0  -> 172.16.32.2  tcp dpt:21 MARK 
set 0x1
iptables: Invalid argument

Sadly i cannot probe my scenario with Debian 3.1, so no idea if this 
would work.
But fact is on my 4.0 Machine with newer iptables version, i became 
"Invalid argument"

I look at the man page and tried some other things and other orders but 
nothing work.
So sadly i am not an iptables guru and have no more ideas what i could to do

Do anybody have an idea what i do wrong?

Thanks for your help

regards,
Jens


