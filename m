From: "Ashley M. Kirchner" <ashley@pcraft.com>
Subject: Help cofiguring new (private) subnet
Date: Tue, 15 Apr 2003 15:54:09 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E9C7F81.7020301@pcraft.com>
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
To: Net Filter Mailing List <netfilter@lists.netfilter.org>


    I'm needing some help on configuring of my current iptables script 
to expand onto a second subnet.  But before I posted the whole script 
(from iptables-save) and a map layout of the network, I thought I'd ask 
if there's anyone in specific that would like to help me out, or whether 
I should just go ahead and post the whole shebang.

    The short gist of it is this:  I've used Oskar Andreasson's 
rc.firewall script at http://iptables-tutorial.frozentux.net/ (linked 
from www.iptables.com) to generate my initial firewall script between 
our public internet address and the internal network.  However, I've now 
added a third nic to the machine and configured it with a different 
(private) network.  With the current firewall rules, I can not see 
anyone on that new subnet...only those on the old one.  That's what I 
need fixing.  That new subnet does NOT need forwarding like the first 
one does, so I'm not worried about it...I do however need to see the 
other systems on that subnet.

    There you go.  Anyone willing to help?




