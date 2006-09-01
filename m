From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Slow down windows worms.
Date: Fri, 1 Sep 2006 11:42:50 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0609011142370.21934@yvahk01.tjqt.qr>
References: <44F80038.6010101@gabrix.ath.cx>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44F80038.6010101@gabrix.ath.cx>
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
To: gabrix <gabrix@gabrix.ath.cx>
Cc: netfilter@lists.netfilter.org

>
>I know using POM i can add a TARPIT jump to my firewall.I was wondering
>instead how i can do without the POM.All that TARPIT does is answering 
>with a ACK window size  set to 0.How can i do this without the use of
>POM  just  by iptables ?
>Thanks !

By use of TARPIT. POM is just the archive where you get TARPIT from.


Jan Engelhardt
-- 

