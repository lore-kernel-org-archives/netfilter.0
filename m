From: John <NetFilter@the-hobit.com>
Subject: Iptables - Memory Allocation Errors
Date: Tue, 30 Nov 2004 18:48:07 -0700
Message-ID: <6.1.2.0.2.20041130184749.02284068@pop2.jjgb.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

System Info:

Netra T1 105
Linux sparky 2.4.27-sparc #2 Thu Oct 7 10:49:35 MDT 2004 sparc64 sun4u TI 
UltraSparc IIi (Sabre) GNU/Linux
440Mhz
512Meg Ram
18Gig HD
Gentoo Incarnation.
Has been extremely stable.
iptables v1.2.11

I have a previously developed firewall that goes way back in 
years.  However, several years ago I switched to iptables from ipchains 
when I went to Red Hat 7.3 on an X86 box.

Having a few years of automated door slamming of cracker's, port scans etc. 
etc., I have a sizable list of blocked IP's I would like to continue to 
use.  Bout 1800 or so, as a matter of fact, plus my actual rules 
allowing/disallowing services and such.  I could supply entire firewall if 
needed, but I can't imagine I am the only one with this difficulty.

This whole firewall loads nicely on an X86 box running 128Meg ram and a 
2.4.19 stock kernel and a X86 box I just set up using a 2.6.7 kernel on a 
Gentoo distro. with 256M ram.

However, on the Sparc box, it will load only 857 lines of "iptables -A 
INPUT -i $EXTERNAL_INTERFACE -s $BANNED -j DROP" and then I get "iptables - 
memory allocation error" line after line through out the rest of the 
load.  When I do "iptables -L -n |wc -l" the 857 shows up.

I can load my basic I/O rules then start the loop for these IP's, and when 
it hits the total of 857, same indication...

Can anyone out there help me out?  Is this a Sparc64 thingy, and if so, how 
may I work around it?

Much thanks in advance.

John  


