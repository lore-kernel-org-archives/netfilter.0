From: Maarten Vanraes <maarten@ba.be>
Subject: xtables-addons ACCOUNT
Date: Mon, 18 Oct 2010 17:12:03 +0200
Message-ID: <201010181712.03160.maarten@ba.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I can't get it working myself:
 * kernel: 2.6.26-2-amd64 (debian lenny)
 * iptables: 1.4.8
 * xtables-addons: 1.26


- man pages tell us to use CIDR notation; however syslog shows in the error 
messages "network/netmask" notation (255.255.255.0)
- removing the rule with iptables -D removes the rule, but it seems not the 
account table.
- iptaccount -h doesn't remove it either
- modprobe -r xt_ACCOUNT doesn't either
- i always get 0 rules or something
- adding the rule after it's been deleted doesn't work, i get error messages 
about wrong parameters
- adding a diff addr with same name succeeds, but gives error messages in 
syslog


Do i do something wrong; or is there a bug in here?

Kind Regards,

Maarten Vanraes
