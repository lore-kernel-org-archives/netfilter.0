From: Unknown <unknown@unknown.invalid>
Subject: Re: netfilter stops working
Date: Thu, 22 Jan 2004 12:39:53 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <43498.0774451562$1074793349@news.gmane.org>
References: <1074788089.27896.13.camel@webmail.aeropostal.com.ve>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <1074788089.27896.13.camel@webmail.aeropostal.com.ve>
Content-Disposition: inline
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
To: Juan Hernandez <alucard@kanux.com>, Lista de netfilter <netfilter@lists.netfilter.org>

On January 22, 2004 11:14 am, Juan Hernandez wrote:
> Hi there...
>
>
>    I'm running a firewall-router machine in a Red Hat Linux 9 box. I
> have uploaded Red hat's latest kernel 2.4.20-28 I guess. My problem is
> this... This box has been working perfectly for the last 6 months and it
> even had a 6 months uptime with no reboots. Suddendly, the box quit
> working and I started getting this message when I log the packets...
>

<< much snippage for brevity >>

> it will work -but not always, sometimes both interfaces do not ping
> anybody- but it will quit working after an hour or so not allowing any
> other services -like internal ftp or mail fetching- and I'll start
> having those logs again... I have checked all the box for any security
> issues and I haven't found any- I have latest packages due to a red hat
> network subscription-. What's weird is that it worked flawlessly for 6
> months...
>

	Jaun -- you imply here that you've upgraded your kernel code.
	Did you change the NIC drivers from modules to builtin of vice-versa?
	Did you ensure that you've recompiled the iptables code?? <-- Although sometimes 
	it will work after a kernel change, by default if you upgrade the kernel you MUST recompile iptables
	userspace code ...(I suspect that in RH you may have a different RPM package for the newer kernel)
	
	I found that after switching from 2.4.9 to 2.4.18 the network cards loaded in different sequences unless
	I built them as modules and inserted them from a script .. .but thats my experience. (this chanages the 
	interface order/sequence/labelling )

	The packet you are seeing in the log is a DNS packet -- likely a reply to a DNS request, but between your
	firewall script and what you've told us this sounds like it is a result of the interface labels having 
	changed due to the load order of the NIC drivers changing somehow.  Now you are getting stuff coming
	in on what you've defined as out and are sending the reply out that way... 


	Next point ...are these interfaces BOTH somehow connected to a switch/hub out there ???? 
	(see loooong thread early this month that exhibited same symptome and was a result of 
	a cable being where it shouldn't be)




Alistair Tonner

