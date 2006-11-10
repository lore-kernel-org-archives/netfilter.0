From: Pollywog <linux@shadypond.com>
Subject: Re: Small doubt from a newbie :)
Date: Fri, 10 Nov 2006 18:09:45 +0000
Message-ID: <200611101809.45803.linux@shadypond.com>
References: <45504519.3070907@gmail.com>
	<BAY103-DAV23E7F7CB054F62AA05D7BB2F00@phx.gbl>
	<45543A8E.7070606@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45543A8E.7070606@gmail.com>
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
To: netfilter@lists.netfilter.org

On Friday 10 November 2006 08:38, utteerna wrote:
> Here's steps i followed and error details. Please let me know if i
> missed something

Are you running Debian or a Debian derivative?

>
> 1)Downloaded linux-2.6.18.2 and put it in /usr/src dir and untarred it
> 2)Downloaded iptables-1.3.6 and put it in /usr/src dir and untarred it
> 3)Downloaded patch-o-matic-ng-20061108.tar and put it in /usr/src dir
> and untarred it

Since you are installing patch-o-matic, I assume you are going to compile 
ipsets... is that why you need patch-o-matic?  I just did this recently 
because I use ipsets with Shorewall.

I am also not sure why you did not install the iptables package that comes 
with your distribution, unless it is because you need a newer version for 
ipsets.

I would configure the kernel first, and least through the 'make config' part 
even if you don't compile it.  If you do that and then apply the patches, all 
you need to do is run 'make oldconfig' if you are running Linux.  Then you 
know that you will need to say "Y" to the new options.

After you have patched the kernel and added the new options as I mentioned 
above, you can compile the kernel.  Also, if you are running Debian or a 
derivative of Debian, I can explain how to compile a kernel the Debian way.

I have not had to do it "the old way" in a long time.

8)

