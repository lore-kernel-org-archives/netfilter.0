From: "David Smith" <dsmith@mypchelp.com>
Subject: source address next hop?
Date: Fri, 19 May 2006 20:14:24 -0500 (CDT)
Message-ID: <2407.201.153.91.209.1148087664.squirrel@www.mypchelp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

I set up openvpn and have two subnets;

192.168.1.0/24 locally
192.168.2.0/24 remote side

The .1.0 lan has lots of natted machines, but i want one (and only one) of
those machines to use the .2.0's gateway to reach the internet.
The servers are 192.168.1.1 and .2.1

All is well with the VPN and I have full communication both ways, but only
from the server boxes themselves.

Someone mentioned I should do a source address and modify its next hop,
but I really dont know how.. Help?

-- dave



