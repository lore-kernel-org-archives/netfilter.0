From: Joakim Wennergren <jocke@dovado.com>
Subject: Error om "-m state" - kernel configuration wrong??
Date: Thu, 25 Oct 2007 17:49:12 +0200
Message-ID: <1193327352.2992.6.camel@pierre-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello.

I've recently upgraded my kernel from 2.6.14 to 2.6.19 and now iptables
doesn't work anymore. I get this error message:

# iptables -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK SYN,ACK -m
state --state NEW -j DROP
iptables v1.3.6: Couldn't find match `state'

I've looked through the kernel configuration, and it seems I have to
activate NETFILTER_XT_MATCH_STATE, which seems to replace
IP_NF_TARGET_CLASSIFY (which no longer exists). However, when I do this,
it still doesn't work.

In fact, nothing I activate under the new "Core Netfilter configuration"
folder in the kernel configuration (like "netfilter netlink" and xtables
support) seems to affect the iptables command.

Does anyone have any ideas? Am I even on the right track?


This email was Anti Virus checked by Astaro Security Gateway.

