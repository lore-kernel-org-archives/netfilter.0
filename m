From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: firewall problem continued
Date: Tue, 10 Aug 2004 10:14:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408101014.22969.Antony@Soft-Solutions.co.uk>
References: <20040809081216.GA12643@tranquility.scriptkitchen.com> <200408100926.33589.Antony@Soft-Solutions.co.uk> <20040810084353.GB22730@tranquility.scriptkitchen.com>
Reply-To: Netfilter ML <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040810084353.GB22730@tranquility.scriptkitchen.com>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

On Tuesday 10 August 2004 9:43 am, Payal Rathod wrote:

> On Tue, Aug 10, 2004 at 09:26:33AM +0100, Antony Stone wrote:
> > Why does the mail server need to refer to itself using the public IP?
>
> No idea. I thought that is recommended. I mean every machine should
> be able to access itself using all its IPs.

That would mean "all IPs on all interfaces of the machine".   It doesn't 
include arbitrary IPs which some other machine may choose to translate to an 
IP on this machine's interface.

> Will the same rule apply even when I using it as a database or webserver?

If you can find a good reason why a machine needs to refer to itself using an 
IP which is not on one of its interfaces (ie: an address which gets 
translated elsewhere), then we can try to think of a way to enable that.

However, until the problem arises, don't worry about it.

> > You should be cautious about doing too many things one after another
> > which are simply needed as workarounds for a strange network setup, or a
> > non-ideal DNS setup, and sooner or later you need to stop adding
> > workarounds and change the underlying design.
>
> Are you saying my setup is broken? Should I change my whole design?

Since you do not apparently have a need for the mail server to reach itself on 
the public IP address, then no, the design may be perfectly okay.   I thought 
there was some need for this, which suggested to me that maybe it was the 
wrong way to go about doing it.

So long as the system is working as it is, however, the design is probably 
okay.

Regards,

Antony.

-- 
Normal people think "If it ain't broke, don't fix it".
Engineers think "If it ain't broke, it doesn't have enough features yet".

                                                     Please reply to the list;
                                                           please don't CC me.


