From: Giorgio <giorgio.nicole@arcor.de>
Subject: nft rule to redirect multiple ports using maps
Date: Thu, 8 Oct 2015 22:12:30 +0200
Message-ID: <5616CE2E.1070200@arcor.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arcor.de; s=mail-in;
	t=1444335151; bh=81TPWBgMSaf8ZXEzx3Bdl+Pqirga6utMJkPCDLqHgog=;
	h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=j81AoWUXfYfQazZG5rjhSk9w/XQhhm7QGFuTmMajqRmz5wuZeGg1JP+pn1c1ibBYk
	 GaYGEBP7NdbjIyROrYK4oSFRbMNMJN9tU9FJAUfqKk5QBjIDZnGhYxyF+KnwyYjfuI
	 P0Ei6n5OpSIu6HS403tvRwpxJagK4QneDev2cC6s=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

in the answer at:

marc.info/?l=netfilter&m=144286539313019&w=2

there is a cool example of how to use nft maps to write a rule
that defines multiple dnats:

nft add rule nat prerouting dnat \
      tcp dport map { 1000 : 1.1.1.1, 2000 : 1.1.1.1 } : \
      tcp dport map { 1000 : 1234, 1001 : 2222 }


Now I would like to do something similar with port redirections
to generalize rules like:

nft add rule nat prerouting tcp dport 22 redirect to 2222

found on the nftable wiki:

http://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Address_Translation_%28NAT%29

Here is my (faulty) command line:

# nft add rule nat prerouting redirect to tcp dport map { 22 : 2222, 23
: 2323 }
<cmdline>:1:37-74: Error: transport protocol mapping is only valid after
transport protocol match
add rule nat prerouting redirect to tcp dport map { 22 : 2222, 23 : 2323 }

I want to redirect a list of dports (22 and 23) to a correspondent list
of new dports (2222 and 2323).

I know that there is a way to do it but can't get the logic behind the
syntax of this.

giorgio
