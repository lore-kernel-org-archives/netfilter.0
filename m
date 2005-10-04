From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: iptables monitoring program
Date: Tue, 04 Oct 2005 09:51:59 -0400
Message-ID: <1128433919.2945.6.camel@localhost>
References: <200510031604.34646.tommy@svearike.sytes.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510031604.34646.tommy@svearike.sytes.net>
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
To: tommy@svearike.sytes.net
Cc: netfilter@lists.netfilter.org

On Mon, 2005-10-03 at 16:04 +0200, Tommy W wrote:
> I've developed a program (under development) to monitor iptables-rules/chains 
> in realtime. and I just thought that maybe you guys in here would be 
> interested of it. What I do not know on the other hand is if it's "ok" to 
> promote my program in here, if it's not sorry :) but I've seen other people 
> doing similar things.
> 
> Back to the program.
> It consists of a library and programs utilizing the library.
> The library takes care of putting speed's on the libiptc-structures.
> 
> natdump -d -z will dump out all rules in the active configuration that has a 
> speed of more than 0 
> 
> natstat is a gui (ncurses) that will show the rules/chains at real time.
> 
> natstatqt is a gui (qt) that does the same (not really, it's under developed 
> compared to the ncruses gui).
> 
> A very commonly used and needed function is to 'temporary flush' a rule.
> Meaning with a single click you can 'temporary flush' a rule to see how much 
> traffic has been sent .. and  another click to unflush it.
> 
> It's a perfect help-tool for control freaks :)
> 
> http://freshmeat.net/projects/natstat/
> 
I haven't tried it yet but it sounds like a neat tool. Thanks for
bringing it to our attention - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


