From: "Stuart Lamble" <stu@gateway10.homeip.net>
Subject: RE: Official IMQ support
Date: Thu, 8 Apr 2004 19:58:38 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000601c41d93$1ee998c0$0464a8c0@stu>
References: <1081447150.10056.60.camel@linux.local>
Reply-To: <stu@gateway10.homeip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1081447150.10056.60.camel@linux.local>
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

Sounds good, will check this out.
I really need QoS, have you looked at wondershaper?



-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of peter
frischknecht
Sent: Thursday, April 08, 2004 7:59 PM
To: netfilter@lists.netfilter.org
Subject: Official IMQ support


Is there any chance that we will get IMQ incorporated in future releases
of netfilter/kernel?

The development was picked up again (it was unmaintained).
You can see it here:
www.linuximq.net

They have patches for 2.4 and 2.6 kernels.

IMQ, for those who don't already know, IMQ allows for NATting AND
providing Bandwidth Control up/downstream.  It Creates an Intermediate
Queueing Device that can be used to do the QoS stuff, while the regular
Ethernet adapter can perform the NAT.

I have been using IMQ for a very long time (Network with 500 users), and
I can vouch for its stability.  It keeps me from having 2 daisy-chained
routers on site.

Flames or comments are welcome...C'mon, anybody else out there uses IMQ?

Have a great day,

Peter Frischknecht


---
Incoming mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.654 / Virus Database: 419 - Release Date: 4/6/2004
 

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.654 / Virus Database: 419 - Release Date: 4/6/2004
 


