From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Newbie - Where is my kernel? Can't run POM
Date: Wed, 8 Jan 2003 23:56:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030108235615.3f81d5b0.arnt@c2i.net>
References: <002301c2b73e$e0f36ca0$3f00a8c0@tharryman>
	<20030108181810.GD21359@miggy.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030108181810.GD21359@miggy.org>
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
To: netfilter@lists.netfilter.org

On Wed, 8 Jan 2003 18:18:10 +0000, 
Athan <netfilter@miggy.org> wrote in message 
<20030108181810.GD21359@miggy.org>:

> On Wed, Jan 08, 2003 at 11:53:38AM -0600, Timothy Harryman wrote:
> > It certainly is not in /usr/src/linux (nautilus & terminal show that
> > /usr/src is empty - yes, I am showing all hidden/system files), nor
> > anywhere else I have looked.
> > 
> > I have a default installation of RH 8.0, and through rhupdate, it
> > has updated the kernel to 2.4.18-19.8.0
> > 
> > I am trying to install patch-o-matic 20030107, and the script
> > prompts me for the KERNEL_DIR.
> 
>   RH is almost certainly using seperate runtime and source packages
>   for
> the kernel.  Looking at http://www.rpmfind.net/ I see things like:
> 
> 	kernel-2.4.20-2.6.i686.rpm
> 	kernel-2.4.20-2.6.src.rpm

..???  Url?

> 
> The first being the compiled kernel and modules, the latter the source
> for it.  So go find kernel-2.4.18-19.8.0.src.rpm, or even better
> upgrade packages to a 2.4.20 kernel the current latest stable release.

..2.4.18-19.8.0 is RH's upgraded kernel for RH-8.0, and 2.4.18-19.7.x 
for RH-7.3 et al.  2.4.20-2.2 is "RawHide 1.0 Source" which is 
RH-talk for development stuff.  Read the specfile to see how RH 
builds their kernels.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



