From: "David Busby" <busby@pnts.com>
Subject: IPSec Passthru?
Date: Tue, 3 Jun 2003 13:47:00 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01fe01c32a11$503a8950$1100000a@busbydev>
Reply-To: "David Busby" <busby@pnts.com>
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

List,
    I'd like to be able to implement multiple clients on a private network
to do an IPSec connection via passthru on my iptables (2.4.20 kernel).  In
my searches I've seen something rumored to do this in 2.2 kernels, multiple
clients natted with IPSec passthru.  I've seen comments on the 2.4 being
able to do this for only one client at a time, how can I have 64 at one
time?  Not that I ever would, but I'd like to be able to make 2 or 3
simultaneous IPSec/Passthru/Nat connections.

David Busby
Systems Engineer
busby@pnts.com


