From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: iptables leaking blocked ip addresses.
Date: Tue, 21 Jun 2005 20:05:08 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0506212004380.18536@yvahk01.tjqt.qr>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<200506201159.46123.rob0@gmx.co.uk>
	<49bf7d70506201020643ab165@mail.gmail.com>
	<200506201329.19701.rob0@gmx.co.uk>
	<49bf7d7050620123646910d40@mail.gmail.com>
	<Pine.LNX.4.61.0506211455340.9102@yvahk01.tjqt.qr>
	<Pine.LNX.4.58.0506211507280.3687@blackhole.kfki.hu>
	<Pine.LNX.4.61.0506211510210.9102@yvahk01.tjqt.qr>
	<Pine.LNX.4.58.0506211516490.3687@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0506211516490.3687@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org


>NOTRACK is valid in the raw table alone. If you want a generic "NOTRACK
>and TARPIT everything which is not allowed", then that I think won't go.

Would it work to have a -t filter-capable NOTRACK target?



Jan Engelhardt                                                               
--                                                                            
| Gesellschaft fuer Wissenschaftliche Datenverarbeitung Goettingen,
| Am Fassberg, 37077 Goettingen, www.gwdg.de

