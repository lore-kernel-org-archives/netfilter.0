From: Jason <baker@cyborgworkshop.com>
Subject: Re: chance to impress the suits
Date: Thu, 27 Feb 2003 15:21:02 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.50.0302271518100.19962-100000@alfred.home.cyborgworkshop.com>
References: <Pine.LNX.4.50.0302261757350.18770-100000@alfred.home.cyborgworkshop.com>
 <200302270201.04762.netfilter@newkirk.us> <20030227134810.7728c8d5.arnt@c2i.net>
 <Pine.LNX.4.50.0302270811550.19694-100000@alfred.home.cyborgworkshop.com>
 <20030228014041.7394bcfa.arnt@c2i.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030228014041.7394bcfa.arnt@c2i.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnt Karlsen <arnt@c2i.net>
Cc: netfilter@lists.netfilter.org

They need a bigger box.   The whole app on their end is 6 boxes,  two
front end web servers, two application servers and then the database.
They upgraded the database, which used to be the bottleneck, and we then
maxed out their web servers. They upgraded their web servers and now we
max out their app servers. They have more hardware on order, but Sun is
claiming a month lead time for Sunfires.  But I figure in the meantime,
this should work out pretty well.

-- 
Jason Baker
baker@cyborgworkshop.com
www.cyborgworkshop.com

On Fri, 28 Feb 2003, Arnt Karlsen wrote:

> On Thu, 27 Feb 2003 08:17:33 -0600 (CST),
> Jason <baker@cyborgworkshop.com> wrote in message
> <Pine.LNX.4.50.0302270811550.19694-100000@alfred.home.cyborgworkshop.co
> m>:
>
> > What we have is a server that makes as many connections to an
> > application as it can.   Its supposed to be a realtime app, so this is
> > desired behaviour.
>
> ...says the guys who can't get that grip???
>
> > Unfortunatly, the app is owned by a different group that can't
> > seem to get a grip on how much hardware they need. So we max them out,
> > and their solution when they hit too many connections is to allow the
> > port to be opened by the client (us)  but never send any data or a RST
> > or anything! So my server ends up with tens of thousands of
> > connections in wait and I end up running out of threads pretty
> > quickly.
>
> ..ah, an _authorized_ dos attack.  ;-)
>
> > So my thought was by putting an iptables box in the stream
> > with iplimit and either redirecting connections that go over a max
> > count to a "sorry we're busy page" or denying the connection all
> > together, I can save my machine until they get the hardware they need.
>
> ..this is where I fall off:  They need a smaller box to not dos attack
> you, or a bigger box to not dos attack you???
>
> > Is their perhaps a better method?  Right now I have to babysit my
> > servers from 8pm to 3am and kill the route to their application when
> > things get ugly.  Pretty nasty solution.
> >
>
> ..played with the kernel settings in /proc/sys/net ?  You have
> checked the Patch-o-matic stuff for ideas?
>
> ..I get the feeling the "real time" autorized dos attack application
> should _re-use_ its own established connections, and make new
> connections _only_ when needed, and, _destroy_ the old connections
> as soon as they are no longer needed.  Pretty basic.  Does it?
>
> ..I don't see how an autorized dos attack application spraying
> new network connections like crazy, can _ever_be_ "real time".
>
>

