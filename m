From: Ciprian Niculescu <ciprian@promo.ro>
Subject: Re: [Linux Diffserv] ANNOUNCE: tc filter extensions
Date: Sat, 04 Jan 2003 19:25:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E172729.2070707__33951.8384695568$1041976462@promo.ro>
References: <20030104125252.J48869@shell.cyberus.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jamal <hadi@cyberus.ca>
Cc: diffserv-general <diffserv-general@lists.sourceforge.net>, lartc@mailman.ds9a.nl, netfilter@lists.samba.org, netfilter-devel@lists.samba.org

hello,

if someone can develop a feature like -j LOG from iptables, for the tc 
filter

for ex i have

tc filter ...... match dport 80 0xffff flowid 1:1

i want to write to syslog the headers of the packets that matched this rule.

C

jamal wrote:
> 
> I guess holidays means idle time which means idle minds which leads to
> thumb twiddling which then leads to some work (which is sometimes useful)
> 
> Ive updated the traffic control patches i posted about six months ago.
> Note, the current release does not break anything in tc. It is fully
> backward compatible so you can choose not to use it and things will work
> as they do today. Of course, it is very useful so you cant choose to
> ignore it!
> 
> It's now upgraded to better than "use at your own risk" category.
> tested on both uni and SMP 2.4.18 and 2.4.20.
> 
> http://www.cyberus.ca/~hadi/patches/action/
> 
> Bug reports and feedback are appreaciated.
> A lot more goodies coming up, so this is just the tip. First steps are to
> prove sanity of the idea.
> 
> cheers,
> jamal
> 
> 
> -------------------------------------------------------
> This sf.net email is sponsored by:ThinkGeek
> Welcome to geek heaven.
> http://thinkgeek.com/sf
> _______________________________________________
> Diffserv-general mailing list
> Diffserv-general@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/diffserv-general



