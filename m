From: jboyce@meridianenv.com
Subject: Block all input but two non-contiguous networks
Date: Wed, 27 Feb 2013 09:58:34 -0800 (PST)
Message-ID: <50296.23.25.137.89.1361987914.squirrel@www.meridianenv.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Greetings -

I am trying to figure out a simple way to block all incoming connections
to my server, except for two non-contiguous address ranges.  I thought I
could do it with a single rule, but that does not look to be the case, and
I am not sure how to do it.

My use case.
I have a Samba file server that has an fixed public ip address.  This
server also runs my OpenVPN instance.  I have done a good job configuring
my applications (Samba, SSH, hosts/allow/deny) to allow connections from
only my local network and my VPN network address.  However, I am seeing in
my Samba logs connection attemps directly to it that are getting denied. 
I would like to set a rule in iptables that denys these connection
attempts at an earlier point in the network.

My internal network is 192.168.112.0/24
My VPN network is 10.9.8.0/24

I was thinking logically that I could use something like the rule listed
below using negation, but I don't think this syntax is allowed.

iptables -I INPUT ! -s 192.168.112.0/24 OR 10.9.8.0/24 -j DROP

A little research indicates that rules with multiple network addresses
would be broken into two rules, such as below.

iptables -I INPUT ! -s 192.168.112.0/24 -j DROP
iptables -I INPUT ! -s 10.9.8.0/24 -j DROP

With the use of negation, this would cause a problem because the second
network range would not be allowed through, regardless of which rule was
listed first.

Can anyone offer any ideas on how I might be able to do something like
this with iptables.  Thanks.

Jeff Boyce
Meridian Environmental



