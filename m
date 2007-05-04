From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Simulating a "bad" connection.
Date: Fri, 4 May 2007 23:11:29 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705042310550.18504@yvahk01.tjqt.qr>
References: <200705042201.21985.tommy@svearike.sytes.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200705042201.21985.tommy@svearike.sytes.net>
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
To: Tommy W <tommy@svearike.sytes.net>
Cc: netfilter@lists.netfilter.org


On May 4 2007 22:01, Tommy W wrote:

>Hi,
>I was just wondering if someone knows of a good way to simulate a "bad" 
>network?.
>I want high latency AND/OR high packet loss.
>
>I was thinking along the lines  
>iptables -I INPUT -m random --average 90 -j DROP
>
>but then I get libipt_random.so doesn't exist.

  -m statistic --mode random

It might not exist yet either.

>I see that it is not included, how do you get it ?
>
>kernel: 2.6.16-rc5
>iptables: 1.3.4
>
>or is there some other more simple solution?
>
>Thanks in advance
>/Tommy
>

Jan
-- 

