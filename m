From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Iptables and Kernel
Date: Sun, 18 Apr 2004 13:05:40 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404181305.40319.Alistair@nerdnet.ca>
References: <407A27B2.4000101@rd.arkonnetworks.com> <200404181206.01131.Alistair@nerdnet.ca> <4082AC74.2070601@rd.arkonnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4082AC74.2070601@rd.arkonnetworks.com>
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
To: netfilter@lists.netfilter.org

On April 18, 2004 04:27 pm, Norman Zhang wrote:
> >>I'm trying to compile p-o-m-ng with 2.6.5 now. It asks for iptables
> >>sources. I thought p-o-m-ng patches applies to the kernel only. Do I
> >>need to recompile iptables too? There are many patches in p-o-m-ng. I
> >>only need the h323 patch for Netmeeting to work correctly? The README
> >>from p-o-m-ng recommends the following command to patch the kernel,
> >>
> >># KERNEL_DIR=/usr/src/linux ./runme -pending
> >>
> >>Do I need to worry about rejects and offsets?
> >
> >Yes you need to apply some of the patches in pom-ng against the
> >iptables sources. Not only do we change the kernel code, but we have
> >to make some changes to the iptables tools as well to get some of
> >to work
>
> Thank you so much for your quick response. I've iptables RPM already
> installed with Mandrake. I guess I will need to remove that first before
> compiling the new iptables. I plan to use Shorewall to configure my
> firewall. Will removing iptables RPM break anything? I see iptables is
> included as startup option during boot under Mandrake. After recompiling
> iptables, do I need to reconfigure all those options?

	I'm not a Mandrake user, so I'm no expert, but I would suspect that you might 
	need to check the paths involved in that startup script.  I know that by
	default Slackware installs iptables in /usr/local/ and I by my weird nature
	want it in / ( I want that firewall up and running FIRST dammit)... so .. 
	go get all the required sources, (iptables, pom-ng and if you need it the 
	kernel bits) shutdown that internet connection, remove the RPM of iptables 
	(but keep the file for it handy) and go ahead .... best practice rules apply
	 in all processes like this -- make a backup of some sort FIRST. so you can 
	go back if need be.

	Shorewall is well done, and well supported by others on this list.
	I'm not so sure what options Drake offers for configuration, so ... 

	Alistair Tonner.


>
> >For the record, with both 2.6.3. and 2.6.5 from gentoo with the gaming
> >options, iptables 1.2.9 and pom-ng play nice for most things.
> >
> >If something doesn't apply against plain jane kernel code, there is
> >likely a need to holler at the maintainer of the patch.
>
> Regards,
> Norman

