From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: ppooe state RELATED,ESTABLISHED issue
Date: Fri, 5 Aug 2005 08:36:46 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508050835540.20623@yvahk01.tjqt.qr>
References: <1123201815.23762.17.camel@inyoureyes.linsolutions.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1123201815.23762.17.camel@inyoureyes.linsolutions.com>
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
To: Ted Kaczmarek <tedkaz@optonline.net>
Cc: netfilter@lists.netfilter.org


>Today I was testing a Centos 4.1(RH ES4 clone) with  2.6.9-11.EL and a
>Verizon dsl connection. I couldn't get any connection tracking related
>rules working on the pppoe interface.
>
>-A INPUT -i ppp0 -m state --state RELATED,ESTABLISHED -j ACCEPT
>-A FORWARD -i ppp0 -m state --state RELATED,ESTABLISHED -j ACCEPT

Where's the handling for NEW connections? Otherwise you won't succeed if your 
default policy is !ACCEPT.


>Googling uncovered a thread with respect to connection tracking being
>broken with bridging.

You got a bridge in there?



Jan Engelhardt
-- 

