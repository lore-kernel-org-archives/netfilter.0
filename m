From: Tommy W <tommy@svearike.sytes.net>
Subject: iptables monitoring program
Date: Mon, 3 Oct 2005 16:04:34 +0200
Message-ID: <200510031604.34646.tommy@svearike.sytes.net>
Reply-To: tommy@svearike.sytes.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

I've developed a program (under development) to monitor iptables-rules/chains 
in realtime. and I just thought that maybe you guys in here would be 
interested of it. What I do not know on the other hand is if it's "ok" to 
promote my program in here, if it's not sorry :) but I've seen other people 
doing similar things.

Back to the program.
It consists of a library and programs utilizing the library.
The library takes care of putting speed's on the libiptc-structures.

natdump -d -z will dump out all rules in the active configuration that has a 
speed of more than 0 

natstat is a gui (ncurses) that will show the rules/chains at real time.

natstatqt is a gui (qt) that does the same (not really, it's under developed 
compared to the ncruses gui).

A very commonly used and needed function is to 'temporary flush' a rule.
Meaning with a single click you can 'temporary flush' a rule to see how much 
traffic has been sent .. and  another click to unflush it.

It's a perfect help-tool for control freaks :)

http://freshmeat.net/projects/natstat/

