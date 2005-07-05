From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: mangle squid packets
Date: Tue, 5 Jul 2005 13:49:46 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507051347060.28524@yvahk01.tjqt.qr>
References: <42C5A815.8040301@lanhelp.com.br>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42C5A815.8040301@lanhelp.com.br>
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
To: marcus <marcus@lanhelp.com.br>
Cc: netfilter@lists.netfilter.org


>I dont know what mangle rule I need to mark squid transparent packets, I
>have tried all the following (One at a time):

Because Squid practically starts a new connection, you need special help 
from squid itself to mark outgoing packets based on incoming ones.

This is done by TPROXY, a netfilter module from Balabit.com.
Unfortunately, they do not have a version for 2.6.11 and up yet.



Jan Engelhardt                                                               
--                                                                            
| Alphagate Systems, http://alphagate.hopto.org/


