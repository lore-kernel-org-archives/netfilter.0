From: Jason Opperisano <opie@817west.com>
Subject: Re: connection tracking without iptables?
Date: Thu, 14 Oct 2004 14:57:58 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041014185758.GA4057@bender.817west.com>
References: <7C9884991ADAE0479C14F10C858BCDF591E37C@alderaan.smgtec.com>
	<561dc326040930160476d839c7@mail.gmail.com>
	<1096587270.22962.24.camel@wolfpack.ljm.dom>
	<561dc326041014113163a6a9eb@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <561dc326041014113163a6a9eb@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Oct 14, 2004 at 02:31:11PM -0400, Jiann-Ming Su wrote:
> On Thu, 30 Sep 2004 19:34:30 -0400, Jason Opperisano <opie@817west.com> wrote:
> > 
> >   egrep 'ESTABLISHED|ASSURED' /proc/net/ip_conntrack | wc -l
> > 
> 
> We're finding that any read operation on /proc/net/ip_conntrack really
> locks the system until that operation is completed.  That is, it's
> almost as if the read prevents any writes, so the firewall locks up
> momentarily until the read is done.  Is there a less system intensive
> way to read ip_conntrack?  Or, is my observation completely wrong?

i'm not aware of any way that reading /proc/net/ip_conntrack would
prevent the system from creating new conntrack entries, but there's lots
of things that i'm not aware of...

you could try IPTState:  http://iptstate.phildev.net/

i don't know if it'll help though, as i'm pretty sure it just reads in
/proc/net/ip_conntrack for its data, same as cat/grep/sed/awk/etc...

are you sure there isn't something else going on?

-j

-- 
Jason Opperisano <opie@817west.com>

