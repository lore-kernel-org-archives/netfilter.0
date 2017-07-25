From: "PATEL, SAMEER" <sameer.patel@siemens.com>
Subject: conntrackd exits during failover when there are around 30000
 connections
Date: Tue, 25 Jul 2017 14:32:27 +0000
Message-ID: <733DB87B7669B346B4428487F4A99461230594E8@USMLVA0EM23MSX.ww017.siemens.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,

I'm having some problems with the following configuration:

- Two firewalls in a master-backup configuration managed by keepalived
- A single dedicated link between the two firewalls managed by conntrackd

Now, if I make around 30000 connections between a computer and a server behind the firewall, and the master firewall fails, then conntrackd exits (or perhaps crashes). I don't think this is an out-of-memory issue because conntrackd didn't have the highest OOM score before it failed. Also, I watched memory usage while this was going on and there seemed to be plenty.

Is there some tweak or configuration parameter that enables support for large numbers of connections? Any insights into this issue would be greatly appreciated.

Thanks,

Sameer Patel
Siemens Canada Limited


This message and any attachments are solely for the use of intended recipients. The information contained herein may include trade secrets, protected health or personal information, privileged or otherwise confidential information. Unauthorized review, forwarding, printing, copying, distributing, or using such information is strictly prohibited and may be unlawful. If you are not an intended recipient, you are hereby notified that you received this email in error, and that any review, dissemination, distribution or copying of this email and any attachment is strictly prohibited. If you have received this email in error, please contact the sender and delete the message and any attachment from your system. Thank you for your cooperation
