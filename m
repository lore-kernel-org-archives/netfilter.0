From: Michael Martinez <mmartinez@csrees.usda.gov>
Subject: I'm having difficulty making port redirection work
Date: 30 Jun 2003 15:37:00 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1057001820.1133.40.camel@localhost.localdomain>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all -

I've used ipchains before, but I'm brand new to iptables, and I'm having
difficulty getting port redirection to work.

Here's what I want to do: I've got a Redhat 8.0 box running iptables
1.2.6a2. I've got a web application listening on port 8888 (on the eth0
interface) and  I'd like any web traffic coming in on port 80, to be
redirected to port 8888.

In ipchains, this is handled with the following line in
/etc/sysconfig/ipchains:

-A input -d 192.73.224.127 80 -p tcp -j REDIRECT 8888

I am using the following lines at the beginning of
/etc/sysconfig/iptables, but it does not work. I'm getting no messages
in /var/log/messages, and I don't know of any place where iptables is
logging anything:

*nat
-A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8888
COMMIT

How do I troubleshoot and fix this?

thank you -

-- 
Michael Martinez
Linux System Administrator
Marlaw Systems Technology Inc.
CSREES/ISTM/USDA
mmartinez@csrees.usda.gov

