From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: INPUT or FORWARD;;
Date: Mon, 20 Dec 2004 02:10:16 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10412200158240.18976-100000@darkstar.sysinfo.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I see in the FAQ on the netfilter website this under  section 7.3
FILTERING SPECIFICATIONS;

<quote>

Specifying an Interface

...

 Packets traversing the INPUT chain don't have an output interface,
          so any rule using `-o' in this chain will never match.
	  Similarly, packets traversing the OUTPUT chain don't have an
	  input interface, so any rule using `-i' in this chain will never
	  match.
 Only packets traversing the FORWARD chain have both an input and
          output interface.


</quote>


My question is this, and it may well have been answered many times
already, I'll take the slap to the back of the head if it's one of the
common list questions that folks tend to get irritated in repeatedly
answering;

A multi-homed firewall having at least two interfaces, is known, at least
to itself by those IP/hostnames combos assinged to its interfaces.  <i.e.
ppp0 and eth0>  So say rules coming from the ppp0 interface into the
firewall <INPUT rules> are directed to it's other name/interface

-i /dev/ppp0 -d /dev/eth0

Are these valid for INPUT rule traversals, or are these in fact FORWARD
traversals?

Same goes for say pakets that come into the fw from the inside, but
designated for it's external address...

So, can INPUT rules, while lacking a -o interface spec <or ignoring such>
have a -s or -d that travel the INPUT rules, raather then being FORWARD
rules?  Or is the whole aspect of hoping an interface then something
FORWARD specific?


Thanks,

Ron DuFresne
-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        admin & senior security consultant:  sysinfo.com
                        http://sysinfo.com

...Love is the ultimate outlaw.  It just won't adhere to rules.
The most any of us can do is sign on as it's accomplice.  Instead
of vowing to honor and obey, maybe we should swear to aid and abet.
That would mean that security is out of the question.  The words
"make" and "stay" become inappropriate.  My love for you has no
strings attached.  I love you for free...
                        -Tom Robins <Still Life With Woodpecker>


