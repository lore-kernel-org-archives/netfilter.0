From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: How to block Yahoo Messenger through IP Tables
Date: Sun, 6 Oct 2002 12:27:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021006122710.A3805@funkyjesus.org>
References: <20021005155955.65569.qmail@web40205.mail.yahoo.com> <1033808433.2973.4.camel@localhost.localdomain>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1033808433.2973.4.camel@localhost.localdomain>; from Krishna_shekhar@vsnl.net on Sat, Oct 05, 2002 at 05:00:31AM -0400
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sat, Oct 05, 2002 at 05:00:31AM -0400, Krishna wrote:
>     But why do you want to do that? If you want to block a particular
> port then either disable it in inetd or xinetd. Or make rules 
> for that destination port to DROP packets.

As the OP stated, the Linux box is being used as a gateway.  The Yahoo
Messenger servers are out on the Net, so you'll need to block traffic going
through the host, so inetd and xinetd won't help. 

> > Sorry for asking this newbie question first.
> > 
> > I am running a network with a Linux Server as a gateway. I am using
> > IPtables as to masquerade internal IPs for Internet usage. I want to
> > block the uses of my intranet for using yahoo messenger. I needed help
> > for this. In general i wanted to know how to block a particular port.

It's not a newbie question at all, and sounds very familiar.  Have you
Googled for it throughly?  IIRC Yahoo Messenger tries some interesting ways
to get through firewalls - so you might want to filter on destination IP, or
do some kind of content matching fun.  I would expect a lot of people are up
against similar problems so someone will have found a solution already if
there's one to be found.

-- 
FunkyJesus System Administration Team


