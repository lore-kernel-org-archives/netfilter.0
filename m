From: Scott van Looy <scott@ethosuk.org.uk>
Subject: RE: iptables 1.2.7a and kernel 2.4.19
Date: Tue, 17 Sep 2002 16:56:33 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209171655450.3423-100000@fire.ethosuk.org.uk>
References: <FD8F124A387AD6119F7900A0D218B32101987B@hslex01.hsl-brabantzuid.nl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B32101987B@hslex01.hsl-brabantzuid.nl>
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
To: netfilter@lists.netfilter.org

Today Rob Sterenborg did spake thusly:

> and then built the kernel, rebooted and then tried to install 
> > iptables 
> > 1.2.7a
> > 
> > I get 
> > 
> > make
> > Extensions found: IPv4:ipv4options IPv4:IPV4OPTSSTRIP IPv4:mport 
> > IPv4:NETMAP IPv
> 
> Do a : "make clean" first.
> Then do "make KERNEL_DIR=..." etc..

Gave me exactly the same error. Even did make distclean, this just gave me 
more of the same kind of error, for each module

-- 
Scott van Looy - email:me@ethosuk.org.uk | web:www.ethosuk.org.uk
PGP Fingerprint: 7180 5543 C6C4 747B 7E74  802C 7CF9 E526 44D9 D4A7
      -------------------------------------------
      |/// /// /// /// WIDE LOAD /// /// /// ///|
      -------------------------------------------

We have art that we do not die of the truth.
		-- Nietzsche


