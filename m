From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Where has NAT gone?
Date: Tue, 17 Apr 2007 11:02:46 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0704171038470.8056@yvahk01.tjqt.qr>
References: <20070417081253.A6BF9DBAB7@mail5.inspire.net.nz>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070417081253.A6BF9DBAB7@mail5.inspire.net.nz>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: richard@net-solutions.net.nz
Cc: netfilter@lists.netfilter.org


On Apr 17 2007 08:12, richard@net-solutions.net.nz wrote:
>Hi all
>This is hopefully a quick question. Today I upgraded my system from Linux
>Kernel 2.6.16.20 to 2.6.20.7 because I needed an updated NIC driver. Upon
>running make menuconfig, I noticed that the options for NAT seem to have
>vanished from the config menu. 

Many CONFIG_IP_NF changed to CONFIG_NF; from the old
"Layer3-dependent" to "layer3-independent". Check it out using menuconfig.


Jan
-- 

