From: Michal Soltys <soltys@ziu.info>
Subject: ipt postrouting nat / ebt postrouting nat - question about order
 when bridge-nf is enabled
Date: Wed, 18 Jun 2008 16:49:37 +0200
Message-ID: <48592081.5000008@ziu.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello

After finding this pretty recent and nice summary of packet flow:

http://jengelh.medozas.de/images/nf-packet-flow.png (1)

I noticed that in case of locally generated packets (routed through 
bridge's port), ebtables nat postrouting is evaluated _after_ iptables 
nat postrouting, which is different from official explanation at

http://ebtables.sourceforge.net/br_fw_ia/br_fw_ia.html
and further in
http://ebtables.sourceforge.net/br_fw_ia/PacketFlow.png (2)

Precisely - figures 6a and 6d (but 3c is actually like in (1) ).

After doing some tests with simple bridge, ipt/ebt and plenty of logging 
rules, it turned out, that the former (1) image is actually right. The 
official guide is back from 2003, so maybe something has changed along 
the years.

My question - does current behaviour (as in (1)) is inteneded, or is it 
perhaps a bug, and diagram (2) should be right ?

