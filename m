From: Juan Hernandez <alucard@kanux.com>
Subject: Re: netfilter stops working
Date: 22 Jan 2004 14:30:43 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1074796242.27896.32.camel@webmail.aeropostal.com.ve>
References: <1074788089.27896.13.camel@webmail.aeropostal.com.ve>
	 <200401221239.53241.Alistair Tonner <>>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401221239.53241.Alistair Tonner <>>
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
To: Lista de netfilter <netfilter@lists.netfilter.org>

On Thu, 2004-01-22 at 13:39, Alistair Tonner sender wrote:

> 	Jaun -- you imply here that you've upgraded your kernel code.
> 	Did you change the NIC drivers from modules to builtin of vice-versa?
> 	Did you ensure that you've recompiled the iptables code?? <-- Although sometimes 
> 	it will work after a kernel change, by default if you upgrade the kernel you MUST recompile iptables
> 	userspace code ...(I suspect that in RH you may have a different RPM package for the newer kernel)


I upgraded the kernel after this problem started and makes no
difference. I have recompiled everything and yes, it's a whole new
package

> 	
> 	I found that after switching from 2.4.9 to 2.4.18 the network cards loaded in different sequences unless
> 	I built them as modules and inserted them from a script .. .but thats my experience. (this chanages the 
> 	interface order/sequence/labelling )
> 
> 	The packet you are seeing in the log is a DNS packet -- likely a reply to a DNS request, but between your
> 	firewall script and what you've told us this sounds like it is a result of the interface labels having 
> 	changed due to the load order of the NIC drivers changing somehow.  Now you are getting stuff coming
> 	in on what you've defined as out and are sending the reply out that way... 
> 

Yes, it's a DNS packets, it's just one of the many packets that goes
thru both interfaces and the one I chose to copy from the log... but all
kinds of packages are shown. The problem I think is that somehow
netfilter after sometime working, confuses input and output NICs in the
same... as the logs show. And about the modules, have you seen in my
script any modules that I should or should not load? any suggestions?

> 
> 	Next point ...are these interfaces BOTH somehow connected to a switch/hub out there ???? 
> 	(see loooong thread early this month that exhibited same symptome and was a result of 
> 	a cable being where it shouldn't be)
> 

Hehehehe... eth1 has a DSL connection and eth0 shares the connection to
the users and have some other services for the LAN. I switch both cards
with a completely different ones and the kernel loads the new drivers
perfectly... I configure them and after sometime -about an hour- I start
getting that log and everything stops working... with both kernels.


Thanks a lot for your time... I appreciate it

Juan


