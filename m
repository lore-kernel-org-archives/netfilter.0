From: "Leon Stankowski" <leons@voicenet.com>
Subject: bridge and redirect traffic to the bridge?
Date: Mon, 12 May 2003 23:54:32 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLEDIJIDBADCKKAGHJNMKEGMCIAA.leons@voicenet.com>
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

Hi all,

I've built a bridge using kernel 2.4.20 + ebtables, iptables, connection
tracking, nat, etc.  It's doing the invisible bridge (no IP) thing just fine
and I'm very happy with that part of it.  Here's my basic set-up with the
Router proving DHCP services and basic firewalling.

       Machine1
       10.0.0.10
           |
           |
       eth1 (no IP)
         BRIDGE eth0 (192.168.1.1) -- Other
       eth2 (no IP)
           |
           |
     Switch (no IP)
      |          |
      |          |
 10.0.0.27    10.0.0.1
 Machine2      Router
              ExternIP
                 |
                 |
              Internet

Now, I need to redirect TCP/IP (HTTP) traffic traveling through the bridge
in either direction and send it to one of two local processes on the bridge
based on the intended initial direction.  Said another way, HTTP requests
from Machine1 to a web site hosted on the other side of the bridge should be
invisibly redirected in the Bridge to a locally running Web server.
Additionally, HTTP requests from Machine2 or the Internet directed at
Machine1 should be invisibly redirected to a different web server in the
bridge.

In my attempts to do this I tried things like:

  # iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
DNAT --to-destination 192.168.1.1:8080
  # iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j
DNAT --to-destination 192.168.1.1:9080

And I've discovered that it seems to work in the Machine2 -> Machine 1
direction but not the opposite.

To add to my headache, in some circumstances I will need to give the bridge
(br0) an IP and in others I won't be allowed to.  In the cases that it gets
an IP I need these internal web servers to not accept traffic directed at
the bridge on those ports.  I tried mucking with the web server code and
using the setsockopt(SO_BINDTODEVICE) to limit the web servers to eth0 but
that didn't have the desired effect.  Instead only traffic directed at the
box from the outside got to the web apps while nothing else could get
there...

Finally, the bridge will need to be able to impersonate either machine1 or 2
to initiate a HTTP session with the other.  I'm not sure how to do this kind
of mangling.  Suggestions?

Help!

Thanks!
Leon



