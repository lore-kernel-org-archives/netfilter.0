From: "Zeeshan Pervez" <zeeshan.pervez@niit.edu.pk>
Subject: RE: Help Regarding iptables
Date: Mon, 21 Jul 2003 11:55:57 +0600 (PKST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4717.10.10.4.65.1058766957.squirrel@intranet>
References: <4759.202.125.153.158.1058535304.squirrel@intranet> 
     <FDEMKKNJDLAJDPNDPCDDOEBLNFAA.georgev@citadelcomputer.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDEMKKNJDLAJDPNDPCDDOEBLNFAA.georgev@citadelcomputer.com.au>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

i am haviing problem with iptables -m -tring option. can anyone tell me
how it will work
Regards
Zeeshan Pervez


> You'll probably find NAT doesn't work with vmware but I may be wrong.
> Do some logging tests to see if packets generated from the vmware server
> does pass through iptables or not.
>
> I remember somewhere something saying netfilter doesn't see those packets,
> something like the vmware software is NATing itself or something..
>
> I may be totally wrong so yo have to -j LOG all traffic on your machine
> and
> check if any are from the vmware server.
>
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Zeeshan Pervez
> Sent: Friday, July 18, 2003 11:35 PM
> To: netfilter@lists.netfilter.org
> Subject: Help Regarding iptables
> Importance: High
>
>
> hello there
> sir
>  i have established a virtual network using vmware.
> i want to do packet filtering based on their content . can i achieve this
> by iptables. pls help me in detail steps as i amquite new in linux
>
> Regards
> Zeeshan Pervez
> National University of Sciences and Technology (Pakistan)
>
>


