From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Help Regarding iptables
Date: Sun, 20 Jul 2003 10:15:56 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDEMKKNJDLAJDPNDPCDDOEBLNFAA.georgev@citadelcomputer.com.au>
References: <4759.202.125.153.158.1058535304.squirrel@intranet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4759.202.125.153.158.1058535304.squirrel@intranet>
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
To: Zeeshan Pervez <zeeshan.pervez@niit.edu.pk>, netfilter@lists.netfilter.org

You'll probably find NAT doesn't work with vmware but I may be wrong.
Do some logging tests to see if packets generated from the vmware server
does pass through iptables or not.

I remember somewhere something saying netfilter doesn't see those packets,
something like the vmware software is NATing itself or something..

I may be totally wrong so yo have to -j LOG all traffic on your machine and
check if any are from the vmware server.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Zeeshan Pervez
Sent: Friday, July 18, 2003 11:35 PM
To: netfilter@lists.netfilter.org
Subject: Help Regarding iptables
Importance: High


hello there
sir
 i have established a virtual network using vmware.
i want to do packet filtering based on their content . can i achieve this
by iptables. pls help me in detail steps as i amquite new in linux

Regards
Zeeshan Pervez
National University of Sciences and Technology (Pakistan)



