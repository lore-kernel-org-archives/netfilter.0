From: Ron Peterson <rpeterso@mtholyoke.edu>
Subject: Re: blocking dhcp on bridge
Date: Mon, 14 Feb 2005 17:09:13 -0500
Message-ID: <20050214220913.GA21981@mtholyoke.edu>
References: <20050206210154.GA20344@mtholyoke.edu>
	<20050207185711.GA23991@mtholyoke.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050207185711.GA23991@mtholyoke.edu>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, Feb 07, 2005 at 01:57:11PM -0500, Ron Peterson wrote:
> On Sun, Feb 06, 2005 at 04:01:54PM -0500, Ron Peterson wrote:
> 
> > I am running a dhcp server on a bridging firewall.  The dhcp server runs
> > on br0.  I have eth0 connected to my 'private' network, and eth1
> > connected to my 'public' network.
> > 
> > I only want this dhcp server to service dhcp requests from the private
> > network.  Any dhcp requests entering via eth1, or any dhcp replies being
> > sent via eth1 should be dropped.

I stopped using iptables, and used ebtables instead.  Seems to work.

Obviously, there is some overlapping functionality between these two
toolsets.  I'm learning the hard way when to use which tool.

$EBTABLES -A INPUT --in-interface $PUB --protocol IPv4 --ip-protocol udp --ip-source-port 68 -j DROP
$EBTABLES -A INPUT --in-interface $PUB --protocol IPv4 --ip-protocol udp --ip-destination-port 67 -j DROP
$EBTABLES -A FORWARD --in-interface $PRIV --protocol IPv4 --ip-protocol udp --ip-source-port 68 -j DROP
$EBTABLES -A FORWARD --in-interface $PUB --protocol IPv4 --ip-protocol udp --ip-destination-port 67 -j DROP

-- 
Ron Peterson
Network & Systems Manager
Mount Holyoke College
http://www.mtholyoke.edu/~rpeterso

