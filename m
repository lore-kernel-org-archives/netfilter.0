From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: port 80 out new ISP
Date: Sun, 21 Aug 2005 11:19:49 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508211117450.2412@yvahk01.tjqt.qr>
References: <430600E4.3090004@eccotours.dyndns.org>
	<200508191205.22196.rob0@gmx.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508191205.22196.rob0@gmx.co.uk>
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


>> $IPT -t nat -A POSTROUTING -o eth2 -s 192.168.111.0/24 -j MASQUERADE
>
>MASQUERADE will not work with dual routing.

Does it really? AFAICS it asks the routing code to "route this for me and tell 
me what interface it would hypothetically go out" and takes the ip of the 
outgoing iface.

Jan Engelhardt
-- 

