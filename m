From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: IP address to MAC address
Date: Tue, 11 Jun 2002 17:58:10 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020611215809.GE21405@cannon.eng.us.uu.net>
References: <081501c2118f$79efcf30$3200a8c0@jungle.funkybadger.org> <Pine.LNX.4.44.0206111744430.1615-100000@dhcp64-134-107-24.han.aus.wayport.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0206111744430.1615-100000@dhcp64-134-107-24.han.aus.wayport.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rpjday <rpjday@mindspring.com>
Cc: "Adam D. Barratt" <netfilter.list@adam-barratt.org.uk>, netfilter@lists.samba.org

On Tue, Jun 11, 2002 at 05:45:56PM -0400, rpjday wrote:

> On Tue, 11 Jun 2002, Adam D. Barratt wrote:
> 
> > Non sequiter. /sbin contains, by convention, binaries connected with
> > system administration. That is *not* the same as "binaries that may
> > only be executed by root".
> > 
> > /sbin is not on non-root users' paths, by default, but that doesn't
> > necessarily mean they can't execute stuff that lives there. Certainly,
> > on my Debian Woody and Sid boxes here, the contents of /sbin
> > are -rwxr-xr-x ;- the main thing stopping non-root users using some of
> > them is a lack of privileges, not a lack of execute rights to the
> > files.
> > 
> > Specifically, arp lives in /usr/sbin on my boxen, and whilst that's
> > not on my normal user's path, and the files are owned by root.root, I
> > can quite happily:
> > 
> >   /usr/sbin/arp -a
> > 
> > as any user. Similarly, a non-privileged user has no problems running
> > /sbin/route.
> 
> i would go one step further and suggest that regular users might
> consider adding /sbin and /usr/sbin to their search paths.  there's
> nothing wrong with that, and it allows users to run the same commands
> they would be allowed to run if they typed out the names in full:
> "route" instead of "/sbin/route", for instance.

The users who know what they're doing have done that already ;-) And
there is no reason to include this path for the users that don't have
a clue ;-)

Ramin

> rday

