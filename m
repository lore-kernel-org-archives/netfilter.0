From: Dimitri Yioulos <dyioulos@firstbhph.com>
Subject: Re: FTP access from outside
Date: Thu, 5 May 2005 11:18:42 -0400
Message-ID: <200505051118.42873.dyioulos@firstbhph.com>
References: <200505051437.j45EbauW006066@eden.inf.ed.ac.uk>
	<200505051048.35097.dyioulos@firstbhph.com>
	<1115305613.7527.15.camel@plasma.starken.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1115305613.7527.15.camel@plasma.starken.com>
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

On Thursday May 5 2005 11:06 am, you wrote:
> On Thu, 2005-05-05 at 10:48 -0400, Dimitri Yioulos wrote:
> > On Thursday May 5 2005 10:37 am, you wrote:
> > > > What have I missed (or messed up)?
> > >
> > > You have the ip_conntrack_ftp and ip_nat_ftp modules loaded?  And a
> > > rule to pass ESTABLISHED and RELATED?
> >
> > George,
> >
> > I beleive I have the rule to pass ESTABLISHED and RELATED, but an lsmod
> > shows I don't have the ip_nat_ftp modules loaded.  Would load that by
> > doing an "insmod /dirwhereitlives/ip_nat_ftp.o"?
>
> Just use 'modprobe ip_nat_ftp' in cases like this.  You don't need to
> specify the whole path to loading modules.  You'll also get errors using
> insmod if there are dependencies not loaded.
>
> Dan

Thank you both for the info.  I'm waiting for my outside tester to report 
back; hopefully he can now connect.

Let me really show the depths of my ignorance and ask, how do I install the 
modules permanently?

as always, thanks.

Dimitri

