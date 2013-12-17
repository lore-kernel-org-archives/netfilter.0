From: Thomas Glanzmann <thomas@glanzmann.de>
Subject: DNAT: IPv4 to IPv6
Date: Tue, 17 Dec 2013 17:24:09 +0100
Message-ID: <20131217162409.GA17039@glanzmann.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,
I would like to DNAT IPv4 to IPv6. Is this currently possible maybe with
nftables?

I'm looking for something similiar to:

iptables -t nat -A PREROUTING -p tcp --dport 4001 -d 1.2.3.4 -j DNAT --to '[fd00::fffa:1]:22'

Currently I use socat as workaround but would love to do that in the kernel.

Cheers,
        Thomas
