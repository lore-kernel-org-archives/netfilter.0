From: Leonid Veytser <veytser@cs.bu.edu>
Subject: Re: Forwarding traffic destined to local machine
Date: Sat, 8 Nov 2003 15:25:59 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.SOL.4.20.0311081517280.3735-100000@csa.bu.edu>
References: <200311081726.hA8HQCj15653@agate.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311081726.hA8HQCj15653@agate.rockstone.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@soft-solutions.co.uk>
Cc: netfilter@lists.netfilter.org

  I have a kernel module that registers to listen on netfilter
hooks. I also have a user level program that uses libipq to
receive packets that were received by the module.
   Now, the user application registers to listen to all packets coming in
on NF_IP_PRE_ROUTING hook. If, the packet is destined to the local
machine, I change the destination at iph->daddr to another destination and
I recalculate the checksum.

  By this, the packet should show up at the NF_IP_FORWARD hook, but it
doesn't. It just gets dropped somewere beforehand.

What am I doing wrong?


On Sat, 8 Nov 2003, Antony Stone wrote:

> On Saturday 08 November 2003 5:08 pm, Leonid Veytser wrote:
> 
> > How can I forward traffic(to some different machine) that is destined to
> > the local machine using netfilter?
> >
> > Changing destination address at the prerouting hook doesn't seem to work.
> 
> Tell us what you did and how you know it didn't work and we may be able to 
> help.
> 
> Antony
> 
> -- 
> 
> G- GIT/E d- s+:--(-) a+ C++++$ UL++++$ P+(---)>++ L+++(++++)$ !E W(-) N(-) o? 
> w-- O !M V+++(--) !PS !PE Y+ PGP+> t- tv@ b+++ DI++ D--- e++>+++ h++ r@? 5? 
> !X- !R K--?
>                                                      Please reply to the list;
>                                                            please don't CC me.
> 
> 


