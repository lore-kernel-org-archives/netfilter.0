From: Ben Russo <ben@umialumni.com>
Subject: Re: Firewall Error
Date: 18 Dec 2002 18:32:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1040254325.15157.40.camel@ben.mis.tnsi.com>
References: <000001c29d5b$0c5b9af0$0a00a8c0@WinXp1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c29d5b$0c5b9af0$0a00a8c0@WinXp1>
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
To: Paul & Tisha Sinclair <ptams@earthlink.net>
Cc: netfilter@lists.netfilter.org

On Fri, 2002-12-06 at 14:09, Paul & Tisha Sinclair wrote:
> Hello, 
> 
>  
> 
>        My name is Paul and I have a problem I would like to know if
> you can fix my error. 
> 
> This is error I received when I try to open a port. {An error occured
> when checking your current IPtables configuration : 
> 
> /lib/modules/2.4.18-3smp/kernel/net/ipv4/netfilter/ip_tables.o:
> init_module: Device or resource busy
> 
> /lib/modules/2.4.18-3smp/kernel/net/ipv4/netfilter/ip_tables.o: insmod
> /lib/modules/2.4.18-3smp/kernel/net/ipv4/netfilter/ip_tables.o failed
> 
> /lib/modules/2.4.18-3smp/kernel/net/ipv4/netfilter/ip_tables.o: insmod
> ip_tables failed
> 
> Hint: insmod errors can be caused by incorrect module parameters,
> including invalid IO or IRQ parameters
> 
> iptables v1.2.5: can't initialize iptables table `filter': iptables
> who? (do you need to insmod?)
> 
> Perhaps iptables or your kernel needs to be upgraded.
> 
> This may indicate that your kernel does not support IPtables.}.
> 
>                                                Running 7.2 Redhat
> 
> I would like to open a port but I get this message. Please see if you
> have any suggestion. 
> 

Paul,

You might get more help if you posted to the list in Text format instead
of HTML or RTF or whatever....

With regards to the errors above, I don't understand what you mean when
you say "try to open a port"?  But I have a question that may shed some 
light on the issue...  Did you recompile the kernel with custom config 
options? Or are you using the standard RedHat 7.2 kernel?

If you are using the standard 7.2 kernel I would first suggest that you
update to the latest version of the kernel which I think is
2.4.18-18.7.x

That may fix your problem all by itself.

If you did the rhn_register then all you have to do is run "up2date"
and select the kernels, let it install and then reboot.

-Ben.


