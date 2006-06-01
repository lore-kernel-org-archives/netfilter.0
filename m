From: Carlos O'Donell <carlos@codesourcery.com>
Subject: Re: netfilter files in a case-insensitive filesystem
Date: Thu, 1 Jun 2006 11:45:16 -0400
Message-ID: <20060601154514.GA4977@lios>
References: <20060523202744.GO31607@lios> <447E7DC9.9010809@snapgear.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <447E7DC9.9010809@snapgear.com>
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
Content-Transfer-Encoding: 7bit
To: Philip Craig <philipc@snapgear.com>
Cc: netfilter@lists.netfilter.org

On Thu, Jun 01, 2006 at 03:40:25PM +1000, Philip Craig wrote:
> On 05/24/2006 06:27 AM, Carlos O'Donell wrote:
> > Such files conflict in a case-insensitive filesystem. This is a problem
> > for users building on Windows, or installing the headers on a Windows
> > case-insensitive filesystems.
> > 
> > The structures in the conflicting files seem to have unique names. Is it
> > possible to merge both files together?
> 
> Depends what exactly you are trying to do.  If you are just trying to
> build an application that uses them, then you could probably merge them;
> have you tried?  Building the kernel would require more work.
> 

I have not tried merging the headers. I was deffering to the experts to
get an opinion :)

The current goal is to be able to ship the headers for use in an
environment which resides on a case-insenstive filesystem.

If we did the work, would the community accept such patches?

Cheers,
Carlos.
-- 
Carlos O'Donell
CodeSourcery
carlos@codesourcery.com
(650) 331-3385 x716

