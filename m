From: "Mark Alzino" <tirixil@hotmail.com>
Subject: How to change DNS with iptables rules ?
Date: Tue, 25 May 2004 13:23:53 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY16-F67ZBNCogiwHs000430ac@hotmail.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

I have two DNS server : one at 10.0.0.254 and one at 192.168.10.254.
I just want to dynamically change the DNS for a user (at 10.0.0.1 for 
example), but there is a time for the iptables rules to be activate.
Here is more explanation.


I use two DNS servers (bind 9), in the same host, with two interfaces. Each 
one ONLY listens on one interface (So, must not answer to a request related 
to an other one !).

At the begining, the user has the 10.0.0.254 server. Then I add rules in 
order to change the DNS for 192.168.10.254.
I use this the following rules :
iptables -A PREROUTING -s 10.0.0.1 -d 10.0.0.254 -t nat -p UDP --dport 53 -j 
DNAT --to-destination 192.168.10.254
iptables -A PREROUTING -s 10.0.0.1 -d 10.0.0.254 -t nat -p UDP --sport 53 -j 
DNAT --to-destination 192.168.10.254

** BUT **  : during a period (between 0 and 3 minutes), the user is ALWAYS 
CONNECTED TO the
10.0.0.254 server !!
In others words, I always have what I should have, but I have to wait for a 
minute to have this...

How it is possible ??


- Are the rules rights ??
- Is there really a time for the PREROUTING target to be activate (Is that 
it seem to be, but generally speaking rules are immediate...) ?
- DNS (bind) listen at the begining only on one interface and listen on all 
interface if it recognize a user he has served ? (!!!)
- Anyone has the answer ? :-)

Thanks 4 you help,

-- Mark

_________________________________________________________________
Dialoguez en direct et gratuitement avec vos amis sur 
http://g.msn.fr/FR1001/866 MSN Messenger !


