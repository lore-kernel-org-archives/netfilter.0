From: rwc@lanl.gov
Subject: Modification to iptables (block IP addresses)
Date: Mon, 28 Oct 2002 12:49:35 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DBD94CF.C0F8E7E2@lanl.gov>
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
To: netfilter@lists.samba.org

Is anyone working on the following modification to iptables?

Dynamically watch for connections coming from any source IP addresses
that exceeds a
predefined number of connections per unit time.  When seen, block all
subsequent connections from that source for a predefined period of time
or
indefinitely.  Currently, one can do this for specific predefined source
IP
addresses, but it would be good to have the ability to do this without
having prior knowledge of the offending IP source.





