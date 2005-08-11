From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Transparent proxy where source IP address remains unchanged --
 possible?
Date: Thu, 11 Aug 2005 07:42:30 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508110741110.28320@yvahk01.tjqt.qr>
References: <20050809012914.GA23108@bostoncoop.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050809012914.GA23108@bostoncoop.net>
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
To: Adam Rosi-Kessel <adam@rosi-kessel.org>
Cc: netfilter@lists.netfilter.org


>Subject: Transparent proxy where source IP address remains unchanged --
>    possible?

Check Balabit TPROXY. To retain the source address however, you need to patch 
the application that initiates the second part. In your case, the sshd on 
faketarget.

N.B.: Why do you want to poke on _ssh_ anyway?



Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

