From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: iptables 1.2.7a and kernel 2.4.19
Date: 17 Sep 2002 19:47:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1032284823.30153.19.camel@tux>
References: <Pine.LNX.4.44.0209171400480.3423-100000@fire.ethosuk.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0209171400480.3423-100000@fire.ethosuk.org.uk>
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
To: Scott van Looy <scott@ethosuk.org.uk>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Tue, 2002-09-17 at 15:03, Scott van Looy wrote:

> Yet when I did this this morning on a different machine it worked fine, 
> same pom, same kernel, same iptables builds
> 
> Any ideas where I could start to look to see what's wrong?

You can start by getting a newer patch-o-matic.

ftp://ftp.netfilter.org/pub/patch-o-matic/snapshot/

This problem was fixed in cvs 020826 :)

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat
you with experience.

