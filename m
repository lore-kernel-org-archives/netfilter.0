From: Kapetanakis Giannis <bilias@edu.physics.uoc.gr>
Subject: nf_ct_h323: incomplete TPKT (fragmented?)
Date: Tue, 02 Mar 2010 13:20:34 +0200
Message-ID: <4B8CF482.5000808@edu.physics.uoc.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>


Hi,

I've recently enabled nf_conntrack_h323 module on my Fedora 12
kernel: 2.6.31.12-174.2.22.fc12.i686
iptables-1.4.5-1

This machine is a firewall/router for my internal h323 gateway/gatekeeper.

I do receive quite often this message
kernel: nf_ct_h323: incomplete TPKT (fragmented?)

Any ideas on how to solve this or what does it actually means?

regards,

Giannis

