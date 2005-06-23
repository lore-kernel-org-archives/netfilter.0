From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: dual/triple adsl router natting problem
Date: Thu, 23 Jun 2005 17:02:36 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0506231656240.25017@yvahk01.tjqt.qr>
References: <42BAAEAF.7060908@tpg.com.au> <200506230808.09808.rob0@gmx.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200506230808.09808.rob0@gmx.co.uk>
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
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org


>> I've tried various routing and filtering cominations
>> as described on different sites around the net and
>
>I've used the patches here: http://www.ssi.bg/~ja/
>and the HOWTO here: http://www.ssi.bg/~ja/nano.txt
>to do multiple gateway routing.

well, a simple approach I once read worked something like (given that you have 
ppp0 and ppp1) to distribute connections (not packets):

`route -n` goes like:

Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
212.185.254.105 0.0.0.0         255.255.255.255 UH    0      0        0 ppp0
212.185.99.88   0.0.0.0         255.255.255.255 UH    0      0        0 ppp1
0.0.0.0         212.185.254.105 0.0.0.0         UG    0      0        0 ppp0
0.0.0.0         212.185.99.88   0.0.0.0         UG    0      0        0 ppp1

  -A PREROUTING -o ppp0 -p tcp -m state --state NEW -m nth --every 2 -j ROUTE
      --oif ppp1
  -A POSTROUTING -j MASQUERADE -o ppp0
  -A POSTROUTING -j MASQUERADE -o ppp1

i.e. that netfilter's nat was intelligent enough to get the idea of the 
ROUTE target.


Jan Engelhardt                                                               
--                                                                            
| Gesellschaft fuer Wissenschaftliche Datenverarbeitung Goettingen,
| Am Fassberg, 37077 Goettingen, www.gwdg.de

