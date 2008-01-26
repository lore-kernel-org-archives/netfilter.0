From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Can I block nat'ed user with iptables?
Date: Sat, 26 Jan 2008 09:39:43 +0100
Message-ID: <001101c85ff6$ffbf9bc0$ff3ed340$@info>
References: <694519.56558.qm@web55415.mail.re4.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <694519.56558.qm@web55415.mail.re4.yahoo.com>
Content-language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> i have internet router using linux & i want only user1
> can access internet & user2 can't
> but if user1 use program like ccproxy, user2 can using
> internet from user1 as proxy server
> 
> is't possible to block user from being nat'ed with
> iptables?

Sure.

INET_IP="a.b.c.d" # Your internet IP address
USER_IP="192.168.0.11" # IP of user1
LAN="192.168.0.0/24" # LAN where user1 is in

$ipt -P FORWARD DROP
$ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
$ipt -A FORWARD -m state --state NEW -s $USER_IP -j ACCEPT
$ipt -t nat -A POSTROUTING -s $LAN -j SNAT --to $INET_IP

Here, it's possible to perform NAT for the entire LAN (see the rule for
the nat table). However, the policy for the FORWARD chain in the filter
table (which is where most of us do filtering) is set to DROP so every
packet that did not match a rule that accepts a packet will be dropped.
Only ESTABLISHED and RELATED packets (which will be the most) will be
accepted, as well as NEW packets from user1. This way only user1 will be
able to use the internet (assuming routing is setup correctly). It's up
to you to get ccproxy on the PC of user1 working.


Grts,
Rob


