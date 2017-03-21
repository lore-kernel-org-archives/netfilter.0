From: Andreas Schultz <aschultz@tpip.net>
Subject: nftables: vmaps and atomic update
Date: Tue, 21 Mar 2017 17:53:48 +0100 (CET)
Message-ID: <748570280.473727.1490115228816.JavaMail.zimbra@tpip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

Delete an item that has a goto from a vmap and the chain
that the goto pointed to in the atomic transaction
is not working on Linux 4.10.

Minimal sample:

init.nft:

    table ip filter {
	map client_to_any {
		type ipv4_addr : verdict
		elements = { 10.180.86.22 : goto CIn_1}
	}

	chain FORWARD {
		type filter hook forward priority 0; policy accept;
		goto client_to_any
	}

	chain client_to_any {
		ip saddr vmap @client_to_any
	}

	chain CIn_1 {
	}
    }

del.nft:

    delete element ip filter client_to_any { 10.180.86.22 : goto CIn_1 }
    delete chain ip filter CIn_1

Attempting to execute del.nft results in:

# nft -f del.nft
del.nft:2:1-29: Error: Could not process rule: Device or resource busy
delete chain ip filter CIn_1
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Is that supposed to be that way?

Andreas
