From: "Clint M. Sand" <schwack@neotrance.dyndns.org>
Subject: weird login problem after implementing IPTABLES
Date: Mon, 11 Nov 2002 13:15:12 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021111191512.GA13673@neotrance.dyndns.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Greetings. 

I have a Redhat 7.1 box that acts as a main router/gateway for several
segments on my network. It is currently filtering on each interface
using ipchains. I would like to migrate these services to iptables to
take advantage of the ftp connection tracking module and other stateful
matching features. 

I migrated my ruleset, hacked up the redhat init script to load my
script on boot and tried it out on the box. The script loads fine with
no errors, and all the clients on each segment work as expected, even
active ftp. 

The problem is, once the script is loaded, even though network-wise
everything is fine, i can no longer login at the console on any tty!
(ctrl+alt+f2 for example) I enter my username, and hit enter and it just
goes into nevernever land. If i log out of the tty that i was in to
activate iptables, i'm also unable to log back in on that one either. I
have to kill the power to the box and boot single user and switch back
to ipchains to restore the box back to production.

I have a test box with very similar hardware which is also running rh
7.1 and i'm not able to duplicate the problem on it. Both of these boxes
use redhats "up2date" and have all the latest security and bug patches
applied.

Anyone have any ideas on what might be causing this? I have posted all
my rules, my init script, dmesg and iptables version here:

http://neotrance.dyndns.org/~schwack/iptables/

ANY help would be GREATLY appreciated. 

Thanks,

Clint


