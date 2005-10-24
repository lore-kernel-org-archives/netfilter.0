From: "Tony Spencer" <tony@games-master.co.uk>
Subject: Forwarding to another ip:port based on source
Date: Mon, 24 Oct 2005 07:29:26 +0100
Message-ID: <200510240628.j9O6Skw3002058@linux.tonyspencer.co.uk>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi 

Is it possible to have an IPTables rule that will forward any packets on a
given port to another ip address and port based on where the packet came
from?

For example if I have a server on IP 192.168.0.1 and any requests into that
server on port 80 from a source IP of 192.168.1.10 and want to force those
packets to our squid server 192.168.0.11 on port 3128. But only for the IP
192.168.1.10, all other requests to the server on port 80 should stay local?

Thanks
Tony
 


