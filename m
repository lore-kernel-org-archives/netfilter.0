From: meb <mberardi@midmaine.com>
Subject: dnat and loopback failover
Date: 24 Jan 2003 07:15:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043410547.8827.31.camel@localhost.localdomain>
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



I would like to run my real services on a pair of lo interfaces
and use DNAT to route to them. (load balancing would be choice but is
not necessary)

the idea is, if eth0 gets DNATed to 127.0.1.2
and their is a problem with the service, I would like to be able to
issue an iptables command that directs only NEW connection to 127.0.1.3
but lets the old connections continue their connection to 1.2

is this possible with production quality code?
if so could someone please direct me to the appropriate docs?

thanks in advance
matt


