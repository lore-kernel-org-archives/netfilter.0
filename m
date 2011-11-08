From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: [iptables] Effect of negating multiple source or dest IPs (-s or
 -d)
Date: Tue, 08 Nov 2011 16:56:59 +0100
Message-ID: <j9bjgb$v1f$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

What's the effect of this rule on a multihomed box
(the IPs below are just some examples, not real):

   iptables -A INPUT ! -d 1.2.3.4,2.3.4.5 -p all -j DROP

Will it drop all packets not destined to both these IPs?
Or will it drop all packets but for the first IP?

Ie. when negating a rule on multiple elements, is then
the result an AND or an OR combination?
Ie. is it then !ip1 AND !ip2, or is it !ip1 OR !ip2 ?  :-)

Man page says this:
   [!] -s, --source address[/mask][,...]
   [!] -d, --destination address[/mask][,...]
     A "!" argument before the address specification inverts the sense of the address. [...]
     Multiple addresses can be specified, but this will expand to multiple rules (when adding with -A),
     or will cause multiple rules to be deleted (with -D).

