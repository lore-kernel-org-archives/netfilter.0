From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: dnatting
Date: Mon, 11 Jul 2005 20:54:48 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507112053001.23487@yvahk01.tjqt.qr>
References: <20050711151830.GA26670@tranquility.scriptkitchen.com>
	<20050711184520.GA17202@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050711184520.GA17202@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

>4)  client; 192.168.10.100, receives SYN/ACK from 192.168.10.10 and
>    discards it, as it matches no connection in the SYN_SENT state
>    (recall that our SYN was sent to 1.2.3.4).

Now I get the point of problem. Well, there was *once* implicit SNAT in 
netfilter (at least in conjunction with IP_NF_NAT_LOCAL)

>that the why.  the proper way to avoid this is to have people on the
>inside connect to 192.168.10.10.


