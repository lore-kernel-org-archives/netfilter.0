From: "Dhyanesh Ramaiya" <dhyanesh@intafrica.com>
Subject: Asymmetric routing
Date: Mon, 12 May 2003 12:12:12 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <03d301c31866$937b2d80$0223a8c0@satconet.com>
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

Dear all,

Below is a simple diagram of my network:

| LAN 1 | ---- | Linux RTR 1 | ---- | INTERNET | ---- | Linux RTR 2 | ---- |
LAN 2 |

What I want to do:
- I want to be able to access a server on LAN 2 from nodes on LAN 1. LAN 1
and LAN 2 are both using private IPs. However, the gateway for the server
that I want to access on LAN2 is not my router (Linux RTR 2). It is another
router (let's say RTR 3 on that network). An easier way to achieve this
requirement is by adding a static route on the server on LAN 2. However, the
requirement is such that no configurations should be added/changed on the
server on LAN 2 and the RTR 3. This results in an asymmetric route for
packets from LAN 1 to server on LAN 2 as they do not follow the same path on
the return.

Kindly assist on how this can be achieved using iptables only (DNAT, SNAT,
route, etc.).

Dhyanesh Ramaiya


