From: Sebastian Heidl <s.heidl@teles.de>
Subject: Re: system time going up with many rules updates
Date: Thu, 26 Jan 2006 12:33:22 +0100
Message-ID: <1138275202.10432.175.camel@sehe-c4.berlin.teles.de>
References: <1138265165.10432.163.camel@sehe-c4.berlin.teles.de>
	<200601261100.18485.vnulllists@pcnet.com.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200601261100.18485.vnulllists@pcnet.com.pl>
In-Reply-To: <200601261100.18485.vnulllists@pcnet.com.pl>
References: <1138265165.10432.163.camel@sehe-c4.berlin.teles.de>
	<200601261100.18485.vnulllists@pcnet.com.pl>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Jakub Wartak <vnulllists@pcnet.com.pl>
Cc: netfilter@lists.netfilter.org

On Thu, 2006-01-26 at 11:00 +0100, Jakub Wartak wrote:
> Dnia czwartek, 26 stycznia 2006 09:46, Sebastian Heidl napisa=B3:
> > I have some moderately busy (in terms of traffic) firewalls that =
are
> > spending quite a lot CPU time in %system (> 70%) when there are a =
lot of
> > updates to the netfilter rules.
> > My question is: How can I lower the system time to enable the =
machines
> > to handle more traffic ? Specifically, would nf-hipac or other =
netfilter
> > projects help here ?
> >...
> You could try ipsets, in my production systems they are rock solid =
stable.=20

Ok, I think the iphash type of set would be the right one here. Are
there any docs about the lookup/insert/update times under load ?

> I'm=20
> pushing over 1200 clients on P4 3GHz ( about 25-30 mbps , 50% cpu =
load, but=20
> this machine also is running netflow probe... network cards: pure =
e100

I'm running netflow too, NICs are e1000, currently we have a little =
over
3000 clients at peak times.

Thanks for the reply.
_sh_

