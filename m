From: "Leonardo Marques" <surf3r0@gmail.com>
Subject: Bridge speed doubts
Date: Fri, 18 Aug 2006 14:24:37 +0000
Message-ID: <eb5ae9cc0608180724gfc3d18cndde7a1d88d298d8d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lista IPTABLES <netfilter@lists.netfilter.org>

Hey guys,

I have a bridge with 4 ethernet cards, 3 are 10/100 mb/s and 1 is 10
mb/s . I having a low speed at bridge, all bridge ports are working at
10 mb/s i think that is occurring because I have one 10mb/s interface
on the array.

All the 10/100 cards are connected with others 10/100 connections, and
the 10 card are connected with another 10 card. So, i want between de
10/100 cards a traffic speed in a 100 mb/s speed and between 10 cards
or 10/100 - 10 a 10 mb/s traffic speed.

Anyone know if is possible do it and how to do it?

Im using the packet bridge-utils.

Thanks for attention.

-- 
------------------------------
 Leonardo Marques
   www.analyx.org
------------------------------

