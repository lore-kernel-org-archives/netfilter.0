From: lst_hoe02@kwsoft.de
Subject: [OT] Network Firewall settings with sysctl
Date: Mon, 22 Nov 2010 15:30:06 +0100
Message-ID: <20101122153006.160569ahmw2upi80@webmail.kwsoft.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: netfilter@vger.kernel.org

Hello

i'm looking for clarification on some /proc/sys/net/ipv6/conf/ entries  
for firewalling. From what i have read a setting of for example  
/proc/sys/net/ipv6/conf/all/autoconf -> 0 should set this value for  
all interfaces? But when i do "sysctl -a" to check the value all  
interface related entries are still autoconf->1. Is this expected  
behavior or a bug? Does it only apply after reboot or what have i  
missed? This is Ubuntu 10.04 (kernel 2.6.32) with iptables 1.4.4.

Many Thanks

Andreas


