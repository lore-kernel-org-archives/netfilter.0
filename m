From: David Coulson <david@davidcoulson.net>
Subject: Re: SNAT for two interfaces not working
Date: Wed, 28 Sep 2005 09:51:34 -0400
Message-ID: <433A9FE6.4030904@davidcoulson.net>
References: <200509281547.23683@axl.clue.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200509281547.23683@axl.clue.co.za>
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
To: Sheldon Hearn <sheldonh@clue.co.za>
Cc: netfilter@lists.netfilter.org

Sheldon Hearn wrote:
> So basically, the SYN+ACK is arriving back at the firewall, but the 
> firewall then ignores it.  If I add logging, I see the packet hit 
> PREROUTING, but that's it.

Disable return path filtering on the interfaces.

echo 0 > /proc/sys/net/ipv4/conf/eth0/rp_filter

David


