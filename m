From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: ppooe state RELATED,ESTABLISHED issue
Date: Fri, 05 Aug 2005 00:55:17 -0500
Message-ID: <42F2FF45.8070700@riverviewtech.net>
References: <1123201815.23762.17.camel@inyoureyes.linsolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: tedkaz@optonline.net
Cc: netfilter@lists.netfilter.org

Just a stab in the dark.

I don't know if this is the issue or not but something that comes to 
mind is what did you set your INPUT / FORWARD / OUTPUT chains default 
policy to?  If you set it to DENY then you will have to explicitly allow 
traffic that is coming in and out the respective interfaces to set up 
the PPPoE connection / tunnel.  I don't know enough about this (PPPoE) 
to help.

Ted Kaczmarek wrote:

>Today I was testing a Centos 4.1(RH ES4 clone) with  2.6.9-11.EL and a
>Verizon dsl connection. I couldn't get any connection tracking related
>rules working on the pppoe interface.
>
>-A INPUT -i ppp0 -m state --state RELATED,ESTABLISHED -j ACCEPT
>-A FORWARD -i ppp0 -m state --state RELATED,ESTABLISHED -j ACCEPT
>
>The only way I could get it to forward traffic 
>was to allow all INPUT and FORWARD traffic for ppp0.
>
>The pppoe is using eth0 and the inside interface is eth1.
>
>Googling uncovered a thread with respect to connection tracking being
>broken 
>with bridging.
>
>http://www.uwsg.iu.edu/hypermail/linux/kernel/0506.2/0422.html
>
>Is this really the same issue? If packets are coming in eth1 and leaving
>ppp0(using eth0)
>are they not just being routed? If eth0 is up the I can see packets
>being bridged from ppp0e to eth0, but with eth0 down I am at a loss as
>to why this is happening.
>
>Also is this issue specific to 2.6? A 2.4 based machine would likely
>suffice in this application.
>
>
>Regards,
>Ted
>

