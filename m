From: "R. Sterenborg" <rsterenborg@xs4all.nl>
Subject: Re: PPTP through masquerading gateway
Date: Tue, 9 Jul 2002 08:17:07 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <002601c22710$40e49f40$0401000a@win2k>
References: <000401c226d9$5cc37fb0$6b01a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

----- Original Message -----
From: "Rowan Reid" <rreid@studio3arc.com>
Subject: RE: PPTP through masquerading gateway

> I'm using 2.4.18 I know not designed for the patch, My FS only
> Works with 2.4.18. Someone told me the 2.4.17rev2 Patch works
> With 2.4.18 it doesn't unless you use
>
> patch -p1 < netfilter-pptp-2.4.17-rev2.patch
>
Uhm. well, I don't use ReiserFS, I use ext3.
I can't help you with that.
A patch that's working voor 2.4.17 could also be working for 2.4.18, but I
don't know.
At work I have a test setup and I'll try it there.

> Correct me if I'm wrong doesn't the INSTALL file say you
> Need a 2.4.4 kernel in order for it to work.
>
No, it says :
PROBLEMS YOU MAY ENCOUNTER:

1) This package requires a 2.4.4 kernel, *or above*.

> > cd /usr/src/iptables-1.2.6a
> > make KERNEL_DIR=/usr/src/linux
> > make install KERNEL_DIR=/usr/src/linux
>
> Interesting you did this after compiling the kernel.
>
Hmm, I've thought about doing it before compiling the kernel, but the
iptables compilation process might be using things from the kernel (you have
to mention a KERNEL_DIR yourself or use the default one in Makefile).
Mind you again ; I'm not a C programmer so I can't read all that and that
means I might have it all wrong.
Anyway, I thought it couldn't hurt to compile the kernel first ; it's
patched already so that shouldn't be the problem.
And I have a working setup :o)

> bles-tutorial.
>
Heheh, yeah. Wasn't sure myself so I looked it up before posting ;o]

> I used the same commands to test it. I will try the order you used.
> Thanks for taking the time though.
> What I'm trying most desperatly not to do is have to revert back to ext2
> and a 2.4.17 kernel.
>
I'll try kernel 2.4.18 for you and let you know if it works for me.
Besides, if 2.4.18 failes, maybe you could switch to ext3 which is also
journalling ? (I don't know the cons and pros between the 2 so I'm not going
to talk about that. Just wanted to mention it.)

Good luck !

Rob


