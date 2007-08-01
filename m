From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	=?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: RE: adding rules - slow
Date: Wed, 01 Aug 2007 10:40:56 +0300
Message-ID: <1185954056.4759.18.camel@localhost.localdomain>
References: <46aa63fb.120b420a.16f8.0c23@mx.google.com>
	<1185572284.10031.2.camel@localhost>
	<002f01c7d40c$fb1b87d0$f1529770$@sk>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002f01c7d40c$fb1b87d0$f1529770$@sk>
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
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?J=C3=BAlius_Bem=C5=A1?= <julo@atknet.sk>
Cc: "'John A. Sullivan III'" <jsullivan@opensourcedevel.com>, netfilter@lists.netfilter.org

В Срд, 01/08/2007 в 09:24 +0200, Július Bemš пишет:
> Thank you very much ... good idea.
> But do you know why is iptables so slow? Because I think about writing my own utility for adding new rules.

date; I=0; while [ $I -lt 1000 ]; do I=`expr $I + 1`; iptables
>/dev/null 2>&1; done; date
Wed Aug  1 10:36:32 EEST 2007
Wed Aug  1 10:36:39 EEST 2007

As you can see just invoking iptables 1000 time from a shell takes 7
seconds on my machine. Shell is slow. Moreover when there are many rules
each iptables invocation does same checks that many times.
iptables-restore do much of the work once for all rules.

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of John A. Sullivan III
> Sent: Friday, July 27, 2007 11:38 PM
> To: Július Bemš
> Cc: netfilter@lists.netfilter.org
> Subject: Re: adding rules - slow
> 
> On Fri, 2007-07-27 at 23:30 +0200, Július Bemš wrote:
> > Hi,
> > 
> > When I need to add som rules (in my case 100) to some chain it takes various
> > time, depending on the number of existing rules in the chain. So when I add
> > 100 rules to empty chain, it takes 1.8sec. If tehere is 1000 rules int the
> > chain, it takes 4.5sec and if there is 10000 rules it takes 21sec. 
> > 
> > My problem is, that i need to add this rules to chain which contains 20000
> > rules in short time. I think, that the way of adding rules into chain is
> > very innefective. 
> > 
> > Could someone tell me how the adding works internally? What data structures
> > are used? Because I need solve this and find the way how to add new rules
> > quickly.
> > 
> > Thanks for replies
> > 
> > 
> We face the same problem on the ISCS project
> (http://iscs.sourceforge.net).  There, do to micro-perimeter network
> security, we frequently generate thousands or tens of thousands of rules
> with the click of a mouse.
> 
> We handle it by adding rules via iptables-restore rather than iptables.
> The load time difference is remarkable.  You write your rules into files
> with very similar syntax to iptables and then direct them into
> iptables-restore, e.g., 
> 
> iptables-restore < /etc/PEP/rules.txt
> 
> or, if you do not want to overwrite existing rules,
> 
> iptables-restore -n < /etc/PEP/runtimerules.txt
> 
> Hope this helps - John
-- 
Покотиленко Костик <casper@meteor.dp.ua>


