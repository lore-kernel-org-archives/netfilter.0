From: Ted Kaczmarek <tedkaz@optonline.net>
Subject: Re: ip_conntrack_max vs ip_conntrack
Date: Tue, 28 Sep 2004 08:53:38 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096376018.16424.95.camel@inyoureyes.linsolutions.com>
References: <4154A112.20308@suse.cz>
	<1403218a0409280059123fa77f@mail.gmail.com>
	<200409280831.31267.Alistair@nerdnet.ca>
Reply-To: tedkaz@optonline.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <200409280831.31267.Alistair@nerdnet.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Alistair Tonner <Alistair@nerdnet.ca>
Cc: netfilter@lists.netfilter.org

      * 
On Tue, 2004-09-28 at 08:31, Alistair Tonner wrote:
> On September 28, 2004 03:59 am, Mohamed Eldesoky wrote:
> > But still,
> > The /proc/net/ip_conntrack should contain all connections tracked by
> > that firewall (ie, passing through the firewall), am I right ??
> >
> 
> 	This list is all actively tracked connections, all not yet completed,  but 
> possibly tracked connections (called expectations) that the netfilter code is 
> watching for.  You need to pay attention to the state of the connection, but 
> you've got  the right idea.
> 
> 	I can't recall all the states off the top of my head, but they are fairly 
> clearly labelled.
> 
> 	Alistair Tonner.
> 
> 	<< SNIPPAGE>>
> 
Iptstate is nice for this.

Ted


