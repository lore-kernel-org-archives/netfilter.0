From: mjc22 <mjc22@drexel.edu>
Subject: libipq bug?
Date: Wed, 26 Mar 2003 20:11:54 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E8531D7@webmail.drexel.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi guys,

Currently I have 2 rules:

iptables -A INPUT -j QUEUE
iptables -A OUTPUT -j QUEUE

I also have a libipq program....

I get the packets fine with the program, except the IP id is messed up.  The 
IP header ID always seems to be the ID of the previous packet... not the 
current one.  Everything else looks ok, except the IP header ID...

Any ideas?


