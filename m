From: vikrant@saysnetsoft.com
Subject: Re: Problem in applying "random" patch
Date: Tue, 22 Nov 2005 07:18:55 -0600 (CST)
Message-ID: <42987.61.12.43.109.1132665535.squirrel@saysnetsoft.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

> Hi,
>
> I am trying to apply the "random" patch using patchomatic ng, but I am
> unable to apply it successfully. It refuses to show options for the random
> patch, saying "random does not match your source trees, skipping...". It
> then jumps to "raw" patch.

<snip>

> Thanks
> Vikarnt


I just realised that random only works in 2.4 kernel
"http://svn.netfilter.org/cgi-bin/viewcvs.cgi/trunk/patch-o-matic-ng/patchlets/random/info?rev=4137&view=log"
.  I also saw this from on of /dev/rob0 messages:

> > well so far (I have also a 2.6.x kernel) I've been using the pom
> > and just changing the above in the 'info' file to "> 2.4.0" and it
> > didn't complain about a thing ;) I know that's a dirty way of doing
> > it, but hey, it's working fine for me :)

I will try this, but in the meantime, if anyone on this list has
successfully implemented random on a 2.6 kernel, it would save me a lot of
efforts.

Thanks
Vikrant

