From: aksingh@hss.hns.com
Subject: netif_rx
Date: Thu, 3 Jun 2004 21:21:01 +0530
Sender: kernelnewbies-bounce@nl.linux.org
Message-ID: <OF9203F752.5E1A1A50-ON65256EA8.0055D8F6@hss.hns.com>
Mime-Version: 1.0
Return-path: <kernelnewbies-bounce@nl.linux.org>
Errors-to: kernelnewbies-bounce@nl.linux.org
List-help: <mailto:ecartis@nl.linux.org?Subject=help>
List-unsubscribe: <mailto:kernelnewbies-request@nl.linux.org?Subject=unsubscribe>
List-software: Ecartis version 1.0.0
List-Id: <netfilter.vger.kernel.org>
List-subscribe: <mailto:kernelnewbies-request@nl.linux.org?Subject=subscribe>
List-owner: <mailto:riel@nl.linux.org>
List-post: <mailto:kernelnewbies@nl.linux.org>
List-archive: <http://mail.nl.linux.org/kernelnewbies/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org
Cc: kernelnewbies@nl.linux.org





Hi,

 I am trying to spoof a packet, I have written a kernel module, once it
gets a modified TCP packet(source and dest interchanged, ack seq
interchanged) it calls netif_rx (skb) to inject this into the routing path.
but I am unable to make this packet reach the correct socket. Any clues on
this, can I check some kernel stats to know where and why the packet is
being dropped.
The various reasons cld be :

1. incorrect tcp or ip check sums, i calculate both myself
2. in the skb->dev field i set the value to the value of skb->dev field of
any incoming valid packet :
 when i get the first packet on netfilter pre routing hook -- i do a
memcpy(&my_net_dev, skb->dev, sizeof(struct net_device));
 then for the modified TCP packet i set skb->dev=&my_net_dev. So maybe it
gets dropped cos of some problem here(or is there any obvious problem here
?)

so how do i isolate the problem ? any clues ??

thanks
Amit

"DISCLAIMER: This message is proprietary to Hughes Software Systems Limited
(HSS) and is intended solely for the use of the individual to whom it is
addressed. It may contain  privileged or confidential information and
should not be circulated or used for any purpose other than for what it is
intended. If you have received this message in error, please notify the
originator immediately. If you are not the intended recipient, you are
notified that you are strictly prohibited from using, copying, altering, or
disclosing the contents of this message. HSS accepts no responsibility for
loss or damage arising from the use of the information transmitted by this
email including damage from virus."


--
Kernelnewbies: Help each other learn about the Linux kernel.
Archive:       http://mail.nl.linux.org/kernelnewbies/
FAQ:           http://kernelnewbies.org/faq/

