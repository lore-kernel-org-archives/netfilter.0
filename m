From: Alex Feldman <alex@alexandrite.boisestate.edu>
Subject: opening up an ipchain
Date: Tue, 14 Nov 2006 13:55:02 -0700
Message-ID: <200611142055.kAEKt2IY017525@alexandrite.boisestate.edu>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I will start out by admitting I know very little about iptables.  I have
read several tutorials and tried to find the answer to this on the web
in the list archive and elsewhere, but I could not.  So this question
may be frighteningly easy or ill-posed, and I would appreciate help
regarding where to look for an answer as well as the answer itself.  And
I know nothing about ipchains.

I have a computer running FC5 that I mostly want closed off to the
world.  The two things I want to come in are email and http requests, as
I run a web server there.  I left iptables on in sysconfig, but it
appears to do very little if anything, so I added my own chains that I
run out of rc.local.  Here is the guts of what I do:

*****************************************************************

iptables --policy INPUT   DROP
iptables --policy OUTPUT  ACCEPT
iptables --policy FORWARD DROP

iptables -t nat --policy POSTROUTING ACCEPT
iptables -t nat --policy PREROUTING ACCEPT

#---------------------------------------------------------------
# The loopback interface should accept all traffic
# Necessary for X-Windows and other socket based services
#---------------------------------------------------------------

iptables -A INPUT  -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

#---------------------------------------------------------------

iptables -A INPUT -p tcp -i eth0 --dport 25 --sport 1024:65535 -m state 
--state NEW -j ACCEPT

iptables -A INPUT -p udp -i eth0 --sport 53 --dport 1024:65535 -j ACCEPT
iptables -A INPUT -p tcp -i eth0 --sport 53 --dport 1024:65535 -j ACCEPT

iptables -A INPUT -p tcp -i eth0 --dport 80 --sport 1024:65535 -m state 
--state NEW -j ACCEPT

#---------------------------------------------------------------
# Allow previously established connections
#---------------------------------------------------------------
iptables -A INPUT -j ACCEPT -m state --state ESTABLISHED,RELATED -i eth0 
-p tcp

*********************************************************************

Some of this I copied off the web, and I do not understand why I need
all of it, e.g., all the 1024:65535 port identifiers.  But it works, or
seems to, and I am happy with it.

However, I would like to open up the computer further, maybe not all the
way but for the moment that would be OK, to my own laptop via its mac
address - I figure that would be pretty safe, but if not, I'd like to
hear why not.  So I added the line:

iptables -A INPUT -m mac --mac-source XX:XX:XX:XX:XX:XX -j ACCEPT

and some variations on it, like with "-p all" in there, at various
places in the file, but none of them worked (and they all had my real
mac address in there, I just took it out before I displayed this to the
world). 

Is the problem that I have it in the wrong place in the chain, or
something else?  I really don't understand the difference between -A and
-I, especially since the basic file seems to work even though the first
thing I do is drop all input, and then allow some back later.

I'd appreciate any help I can get here.  Thanks very much.

-- 
	--alex			alex@math.boisestate.edu

        <a href="http://math.boisestate.edu/~alex/">Alex Feldman</a>

