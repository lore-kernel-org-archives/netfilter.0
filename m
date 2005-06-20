From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: how to delete a time-based rule ?
Date: Mon, 20 Jun 2005 21:13:04 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0506202112450.20048@yvahk01.tjqt.qr>
References: <6e24d31b050620120372ced983@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6e24d31b050620120372ced983@mail.gmail.com>
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
To: Tenivella Enrico <texilee@gmail.com>
Cc: netfilter@lists.netfilter.org

>Hi all.
>
>My question.. 
>
>through a web interface a client press a button that add an iptables
>prerouting entry.
>Can I set a rule to delete the previous rule when he is idle for a few
>time (10-15 min) or not more connected?

-m expire
(it's in development)


Cheers,
Jan Engelhardt                                                               
--                                                                            
| Gesellschaft fuer Wissenschaftliche Datenverarbeitung Goettingen,
| Am Fassberg, 37077 Goettingen, www.gwdg.de

