From: Stephen CS Howe <info@fabsurplus.com>
Subject: Re: error: ip_tables.o init_module:Device or resource busy
Date: Mon, 10 Nov 2003 21:05:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068494712.5220.241.camel@twogiga.tower>
References: <3FAFCFEC.8010700@fabsurplus.com>
	 <1068491048.3652.2.camel@dchws.TQMcube.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1068491048.3652.2.camel@dchws.TQMcube.com>
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
To: "David C. Hart" <dch@TQMcube.com>
Cc: Iptables Mailing List <netfilter@lists.netfilter.org>

Dear David,

Thanks for the advice.
Seeing as I have never manually done a kernel install, I have just taken
the following steps:-
-upgraded to iptables 1.2.8 from tar.gz
-installed kernel 2.4.22-1.2115.nptl using "no-brain" rpm commands.
Those purists amongst the list readers will be happy to note this has
not got me anywhere:-
*******************************************************************
iptables -L
/lib/modules/2.4.22-1.2115.nptl/kernel/net/ipv4/netfilter/ip_tables.o: 
init_module: Device or resource busy
Hint: insmod errors can be caused by incorrect module parameters, 
including invalid IO or IRQ parameters.
      You may find more information in syslog or the output from dmesg
/lib/modules/2.4.22-1.2115.nptl/kernel/net/ipv4/netfilter/ip_tables.o: 
insmod 
/lib/modules/2.4.22-1.2115.nptl/kernel/net/ipv4/netfilter/ip_tables.o
failed
/lib/modules/2.4.22-1.2115.nptl/kernel/net/ipv4/netfilter/ip_tables.o: 
insmod ip_tables failed
iptables v1.2.8: can't initialize iptables table `filter': iptables who?
(do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.
*********************************************************************

At this stage, am I going to have to manually configure the kernel ??
I guess so, but seeing as I do not know what I am doing, I'd appreciate
any input from somebody who knows what they are doing.


steve


On Mon, 2003-11-10 at 20:04, David C. Hart wrote:
> On Mon, 2003-11-10 at 12:50, Steve wrote:
> > I'd like to preface this mail by saying that if a little knowledge is a 
> > dangerous thing, then I am very dangerous....
> > 
> > I have recently installed redhat 9.0 over the top of RH V7.3 and then I 
> > upgraded to iptables 1.2.7a with a 2.4.20-18.9 kernel using apt-get.
> > When I try to do anything with iptables, I get the following error:-
> > 
> Presumably that's a stock RH kernel. For starters, 2.4.22 is completely
> stable and offers a noticeable improvement in throughput. You might want
> to custom compile and install it yourself.
> 
>                                ---------
>             Quality Management - A Commitment to Excellence


