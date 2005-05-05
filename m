From: "Daniel Wittenberg" <daniel-wittenberg@starken.com>
Subject: Re: FTP access from outside
Date: Thu, 05 May 2005 10:06:52 -0500
Message-ID: <1115305613.7527.15.camel@plasma.starken.com>
References: <200505051437.j45EbauW006066@eden.inf.ed.ac.uk>
	<200505051048.35097.dyioulos@firstbhph.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200505051048.35097.dyioulos@firstbhph.com>
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
To: Dimitri Yioulos <dyioulos@firstbhph.com>
Cc: netfilter@lists.netfilter.org

On Thu, 2005-05-05 at 10:48 -0400, Dimitri Yioulos wrote:
> On Thursday May 5 2005 10:37 am, you wrote:
> > > What have I missed (or messed up)?
> >
> > You have the ip_conntrack_ftp and ip_nat_ftp modules loaded?  And a rule to
> > pass ESTABLISHED and RELATED?
> 
> George,
> 
> I beleive I have the rule to pass ESTABLISHED and RELATED, but an lsmod shows 
> I don't have the ip_nat_ftp modules loaded.  Would load that by doing an 
> "insmod /dirwhereitlives/ip_nat_ftp.o"?

Just use 'modprobe ip_nat_ftp' in cases like this.  You don't need to
specify the whole path to loading modules.  You'll also get errors using
insmod if there are dependencies not loaded.

Dan


