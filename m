From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: H323 Patch-o-matic
Date: Tue, 31 Dec 2002 21:02:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021231210208.659c7e50.arnt@c2i.net>
References: <200212231328.17654.richard@arachnia.dynip.com>
	<C026BF1E-1CF1-11D7-8A13-000393950CC2@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <C026BF1E-1CF1-11D7-8A13-000393950CC2@karlsbakk.net>
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
To: netfilter@lists.netfilter.org

On Tue, 31 Dec 2002 19:57:46 +0100, 
Roy Sigurd Karlsbakk <roy@karlsbakk.net> top-posted in message 
<C026BF1E-1CF1-11D7-8A13-000393950CC2@karlsbakk.net>:
 
> On Monday, December 23, 2002, at 07:28 PM, Richard Norton wrote:
> 
> > Hi,
> > I am trying to get H323 working over using nat so i have been trying
> > to patch my kernel (RedHat 8.0 stock 2.4.18-14) using the 
> > patch-o-matic.
> > When i apply the h323-conntrack-nat.patch, it complains that there
> > are problems:
> >
> > Testing patch extra/h323-conntrack-nat.patch...
> >    Placed new Config.in line
> >    Placed new Config.in line
> >    Placed new Configure.help entry
> >    Placed new Makefile line
> > Could not find place to slot in ip_conntrack.h line
> > Could not find place to slot in ip_conntrack.h line
> > Could not find place to slot in ip_conntrack.h line
> >
> > How do i fix this?
> 
> don't use RedHat's kernel
> use the one you get from kernel.org
>

..this _may_ work with Red Hats 2.4.18-19.8.0, which _is_ what you 
want to replace your buggy old 2.4.18-14 with.  Patch-o-matic output 
will tell you all about it.  On failure, fall back to Roy's advice.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



