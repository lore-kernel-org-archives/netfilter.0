From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: SNAT rule in the POSTROUTING chain ignored?
Date: Thu, 7 Jul 2005 12:49:56 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507071249250.16004@yvahk01.tjqt.qr>
References: <freemail.20050605200044.90491@fm6.freemail.hu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <freemail.20050605200044.90491@fm6.freemail.hu>
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
To: =?ISO-8859-2?Q?Keser=FB_Korn=E9l?= <keseruk@freemail.hu>
Cc: netfilter@lists.netfilter.org

>and in this case the source address is not rewritten. How is it possible?
>I tried to debug the things in /var/log/kern.log and I found, that some 
>debug lines appear when the java application sends something, but 
>nothing appears when the C application sends.
>[...]

You could look at the entry counters (`iptables -L -t nat -v`) and check which 
counters are [not] increasing.



Jan Engelhardt                                                               
--                                                                            


