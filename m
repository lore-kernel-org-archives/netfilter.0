From: "Olshvang, LevX" <levx.olshvang@intel.com>
Subject: Q:when ip6tables should be used instead of iptables ?
Date: Thu, 4 Aug 2011 17:54:49 +0300
Message-ID: <FE06BAB9E17C4742BB3BE97B2D419D8C2D0D1399BD@hasmsx502.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This question may  be sound trivial, of course when dealing with IPv6 addresses ip6tables is appropriate.

But if I have machine with dual IPv4/IPv6 stack , does it mean that netfilter have separate set of tables/chains for IPv4 and IPv6 so I need to have  2 set of commands to protect for example from syn flooding ?

Or in another terms which of iptable command are IPv4/v6 neutral?


Regards,
Lev 
---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

