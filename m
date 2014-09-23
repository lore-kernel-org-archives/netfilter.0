From: Pavel Volkov <sailor@lists.xtsubasa.org>
Subject: Error configuring NAT with nftables
Date: Tue, 23 Sep 2014 21:35:38 +0400
Message-ID: <86bab9a1-ef10-4d20-aaac-22889659815f@lists.xtsubasa.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I've used nftables to perform filtering for a while and today I tried to 
configure it for NAT.

I took the example from nftables wiki [1]:
% nft add table nat
% nft add chain nat prerouting { type nat hook prerouting priority 0 \; }
% nft add chain nat postrouting { type nat hook postrouting priority 0 \; }

The first command completes fine, but the second gives me an error:
# nft add chain nat prerouting { type nat hook prerouting priority 0 \; }
<cmdline>:1:1-66: Error: Could not process rule: No such file or directory
add chain nat prerouting { type nat hook prerouting priority 0 ; }
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Also tried this way:
# nft -f /etc/nftables/ipv4-nat 
/etc/nftables/ipv4-nat:3:1-2: Error: Could not process rule: No such file 
or directory
table nat {
^^
/etc/nftables/ipv4-nat:3:1-2: Error: Could not process rule: No such file 
or directory
table nat {
^^

I'm using nftables 0.3 with kernel 3.16.3. Can you help me with it?


[1] 
http://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Address_Translation_%28NAT%29
