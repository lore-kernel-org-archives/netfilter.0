From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: SO HOW! iptables: invalid argument
Date: Sat, 25 Oct 2003 09:55:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310250955.11841.Alistair@nerdnet.ca>
References: <7C9884991ADAE0479C14F10C858BCDF52E375B@alderaan.smgtec.com> <20031023134537.21954912.arnt@c2i.net> <01e801c39afd$8da3c6f0$63000a0a@pooh>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <01e801c39afd$8da3c6f0$63000a0a@pooh>
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
To: John Paul <john@pinoylinux.sytes.net>, netfilter@lists.netfilter.org

On October 25, 2003 09:40 am, John Paul wrote:
> Hello Folks,
>
> Just want to find the real answer with this. sorry but ans to google is not
> clear for me. I did upgrade my iptables to iptables-1.2.9rc1.tar. steps
> done;
>
> --> installed new iptables source (iptables-1.2.9rc1.tar)
>         - make KERNEL_DIR=/usr/local/linux
>         - make install KERNEL_DIR=/usr/local/linux
>
> --> applied POM (patch-o-matic-20030912.tar) to my latest kernel
> (linux-2.4.22.tar)
>
> --> recompile the kernel
>         - make dep; make clean; make bzImage; make modules; make
> modules_install
>         - all went fine
>
> --> reboot the machine
>
> all went fine but when NAT/MASQUERADE is used, i got this "iptables:
> invalid argument"
>
> anything i missed?
>
> Thanks.
> -JP


	Ummm.
	
	   I would personally apply POM before building iptables code....
	
	if you do find  / -name iptables ... how many results do you get?
	
	I've found followup installs don't tend to sit on top of original installs, 
thus you likely have two copies of iptables stuff on your system now... you 
need todetermine which to remove.


-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

