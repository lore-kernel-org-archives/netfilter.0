From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: stop accepting new connections on port 80
Date: Tue, 3 Jan 2006 08:12:42 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0601030811560.23554@yvahk01.tjqt.qr>
References: <20051207123420.V66917@uberwoo.hedgpeth.com>
	<2486.192.168.3.8.1134153732.squirrel@192.168.3.8>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2486.192.168.3.8.1134153732.squirrel@192.168.3.8>
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
To: Bill Hance <bill@billhance.com>
Cc: netfilter@lists.netfilter.org, Spam User <spam@the-force.net>

>what about entering a new rule, immediately before the one saying
>
>-dport 80 -m state --state NEW -j ACCEPT
>
>the new one would be
>
>-dport 80 -m state --state NEW -j DROP

-j REJECT is preferred here, otherwise users wait almost forever.
I have used it in the past and works fine (i.e. lets established ones go 
on)


Jan Engelhardt
-- 

