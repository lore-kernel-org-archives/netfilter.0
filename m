From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: HTTP slower than SSH on client behind iptables
Date: Mon, 30 Jan 2006 22:35:19 -0500
Message-ID: <20060131033519.GA32564@bostoncoop.net>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have a standard NAT box; the essential configuration for discussion
purposes on the box is just IP masquerading.

On the NAT box, my Internet connection goes up to about 700 kilobytes per
second, regardless of the protocol used (e.g., ssh or http).  

On clients behind the NAT box, however, HTTP connections seem to top out
around 70 kilobytes per second. ssh connections (e.g., rsync) get the
full throughput of the Internet connection.

As far as NAT goes, I don't hvae any special settings.

Can anyone think of an explanation for this behavior? It doesn't make any
sense to me.
-- 
Adam Rosi-Kessel
http://adam.rosi-kessel.org

