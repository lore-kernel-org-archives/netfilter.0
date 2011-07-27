From: "Olshvang, LevX" <levx.olshvang@intel.com>
Subject: Why Port trigger of DD-WRT requires nat table storing trigger ?
Date: Wed, 27 Jul 2011 10:44:15 +0300
Message-ID: <FE06BAB9E17C4742BB3BE97B2D419D8C2D0D00D5C1@hasmsx502.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi all, 

I am porting DD-WRT port trigger implementation taken from DDWRT project.
The logic of port trigger says : wait for somebody from LAN (br0 interface) to send tcp packed to port 6889 to Internet peer.
Then Internet peer replies by sending packet to related port 9881 and firewall makes dnat translation.


Port trigger is set up in 3 iptables commands:
#iptables -t nat -A prerouting_wan -p tcp --dport 9881:9889 -j TRIGGER --trigger-type dnat
#iptables -A forwarding_wan -p tcp --dport 9881:9889 -j TRIGGER --trigger-type in
#iptables -t nat -A prerouting_rule -i br0 -p tcp --dport 6889 -j TRIGGER --trigger-type out --trigger-proto all --trigger-match 6881-6889 --trigger-relate 9881-9889



The last command inserts rule into nat table, and the trigger implementation code gives an error if a mangle table is used instead.

The question is why ?

The code which handles this specific line just creates trigger structure, and it does not use any of nat functions.

The code is here :
http://svn.dd-wrt.com/browser//src/linux/xscale/linux-2.6.24/net/ipv4/netfilter/ipt_TRIGGER.c


I think it is perfectly safe to use mangle table instead, otherwise I do not understand smthing ?

Regards,
Lev



---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

