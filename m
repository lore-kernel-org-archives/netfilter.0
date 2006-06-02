From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: netfilter files in a case-insensitive filesystem
Date: Fri, 2 Jun 2006 17:24:45 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0606021714480.12607@blackhole.kfki.hu>
References: <20060523202744.GO31607@lios> <447E7DC9.9010809@snapgear.com>
	<20060601154514.GA4977@lios>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060601154514.GA4977@lios>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carlos O'Donell <carlos@codesourcery.com>
Cc: netfilter@lists.netfilter.org, Philip Craig <philipc@snapgear.com>

On Thu, 1 Jun 2006, Carlos O'Donell wrote:

> On Thu, Jun 01, 2006 at 03:40:25PM +1000, Philip Craig wrote:
> > On 05/24/2006 06:27 AM, Carlos O'Donell wrote:
> > > Such files conflict in a case-insensitive filesystem. This is a problem
> > > for users building on Windows, or installing the headers on a Windows
> > > case-insensitive filesystems.
> > >
> > > The structures in the conflicting files seem to have unique names. Is it
> > > possible to merge both files together?
> >
> > Depends what exactly you are trying to do.  If you are just trying to
> > build an application that uses them, then you could probably merge them;
> > have you tried?  Building the kernel would require more work.
>
> I have not tried merging the headers. I was deffering to the experts to
> get an opinion :)
>
> The current goal is to be able to ship the headers for use in an
> environment which resides on a case-insenstive filesystem.

But why would it be useful? If someone develops netfilter kernel
modules/iptables extension in a Windows environment, he is unable to test
it. What is the point?

> If we did the work, would the community accept such patches?

You should not only have to merge the header files, but the source files
as well.  And develop another method to autoload kernel modules and
iptables extensions when required - matches and targets. And even when all
is done, I personally would be extremely reluctant to accept such patches
until I'm not convinced why it's absolutely required.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

