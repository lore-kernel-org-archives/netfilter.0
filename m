From: Jason Joines <support@bus.okstate.edu>
Subject: anyone know how to use clusterip
Date: Thu, 24 Mar 2005 14:43:34 -0600
Message-ID: <42432676.2010701@bus.okstate.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

    I recently noticed the clusterip target extension in my iptables man 
page.  It looks really interesting but I have no idea how how to go 
about trying  it out as I'm not exactly sure what it is supposed to do 
and don't understand exactly what all these options mean.  I've 
consoulted the netfilter website and googled far and wide but haven't 
had any luck finding any examples or more documentation.  Is anyone 
using this thing?

~> man iptables
<--- snip --->
   CLUSTERIP
       This  module allows you to configure a simple cluster of nodes 
that share a certain IP and MAC address without an explicit load
       balancer in front of them.  Connections are statically 
distributed between the nodes in this cluster.

       --new  Create a new ClusterIP.  You always have to set this on 
the first rule for a given ClusterIP.

       --hashmode mode
              Specify the hashing mode.  Has to be one of sourceip, 
sourceip-sourceport, sourceip-sourceport-destport

       --clustermac mac
              Specify the ClusterIP MAC address.  Has to be a link-layer 
multicast address

       --total-nodes num
              Number of total nodes within this cluster.

       --local-node num
              Local node number within this cluster.

       --hash-init rnd
              Specify the random seed used for hash initialization
<--- snip --->
~>


Jason Joines
=================================

