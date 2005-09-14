From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Maximum number of rules in iptables?
Date: Tue, 13 Sep 2005 23:44:53 -0500
Message-ID: <200509132344.53842.rob0@gmx.co.uk>
References: <1123184190.21749.34.camel@ndspc131.p.n-dsi.com>
	<1126649450.4790.5.camel@ndspc131.p.n-dsi.com>
	<65aa6af9050913204146b94397@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <65aa6af9050913204146b94397@mail.gmail.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> On 9/13/05, Peggy Kam <ppkam@n-dsi.com> wrote:
> > What is the maximum number of policies I can define in the
> > iptables? ie. how much memory is allocated for iptables?

I'm sure the answer is in the kernel source code if you need it. This 
forum is more for users than developers. You could try asking on LKML 
or on netfilter-devel, but I don't think you would be well-received 
there unless you showed an effort to find your own answers.

Opinion as a user: it's probably dynamically allocated; more memory is 
used in cases where there are more rules, or where the rules require.

Remembered from Googling: it's not ever likely to be a factor.

Personal experience: an 8MB 80386 is quite capable of handling NAT for 
home and small business broadband connections. I increased the default 
number of connection tracking table (ip_conntrack_max) entries, but 
otherwise had no problem.

On Tuesday 2005-September-13 22:41, Edmundo Carmona wrote:
> that's a NFI for me. A whole bunch.... I've seen red hat scripts that
> are way longer than mine. ;-)

I think it's safe to say that if you're making that many rules, you're 
doing something wrong. :) I said the same thing in this thread to this 
poster over a month ago.

Red Hat iptables rules (that I have seen) are terrible. Do they have 
anyone on staff who understands firewalling? If so, they're not working 
on the firewalls.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

