From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Crazy portmap request
Date: Tue, 5 Jul 2005 15:01:35 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507051457270.24326@yvahk01.tjqt.qr>
References: <BEED74CD.38AE%gary@primeexalia.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BEED74CD.38AE%gary@primeexalia.com>
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
To: "Gary W. Smith" <gary@primeexalia.com>
Cc: netfilter@lists.netfilter.org


>Basically, I'm at home right now and I should be able to walk 200 different
>ports on the one static IP address and be able to access each of the 200
>different machines at the remote office.  This is a simplified example.

So you've got a "frontend" node with a ton of DNAT entries. Fine.

>It works with the rules individually, but it ends up being about 800 rules
>in the file.  I was just hoping to trim it down a little.

You could possible write yourself an enhanced DNAT that operates the way you 
want, i.e.

  dstaddr = 123.45.67.89
  dstport = 8000-9000

DNAT to:

  dstaddr = 10.0.0.[s-port]
  dstport = 7000



Jan Engelhardt                                                               
--                                                                            
| Alphagate Systems, http://alphagate.hopto.org/


