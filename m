From: Ben Russo <ben@umialumni.com>
Subject: RE: can't initialize iptables table `'
Date: 27 Nov 2002 09:54:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1038408857.21066.14.camel@ben.mis.tnsi.com>
References: <6FB083FB72EFD21181D30004AC4CA18A01EABFAB@srv002>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6FB083FB72EFD21181D30004AC4CA18A01EABFAB@srv002>
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
To: Sam Pointer <sam.pointer@hpdsoftware.com>
Cc: netfilter@lists.netfilter.org

OK,  when you say "initialize iptables" do you mean that you are using
the standard RedHat system V init script called
"/etc/rc.d/init.d/iptables" ?
If so what is the content of your /etc/sysconfig/iptables?
That might be the problem there.

When you do an iptables-save what do you see?



It doesn't really feel like a kernel/modules related issue, but you lean
in that direction, so....
when you type "lsmod" what do you see?

On one of my Linux firewalls I see these ipt related modules loaded:

	ipt_state               1152  25 (autoclean)
	ipt_MASQUERADE          1824   5 (autoclean)
	iptable_nat            18452   0 (autoclean) [ipt_MASQUERADE]
	ip_conntrack           17068   2 (autoclean) [ipt_state ipt_MASQUERADE
iptable_nat]
	iptable_mangle          2272   0 (autoclean) (unused)
	iptable_filter          2272   0 (autoclean) (unused)
	ip_tables              11424   7 [ipt_state ipt_MASQUERADE iptable_nat
iptable_mangle iptable_filter]

Maybe try running "depmod -a" and then reruning the "modprobe ip_tables"



On Wed, 2002-11-27 at 06:02, Sam Pointer wrote:
> No I didn't custom compile the kernel and the distro is the latest one from
> the ftp site at RedHat. I've been using Linux since the 1.x kernels.
> although only consider myself an "op" type rather than any great kernel
> hacker.
> 
> Thanks for your help.
> 
> -----Original Message-----
> From: Ben Russo [mailto:ben@umialumni.com]
> Sent: 26 November 2002 22:19
> To: Sam Pointer
> Cc: netfilter@lists.netfilter.org
> Subject: Re: can't initialize iptables table `'
> 
> 
> Did you custom compile your kernel?
> If you are using a standard RedHat 8 kernel have you upgraded to the
> latest?
> 
> On Tue, 2002-11-26 at 12:20, Sam Pointer wrote:
> > Before I carry, please feel free to tell me FAQ off; I have quickly
> scanned
> > the archive and google and haven't found a solution to this problem - but
> > I'm open to suggestions.
> > 
> > I'm initialising iptables on RH Linux 8. When I start iptables I am
> getting
> > the error message " can't initialize iptables table `' ". 
> > 
> > Now, I issued `lsmod` and I have both "iptable_filter" and "ip_tables"
> > modules loaded.
> > 
> > I initially tried starting ipchains with a whole raft of rules, but even
> > starting with the single rule:
> > 
> > -P INPUT DROP
> > 
> > causes this error to appear.
> > 
> > When I reboot the machine and check my syslog messages, I notice that
> > iptables-restore is issuing a modprobe for module `iptable_`, as in:
> > 
> > iptables: Applying iptables firewall rules
> > modprobe: modprobe: Can't locate module iptable_
> > modprobe: modprobe: Can't locate module iptable_
> > ...
> > iptables: can't initialize iptables table `' (do you need to insmod?)
> > 
> > which leads me to believe that some table module it requires isn't loaded.
> > Is this correct, and if so how is this. I'm only using the default
> "filter"
> > table (which is loaded) with my single policy rule...
> > 
> > Any help or pointers to solutions would be greatly appreciated.



