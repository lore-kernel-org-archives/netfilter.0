From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Routing to and from an IP on an interface
Date: Wed, 14 Mar 2007 17:27:13 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0703141727030.1199@yvahk01.tjqt.qr>
References: <20070312221935.55027.qmail@web50411.mail.re2.yahoo.com>
	<1173760231.45f628e7a40d2@mail.dreamtoy.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1173760231.45f628e7a40d2@mail.dreamtoy.net>
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
To: Nathan <lists@linuxcare.ca>
Cc: netfilter@lists.netfilter.org


On Mar 12 2007 21:30, Nathan wrote:

>Date: Mon, 12 Mar 2007 21:30:31 -0700
>From: Nathan <lists@linuxcare.ca>
>To: netfilter@lists.netfilter.org
>Subject: Routing to and from an IP on an interface
>
>Hi I have an issue where the internal interface wants to always talk from the 
>primary ip address,  what kind of rule can I add to make the traffic comming 
>from a specific source ip leave the router interface from a specific secondary 
>ip address?

iptables -j SNAT ...


Jan
-- 

