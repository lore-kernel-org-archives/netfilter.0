From: "Carl Holtje ;021;vcsg6;" <cwh0803@cs.rit.edu>
Subject: Re: Source/Destination matching question..
Date: Tue, 15 Feb 2005 12:00:49 -0500 (EST)
Message-ID: <Pine.GSO.4.58.0502151159570.12207@frazi.cs.rit.edu>
References: <Pine.GSO.4.58.0502151132360.12207@frazi.cs.rit.edu>
	<33789.142.169.215.10.1108487349.squirrel@142.169.215.10>
Mime-Version: 1.0
In-Reply-To: <33789.142.169.215.10.1108487349.squirrel@142.169.215.10>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, 15 Feb 2005, Samuel Jean wrote:

> On Tue, February 15, 2005 11:41 am, Carl Holtje ;021;vcsg6; said:
> > All-
> >
> > Is there a way to define a rule to combine the following lines:
> > -A INPUT -s xxx.xxx.xxx.xxx -d yyy.yyy.yyy.yyy -j DROP
> > -A INPUT -s zzz.zzz.zzz.zzz -d yyy.yyy.yyy.yyy -j DROP
> >
> > ... something like
> > -A INPUT -s xxx.xxx.xxx.xxx -s zzz.zzz.zzz.zzz -d yyy.yyy.yyy.yyy -j DROP
> >   or even
> > -A INPUT -s xxx.xxx.xxx.xxx -s zzz.zzz.zzz.zzz -j DROP
>
> Yes. But that requires an extension match. Quickly, I can think of 3:
>
> o 'recent' match part of mainline kernel since a while.
>   You can add your `pool' of ips via /proc.
>   See http://www.snowman.net/projects/ipt_recent/
>
> o 'pool' match. You need ippool(8) to feed your pool.
>
> And finally, the best of all:
>
> o 'set' match. Which is part of the ultimate ipset 2.0 (the successor
>   to pool match).
>
>   See http://people.netfilter.org/kadlec/ipset/

IPSet is perfect for what I need! Thanks!

Carl

- --

"There are 10 types of people in the world: Those who understand binary
and those that don't."


