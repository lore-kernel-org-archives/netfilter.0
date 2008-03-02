From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: using ip_defrag in NF_IP_FORWARDING
Date: Sun, 2 Mar 2008 15:10:18 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0803021510060.27717@fbirervta.pbzchgretzou.qr>
References: <908456.17959.qm@web33207.mail.mud.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <908456.17959.qm@web33207.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rigoberto perez <rigo666beast@yahoo.com>
Cc: netfilter <netfilter@vger.kernel.org>


On Feb 29 2008 08:32, rigoberto perez wrote:
>
>I need to re-assemble a packet even if it don't go to
>the local  machine. So, I called to the ip_defrag
>function into the NF_IP_FORWARDING hook  and the
>system crashes. It's that posible or it's a mistake?.
>I wanna know: how I can re-assemble all incomming
>packets?. Thanks.

More like mistake. If you have nf_conntrack loaded,
defrag always(?) happens.
