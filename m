From: "=?ISO-8859-1?Q?T=F6r=F6k_Edvin?=" <edwintorok@gmail.com>
Subject: Re: how to execute command on match?
Date: Mon, 20 Feb 2006 14:14:51 +0200
Message-ID: <4354d3270602200414t682eac20vd59724f01004cb4@mail.gmail.com>
References: <859616420602192230i78f13206r@mail.gmail.com>
	<20060220075251.20042.qmail@web37804.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060220075251.20042.qmail@web37804.mail.mud.yahoo.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Mayank <linuxblr_in@yahoo.com>
Cc: netfilter@lists.netfilter.org

On 2/20/06, Mayank <linuxblr_in@yahoo.com> wrote:
> Well, I want to make a blocking call, for example, if
> the netfilter finds a TCP SYN packet, I want to
> execute user defined program and this program will in
> turn do some processing (which may include some
> communication with some other system on lan)
>
> Basically, I am looking for some sort of a target
> match code, "-j exec /usr/bin/myprog" , as soon as
> myprog gets the control I want to do some processing
> and then tell the netfilter whether what to do with
> the packet, which could be allow, drop, reject etc.

You could use libipq, and a QUEUE, or NF_QUEUE target. You start up
your userspace program, and it will receive each packet via libipq
(each packet that reaches the QUEUE rule). You can then do whatever
processing you want, and then set the verdict (allow/deny,...). While
you are processing other packets keep arriving, and get queued, so you
will want to make that processing fast enough, so you don't get the
queue filled up.

You can take a look at fireflier (fireflier.sourceforge.net), to see
how to do userspace packet filtering.
But keep in mind, that the proper place to do this kind of filtering
is inside the kernel. Fireflier itself is going to need a kernel
module (in the future) to do its job, since not everything is
possibble (or efficient) from userspace. I'd suggest writing a kernel
module, and register with netfilter hooks.

Cheers,
Edwin

