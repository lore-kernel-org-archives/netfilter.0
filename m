From: James <vger_tracker@trackivity.com>
Subject: nft set "interval" and "timeout" don't like each other?
Date: Thu, 27 Oct 2016 19:12:06 -0400
Message-ID: <aeb1899d-6f23-e0a1-ffbb-469d6c2dba1a@trackivity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Question: if I'm simply patient then will they play nicely together sometime in the future?  Or is there a logic to this?

---

No panic here, but I did wind up going "argh!!! no!!!" when I tripped over this.  (Sorta like "so close yet so far away!")

Ubuntu 16.10 -> nftables 0.6 -> attempting to add a set with both "interval" and "timeout" throws an error.

If I leave out the "timeout" and create an "interval" set then I can add an element with a timeout without error but it does ignore the timeout.

On the other hand, I *can* add a single address to an "interval" set... I like that!

user@pc:~$ sudo nft add table inet firewall
user@pc:~$ sudo nft add set inet firewall v4blacknets { type ipv4_addr\; flags interval\; timeout 1h\; }
<cmdline>:1:1-81: Error: Could not process rule: Operation not supported
add set inet firewall v4blacknets { type ipv4_addr; flags interval; timeout 1h; }
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
user@pc:~$ sudo nft add set inet firewall v4blacknets { type ipv4_addr\; flags interval\; }
user@pc:~$ sudo nft add element inet firewall v4blacknets { 1.2.3.4/24 timeout 2h }
user@pc:~$ sudo nft add element inet firewall v4blacknets { 2.3.4.5 timeout 4h }
user@pc:~$ sudo nft list ruleset
table inet firewall {
	set v4blacknets {
		type ipv4_addr
		flags interval
		elements = { 1.2.3.0/24, 2.3.4.5}
	}
}
user@pc:~$

  - James
