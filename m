From: Stephen Satchell <list@satchell.net>
Subject: Re: limit outgoing *-*-*-*-*-*-*-*
Date: Sun, 07 Dec 2003 08:13:54 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070813634.6835.36.camel@ssatchell1.pyramid.net>
References: <1070812547.3fd34d8339437@paris-hme1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1070812547.3fd34d8339437@paris-hme1>
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
To: zynkx <skydive@megamail.pt>
Cc: netfilter@lists.netfilter.org

On Sun, 2003-12-07 at 07:55, zynkx wrote:

> is it possible to limit outgoing smtp traffic with 
> iptables? let's say i got a smtp running and i don't 
> want anybody to send more than 3 mb of mail, each time 
> a user sends an email somewhere. each email i send, i 
> will not be able to send no more than 3 mb.is this 
> possible to limit?

Not with IPTABLES.  The best way to enforce this limit is to set up a
Mail Transfer Agent (MTA) such as PostFix on a machine, define a set of
IPTABLE rules that limit outgoing port 25 access to the specific MTA
only, and set the size limit in PostFix's configuration file to 3
megabytes.

If you want to be less of a dictator, most Mail User Agents (MUAs) like
Outlook and Eudora have settings that will warn a user if they are
trying to send a mail with a size above a specified limit.  In Eudora,
that can be set on a per-account basis; I use this to avoid sending
large mails to certain mailing lists that won't accept them.  ("Large"
in this context is 50k.)

Not all problems are nails;  trying using more than just a hammer.

Satch



