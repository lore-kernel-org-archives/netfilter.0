From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Debian Error?
Date: Fri, 25 Oct 2002 13:36:07 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210251330380.1308-100000@dns.toxicfilms.tv>
References: <004601c27c08$4186c890$0200000a@parseerror.dk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004601c27c08$4186c890$0200000a@parseerror.dk>
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
To: =?iso-8859-1?Q?Matias_Bj=F8rling?= <mb@ncparty.dk>
Cc: netfilter@lists.netfilter.org

Hi

> What module do i need to modconf for the -m string --string option will
> work, so i can drop specific packets on their data.
I'm a debian user, but i do not know what modconf is. I never rely on
magical software from distros and their packages, simply try the
patch-o-matic on your kernel sources, and then make the string match as a
module, install it, and use it with iptables.

> and why are my traffic control utility so noncompatible, it don't even
> have tbf fair quering, i don't understand it. It all worked well under
> Mandrake?
Again, i don't use magical kernel packages. Maybe tbf in debian is not
compiled in.

I recommend you downloaded the kernel, configure it (including TBF +
whatever you need in QoS section) then, after saving the changes, patching
it with netfilter patch-o-matic to get the patches applied to the kernel.
and then make it.

I always rely on compiling the stuff myself from the sources, and it
works.

Regards,
Maciej Soltysiak



