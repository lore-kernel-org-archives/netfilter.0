From: Tore Anderson <tore.anderson@redpill-linpro.com>
Subject: Jumping to chains dynamically based on interface name
Date: Thu, 08 Oct 2009 10:07:42 +0200
Message-ID: <4ACD9DCE.9070509@redpill-linpro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I'm building a "router on a stick" type of firewall using netfilter,
which have a two dedicated chains per interface (egress+ingress).  This
causes a large FORWARD and FORWARD-EGRESS chains with rules that match
on interface name and jumps to the appopriate interface-specific chain.
 I've been wanting to replace them all with just one rule per direction:

iptables -A FORWARD -j ${in-interface}-ingress
iptables -A FORWARD-EGRESS -j ${out-interface}-egress

Is that possible somehow?

Best regards,
-- 
Tore Anderson
Redpill Linpro AS - http://www.redpill-linpro.com/
Tel: +47 21 54 41 27
