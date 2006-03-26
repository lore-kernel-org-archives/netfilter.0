From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: physical interface ? with bridging
Date: Sun, 26 Mar 2006 09:47:59 +0200
Message-ID: <001901c650a9$9bcbaef0$0101000a@sterenborg.info>
References: <57F9959B46E0FA4D8BA88AEDFBE58290167481@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <57F9959B46E0FA4D8BA88AEDFBE58290167481@pxtbenexd01.pxt.primeexalia.com>
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

> Okay, using better search criteria I was able to find an article that
> showed the syntax that seems to work using ipt_physdev.
> 
> iptables -A FORWARD -m physdev --physdev-in eth0 -j LOG
> 
> This will do what I want it to for now.

This also what is in the man page (well, it is in mine) :

   physdev
       This module matches on the bridge port input and output devices
       enslaved to a bridge device. This module  is  a part  of  the
       infrastructure that enables a transparent bridging IP firewall
       and is only useful for kernel ver-sions above version 2.5.44.

       --physdev-in [!] name

You can only use --physdev[-in|...] with "-m physdev", just like you can
only use "--dports" with "-m mulitport" or "--limit" with "-m limit".


Gr,
Rob


