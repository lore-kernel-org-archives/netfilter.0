From: peter frischknecht <peter@empoweringsolutions.com>
Subject: Official IMQ support
Date: Thu, 08 Apr 2004 13:59:12 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1081447150.10056.60.camel@linux.local>
References: <20040408162803.3624.39959.Mailman@vishnu.netfilter.org>
Reply-To: peter@empoweringsolutions.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040408162803.3624.39959.Mailman@vishnu.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Is there any chance that we will get IMQ incorporated in future releases of netfilter/kernel?

The development was picked up again (it was unmaintained).
You can see it here:
www.linuximq.net

They have patches for 2.4 and 2.6 kernels.

IMQ, for those who don't already know, IMQ allows for NATting AND providing Bandwidth Control up/downstream.  It Creates an Intermediate Queueing Device that can be used to do the QoS stuff, while the regular Ethernet adapter can perform the NAT.

I have been using IMQ for a very long time (Network with 500 users), and I can vouch for its stability.  It keeps me from having 2 daisy-chained routers on site.

Flames or comments are welcome...C'mon, anybody else out there uses IMQ?

Have a great day,

Peter Frischknecht

