From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Transparent proxy where source IP address remains unchanged --
 possible?
Date: Thu, 11 Aug 2005 21:17:49 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508112117380.23117@yvahk01.tjqt.qr>
References: <20050809012914.GA23108@bostoncoop.net>
	<Pine.LNX.4.61.0508110741110.28320@yvahk01.tjqt.qr>
	<20050811130700.GA15463@bostoncoop.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050811130700.GA15463@bostoncoop.net>
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


>Why do I need to patch sshd on faketarget? What I'm trying to do is just
>send all the packets to realtarget, essentially untouched (other than the
>destination IP).  I don't understand why sshd on faketarget would even be
>involved...?

Then just use DNAT.



Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

