From: Marek Kierdelewicz <marek@piasta.pl>
Subject: new netfilter target - DNETMAP
Date: Fri, 7 Jan 2011 00:02:59 +0100
Message-ID: <20110107000259.775ba310@kuguar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

The DNETMAP target allows dynamic two-way 1:1 mapping of IPv4 subnets.
Single rule can map private subnet to shorter public subnet creating
and maintaining unambigeous private-public ip bindings. Second rule can
be used to map new flows to private subnet according to maintained
bindings. Target allows efficient public IPv4 space usage and
unambigeous NAT at the same time.

DNETMAP is available as patched xtables-addons-1.31 package and as a
patch for xtables-addons-1.31 package.

Manpage & downloads:
http://cat.piasta.pl/dnetmap/

Feedback grately appreciated.

Polite request to Jan Engelhardt for inclusion of the target into
xtables-addons.

Best regards,
Marek Kierdelewicz
