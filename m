From: Andreas Herz <andi@geekosphere.org>
Subject: Re: Proper ipset userspace version for 3.0.X longterm kernel
Date: Fri, 17 Feb 2012 09:50:30 +0100
Message-ID: <20120217085030.GL23570@workstation>
References: <20120217073510.GJ23570@workstation>
 <alpine.DEB.2.00.1202170914090.32604@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1202170914090.32604@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On 17/02/12 at 09:27, Jozsef Kadlecsik wrote:
> On Fri, 17 Feb 2012, Andreas Herz wrote:
> 
> > i have a linux setup with the longterm kernel 3.0.X and i want to use
> > ipset. What i want to know is, what ipset 6.X version is the proper to
> > use with the 3.0.X kernel?
> > I saw several patches up to 2011-06-05 that are in the kernel. Then i
> > compared the kernelspace code from the kernel from kernel.org with the
> > ipset files from the ipset/netfilter page. I found out that version 6.3
> > has the fewest of all differences.
> 
> The kernel tree is a little behind the ipset development, the most recent 
> 3.x kernel (not 3.0.x) is around ipset 6.9.1.
>  

That's what i thought, the problem is i need to stay with the 3.0.x
LT kernel. But thanks for the info about 3.x and 6.9.1. I need this for
another scenario.

> > To be more precisely, i have 3.0.X ipset kernelspace and i want to know
> > which version i have to download and build to have the proper userspace
> > part. I had ipset 6.9.1 installed, worked fine but for example when i
> > tried to do "ipset create foobar hash:net,iface" the process was dead
> > and not killable. This one is clear, cause hash:net,iface is not part of
> > the kernelspace part in 3.0.X.
> 
> That's a bug in the ipset userspace tool then and I'll look into it: the 
> program should have reported that the type was unsupported by the kernel.

Do you need any more informations for this bug? I used 3.0.16 and the
userspace tool was 6.9.1 from Fedora 17.

> > So is 6.3 the right ipset userspace version? And if yes, then why are
> > there still so many diffs like the "u32 flags" that are missing in 3.0.X
> > in the set files but are integrated in 6.3.
> > 
> > Or do you suggest to avoid the ipset kernelspace part from the 3.0.X
> > kernel and use the ipset for both, kernel- and userspace, from the
> > website?
> 
> I suggest you to use both the kernel and userspace from the ipset package 
> if you want to use the 3.0.x kernel tree.

I guess you're right. I don't insist on the new features but i saw that
there are several bugfixes with each 6.X version that might be useful
for my/our setup.
I used the ipset 4.X the same way.

And thanks for your fast response :)

-- 
Andreas Herz
