From: "Curby ." <kirbysdl@hotmail.com>
Subject: Re: ip aliasing considered harmful?
Date: Mon, 10 Jan 2005 18:51:25 +0000
Message-ID: <BAY101-F3E491799BCD5242A2D14DDF970@phx.gbl>
References: <1105364334.12623.5.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1105364334.12623.5.camel@hubcap.ljm.dom>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: opie@817west.com, netfilter@lists.netfilter.org

>that's why 'ip addr add w.x.y.z dev eth0' is preferable--it doesn't
>delude you into thinking you have multiple interfaces, because you
>don't.  try and add a rule for eth0:0 and let us know how it goes.

Other scripts that try to handle aliases match on both interface and IP; as 
you hinted, there's no way to handle aliases directly.

What's the standard way to store these settings so they take effect upon 
boot?  Since /etc/init.d usually only contains scripts and not custom 
configurations, i guess /etc/sysconfig/network-scripts/ifup.d would be the 
one way of doing it.

Would something as simple as

>#!/bin/sh
>
>ip addr add 1.2.3.4 dev eth0

placed into that ifup.d directory work, or is there a better way of doing 
it?  (Sorry for getting a little off topic here.)  Thanks!

--Curby



