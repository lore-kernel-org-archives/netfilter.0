From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: curious about address specification and port specification
Date: Thu, 10 Oct 2002 05:16:03 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210100513560.20979-100000@localhost.localdomain>
References: <000401c27014$5783fdc0$026410ac@honor>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000401c27014$5783fdc0$026410ac@honor>
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
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Thu, 10 Oct 2002, Sascha Reissner wrote:

> From: "Robert P. J. Day" <rpjday@mindspring.com>
> 
> > just the other day, i was at a local LUG meeting and a guy was giving a
> > quick tutorial on iptables and displayed a sample rule file that contained
> > the rule:
> >
> >   iptables -A FORWARD --destination 172.16.0.2 --destination-port 25  \
> > --jump ACCEPT
> >
> >   doesn't this represent an example of what i was asking about?  a
> > reference to a port with no reference to protocol.
> 
> well, a flipchart, whiteboard or video beamer presentation wont spit out any
> error messages...
> 
> a real computer will do, and it will tell you that --destination-port is an
> invalid parameter in that case..
> 
> because you dont specify any protocol ;)
> 
> iptables v1.2.6a: Unknown arg `--destination-port'
> Try `iptables -h' or 'iptables --help' for more information.

apparently, it was my misunderstanding.  i thought the presenter was
displaying the contents of his *actual* rules file, when he had just
lashed together a sample file for the purposes of the talk without 
actually testing the file.  argh.  so, yes, the rule in question is
in fact invalid.

i have *got* to stop taking people at their word. :-)  thanks for all
your patience, i think i have a pretty good handle on all this now.

rday


