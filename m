From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: nfs ports
Date: Fri, 28 Jan 2005 14:22:29 -0500
Message-ID: <200501281422.29351.JALaramie@Loudoun-Fairfax.com>
References: <200501281250.55466.JALaramie@Loudoun-Fairfax.com>
	<20050128184927.GA15097@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050128184927.GA15097@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org


> IIRC statd, mountd, lockd, and rquotad are assigned their ports by the
> the portmapper when a request comes in; however, each daemon supports a
> "-p" option to nail it down to a single port--see the man page of each
> for specific syntax.  lockd is actually a kernel module that's loaded
> on demand, and you would need to pass the static TCP/UDP port to the
> modprobe command as an option (i.e. in modprobe.conf).
>
> check out:
>
> http://www.faqs.org/docs/Linux-HOWTO/NFS-HOWTO.html#FIREWALLS
>
> for more specific details.

This looks promising. Thanks Jason.

Jeff

