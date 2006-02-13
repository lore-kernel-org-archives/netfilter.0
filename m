From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: RE: [OT] Strange bash phenomenon
Date: Mon, 13 Feb 2006 11:56:13 -0500
Message-ID: <1139849773.2960.40.camel@localhost>
References: <NEBBLLCNFOFHMALJMDDEKEOPBNAB.pablo@blueoakdb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <NEBBLLCNFOFHMALJMDDEKEOPBNAB.pablo@blueoakdb.com>
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
To: pablo@blueoakdb.com
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Mon, 2006-02-13 at 10:50 -0500, Pablo Sanchez wrote:
> > -----Original Message-----
> > From: netfilter-bounces@lists.netfilter.org
> > [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of John A.
> > Sullivan III
> > Sent: Saturday, February 11, 2006 8:45 AM
> > To: Netfilter users list
> > Subject: [OT] Strange bash phenomenon
> > 
> > Case #1
> > -------
> > FILES=/etc/config/iptables*
> >
> > [ snipped ]
> >
> > Case #2
> > -------
> > FILES=$(echo /etc/config/iptables*)
> > 
> > Any ideas why the latter one works fine but the other does not? Just
> > curious.
> 
> Hi John,
> 
> It has to do when the shell does the expansion.  In the first case when you assign 'FILES=', you're assigning it the string and it's not expanded by the shell.  If you want to change the behavior, you can do this:
> 
> 	FILES=${/etc/config/iptables*}
> 
> btw, Ilove the ${FILES%% *} trick.  I didn't know about it.  The shell is quite nifty.
> 
> -pablo
> 
> 
Thanks.  That makes sense, i.e., unexpanded assignment.  By the way, if
I try FILES=${/iptables*}, I get:

./testbash2: line 2: ${testb*}: bad substitution

But, at least I know how to make it work and understand why the first
approach failed - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


