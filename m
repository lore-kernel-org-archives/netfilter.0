From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Do I need to write a module?
Date: Tue, 24 Jun 2003 11:55:00 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030624155500.GF32226@cannon.eng.us.uu.net>
References: <sef8269b.024@mail.stone-ware.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <sef8269b.024@mail.stone-ware.com>
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
To: Tony Thompson <tony.thompson@stone-ware.com>
Cc: netfilter@lists.netfilter.org

On Tue, Jun 24, 2003 at 10:22:52AM -0500, Tony Thompson wrote:

> Thanks for the response.  Maybe I should give a better picture of what I
> am trying to do.  I have a private network that I am trying to route
> through a Linux box.  I want to deny all traffic (from a MAC address)
> until a user authenticates, with their browser, to a Java application on
> the Linux server (when they authenticate, something has to happen to let
> netfilter know that the MAC address is allowed to pass).  There has to
> be some level of coordination at that point between the Java app and
> netfilter so that session timeouts, etc. can be handled.  I would like
> to have all of this happen as close to real time (i.e. not batched) as
> possible.
> 
> After writing this out, maybe I don't even need a module but, just a
> way to control netfilter from a Java app.  I am still open to
> suggestions...

Yes, what you need is to control netfilter from a Java app.

Before the authentication, redirect his web traffic to your java app.

After the authentication, remove the MAC restriction for the client,
add the necessary rules for his service.

Also, I'd implement some kind of timer to go off after certain period
of inactivity and remove the permission of his MAC.

It sounds easy but I'm sure it's gonna be fun implementing it ;-)


Ramin

> 
> Thanks.
> Tony

