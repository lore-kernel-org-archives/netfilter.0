From: Askar <askarali@gmail.com>
Subject: ram and processor cycles for a firewall machine
Date: Fri, 1 Oct 2004 12:35:15 +0600
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <a0f69e504093023354ec7c59e@mail.gmail.com>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

hi all,
im in the process of changing my fw machine for that atm im simulating
and testing. I got a very fair question
1) How much RAM and and processor would be best for moderate firewall box?
Unfortunatly currently my company running the fw on a P-III 500MHz
with 128MB of RAM.
I am wondering if I change to default DROP things (atm its default
ACCEPT) aren't these specification kinda makes problem?

right now 75 users online the /proc/net/ip_conntrack shows 

egrep 'ESTABLISHED|ASSURED' /proc/net/ip_conntrack | wc -l
   4888
cat /proc/net/ip_conntrack | wc -l
   6511

well these number would probably little higher when 120 users online.
Is my current fw machine specs adequate for such ip_conntrack load?

regards
Askar
(after bouncing head on desk for days trying to get mine working, I'll make
your life a little easier)

