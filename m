From: Kelly Setzer <Kelly.Setzer@placemark.com>
Subject: iptables immutable
Date: Thu, 6 Feb 2003 19:44:37 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030207014437.GC28004@placemark.com>
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

We are in the process of implementing a firewall based on iptables.
Our basic implementation is laid out, and now we are searching for
every scrap that might improve security.  One thing I'd like is the
ability to "lock" the iptables configuration so that no further
changes can be made (without rebooting).

I don't see that iptables supports that directly.  I would be willing
to put my effort into such a project, although it's at the limits of
my expertise.  I have been trying to think of a way to emulate this
behavior.

The only reasonable idea I've had is using Linux Capabilities:
http://www.kernel.org/pub/linux/libs/security/linux-privs/kernel-2.4/capfaq-0.2.txt

However, I'm not even sure how I'd apply that to iptables to prevent
changes to the iptables chains.

Thoughts?

Kelly


