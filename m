From: "Ludovic MARCILLY" <lmarcilly@aressi.fr>
Subject: Iptables and bridging
Date: Wed, 5 Sep 2007 16:00:59 +0000
Message-ID: <DIIE.000009630004543A@aressi.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

i have a linux box with three ethernet card. I want to bridge eth0 with eth2 and to have eth1 like a DMZ.

Before, i was using linux-2.4.27 with iptables-1.2.11 and bridge patch. It was working very weel.

Now, i have updating my kernel to 2.6.21.5 and iptables to version 1.3.7 and it does not work anymore.

In my /var/log/message i can read some :

kernel: physdev match: using --physdev-out in the OUTPUT, FORWARD and POSTROUTING chains for non-bridged traffic is not supported anymore.

What does it means ? I can't do what i want with iptables? I must use ebtables ?

Thanks a lot for your answer.

Ludovic MARCILLY




