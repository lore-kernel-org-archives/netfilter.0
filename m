From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: iptables leaking blocked ip addresses.
Date: Tue, 21 Jun 2005 14:57:31 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0506211455340.9102@yvahk01.tjqt.qr>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<200506201159.46123.rob0@gmx.co.uk>
	<49bf7d70506201020643ab165@mail.gmail.com>
	<200506201329.19701.rob0@gmx.co.uk>
	<49bf7d7050620123646910d40@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <49bf7d7050620123646910d40@mail.gmail.com>
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
To: "terry l. ridder" <artisticforge@gmail.com>
Cc: netfilter@lists.netfilter.org, /dev/rob0 <rob0@gmx.co.uk>


>> > using tarpit instead of just dropping the connections.
>> Whatever. Without connection tracking you might as well use ipchains.
>the tarpit howto does say to turn connection tracking off.

No, it does not! To quote:

  You probably don't want the conntrack module loaded while you are using
  TARPIT, or you will be using resources per connection.

Which is not the same as "does not work with conntrack".



Jan Engelhardt                                                               
--                                                                            
| Gesellschaft fuer Wissenschaftliche Datenverarbeitung Goettingen,
| Am Fassberg, 37077 Goettingen, www.gwdg.de

