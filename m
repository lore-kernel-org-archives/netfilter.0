From: Jeff Kletsky <netfilter@allycomm.com>
Subject: Hints needed to find causes of non-specific error messages
Date: Wed, 23 Aug 2017 12:23:17 -0700
Message-ID: <0628e05b-00cb-0135-3ffc-c44dcb4634b3@wagsky.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Having now split out all my NAT-related statements into an "ip" table 
and shortened all myidentifiers to 16 characters or less, I'm stuck with 
poorly descriptive error messages that only refer to the first line of 
the nft file being read.

The rule set is very skeletal, as I'm still trying to just get the 
chains and sets I need to exist. Most chains are empty, or consist of 
only a "continue" verdict. The vmap-driven dispatch (jump) statements 
have been commented out. "flush ruleset" is the first statement in the 
file read by nft. Commenting out that line just moves the pointer of the 
error message to the next "command" line in the file. nft is being 
executed with root privilege, and I get the same results with nft -c

I had previously found the "Error: Could not process rule: No such file 
or directory" message related to identifiers that are too long.

Previous testing suggested that while set names are called out in the 
wiki as limited to 16 characters, chain names would not cause this kind 
of error at 32 characters or less. There is nothing about the 
identifier-length limit for tables, chains, or variables that I could 
find in the wiki or the current, on-line man page for nft. The nft man 
page describes a valid identifier matches [a-zA-Z][a-zA-Z0-9/\_.]* and 
that quotes are required if it would conflict with an keyword, but 
nothing on length limits.


* What are the limits on identifiers for tables, chains, and variables?


* I'm now looking for suggestions as to what to look at to find the 
source of the following errors:


nftables.conf:3:1-14: Error: Could not process rule: Device or resource busy
flush ruleset
^^^^^^^^^^^^^^
nftables.conf:3:1-14: Error: Could not process rule: No such file or 
directory
flush ruleset
^^^^^^^^^^^^^^
nftables.conf:3:1-14: Error: Could not process rule: Operation not supported
flush ruleset
^^^^^^^^^^^^^^

(As previously noted, "flush ruleset" moves to the next non-comment, 
non-empty line in the file if commented out)


Thanks!

Jeff



