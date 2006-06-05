From: Carlos O'Donell <carlos@codesourcery.com>
Subject: Re: netfilter files in a case-insensitive filesystem
Date: Mon, 5 Jun 2006 09:40:48 -0400
Message-ID: <20060605134047.GL4977@lios>
References: <20060523202744.GO31607@lios> <447E7DC9.9010809@snapgear.com>
	<20060601154514.GA4977@lios>
	<Pine.LNX.4.58.0606021714480.12607@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0606021714480.12607@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org, Philip Craig <philipc@snapgear.com>

On Fri, Jun 02, 2006 at 05:24:45PM +0200, Jozsef Kadlecsik wrote:
> > The current goal is to be able to ship the headers for use in an
> > environment which resides on a case-insenstive filesystem.
> 
> But why would it be useful? If someone develops netfilter kernel
> modules/iptables extension in a Windows environment, he is unable to test
> it. What is the point?

Target embedded devices attached via serial or usb?
 
> > If we did the work, would the community accept such patches?
> 
> You should not only have to merge the header files, but the source files
> as well.  And develop another method to autoload kernel modules and
> iptables extensions when required - matches and targets. And even when all
> is done, I personally would be extremely reluctant to accept such patches
> until I'm not convinced why it's absolutely required.

Thank you for your an initial evaluation of the required work.

Cheers,
Carlos.
-- 
Carlos O'Donell
CodeSourcery
carlos@codesourcery.com
(650) 331-3385 x716

