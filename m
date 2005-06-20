From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: iptables leaking blocked ip addresses.
Date: Mon, 20 Jun 2005 20:50:42 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0506202049130.32230@yvahk01.tjqt.qr>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<200506201055.25861.rob0@gmx.co.uk>
	<49bf7d7050620091748a270fc@mail.gmail.com>
	<200506201159.46123.rob0@gmx.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200506201159.46123.rob0@gmx.co.uk>
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


>> http://204.238.34.206/iptables-save-20jun2005.txt
>
>Yikes, this is very long. First, I see that you're doing all your 
>filtering in nat, PREROUTING and POSTROUTING. Why? I prefer to do 
>filtering in the filter table as $DEITY intended. :)

Yeah I would wonder too; esp. because they are in OUTPUT, not in 
PRE/POSTROUTING.
I'd recommend a -P DROP anyway and build up -j ACCEPTs from there.


Jan Engelhardt                                                               
--                                                                            
| Gesellschaft fuer Wissenschaftliche Datenverarbeitung Goettingen,
| Am Fassberg, 37077 Goettingen, www.gwdg.de

