From: Dallas Clarke <dallas.clarke@elgas.com.au>
Subject: udp clients
Date: Tue, 18 Apr 2006 15:48:41 +1000
Message-ID: <44447DB9.4080409@elgas.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello All,

I am running a udp client behind an iptables firewall, I can open a 
socket, send from the socket, but I can only receive one packet back 
from the server - all other packets are blocked.

Is this the standard way netfilter works, have I configured something 
wrong (straight out of the box fedora core 5).

This is a real problem from me since I can't expect every user to drop 
their firewall so they can use our client software.

Thanks

Dallas.

