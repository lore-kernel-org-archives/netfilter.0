From: "Olshvang, LevX" <levx.olshvang@intel.com>
Subject: My extension check routine is called on every iptables command
Date: Mon, 15 Aug 2011 12:25:24 +0300
Message-ID: <FE06BAB9E17C4742BB3BE97B2D419D8C2D0D24D70F@hasmsx502.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

G'day !

I have back ported Port Trigger for kernel 2.6.18 iptables 1.4.9


I had a debug print to trace function invocation and I had noticed a strange effect
 on every iptaple command the trigger_check() ( registered as .checkentry=trigger_check ) from the kernel extension is invoked and prints a tracing  message

I wonder how it may happen, it seems that iptables scans the whole tree of netfilter structures ?  


ThanX
Lev

 

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

