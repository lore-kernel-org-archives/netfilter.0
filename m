From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: error: ip_tables.o init_module:Device or resource busy
Date: Mon, 10 Nov 2003 18:42:39 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311101842.39637.Alistair@nerdnet.ca>
References: <3FAFCFEC.8010700@fabsurplus.com>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FAFCFEC.8010700@fabsurplus.com>
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
To: Steve <info@fabsurplus.com>, netfilter@lists.netfilter.org

On November 10, 2003 12:50 pm, Steve wrote:
> I'd like to preface this mail by saying that if a little knowledge is a
> dangerous thing, then I am very dangerous....
>
> I have recently installed redhat 9.0 over the top of RH V7.3 and then I
> upgraded to iptables 1.2.7a with a 2.4.20-18.9 kernel using apt-get.
> When I try to do anything with iptables, I get the following error:-
>
> *************************************************************
> e.g. iptables -F
> /lib/modules/2.4.20-18.9/kernel/net/ipv4/netfilter/ip_tables.o:
> init_module: Device or resource busy
> Hint: insmod errors can be caused by incorrect module parameters,
> including invalid IO or IRQ parameters.
>      You may find more information in syslog or the output from dmesg
> /lib/modules/2.4.20-18.9/kernel/net/ipv4/netfilter/ip_tables.o: insmod
> /lib/modules/2.4.20-18.9/kernel/net/ipv4/netfilter/ip_tables.o failed
> /lib/modules/2.4.20-18.9/kernel/net/ipv4/netfilter/ip_tables.o: insmod
> ip_tables failed
> iptables v1.2.7a: can't initialize iptables table `filter': iptables
> who? (do you need to insmod?)
> Perhaps iptables or your kernel needs to be upgraded.
> ******************************************************


	I note that Stephen has fixed the problem, but for the record, this error is 
generated when ipchains is loaded either as a module or in the kernel and one 
attempts to use iptables.




>
> Obviously (?), there is something wrong with either the kernel or
> iptables as I have installed it .
> I need to get iptables working yesterday.
> Can anyone tell me a no-brainer way to achieve this ?
> Does my version of kernel work with this version of iptables ?
> Do I have to go back to an earlier version ?
> Whats the best way to get out of this mess ?
> I remember for my dos days we used to do "format c:" in this kind of
> situation.
>
> Thanks a lot,
>
> Steve
>
> Update: I installed iptables 1.2.8 from tar.gz: same problem.
> Hence, either it's a hardware config. problem (?), or kernel is setup
> wrong. I am now tring to recompile the kernel using v 2.4.22.
> Any help would be much appreciated as I have little idea how to
> recompile a kernel and all I need is iptables working, I'd rather avoid
> all this kernel stuff...

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

