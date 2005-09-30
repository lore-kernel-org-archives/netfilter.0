From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Clearing conntrack? Extending size of conntrack?
Date: Fri, 30 Sep 2005 14:39:41 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0509301430060.19019@filer.marasystems.com>
References: <433C67D4.9070907@cp.centennialcollege.ca>
	<20a523fb0509291534e7614b9@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20a523fb0509291534e7614b9@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Fabien Germain <fabien.germain@gmail.com>
Cc: netfilter@lists.netfilter.org

On Fri, 30 Sep 2005, Fabien Germain wrote:

> You can set an higher value in /proc/sys/net/ipv4/ip_conntrack_max.

you really SHOULD set the size by increasing the hash table size to 
conntrack. Increasing ip_conntrack_max should only be seen as a quick 
patch until you can reload the module with a larger hash table. 
Performance will suffer noticeably until the hash size is increased.

> And to check the number of current tracked connections : cat > /proc/net/ip_conntrack | wc -l

Much better to get this value from the slab cache

   awk '/^ip_conntrack / {print $2}' /proc/slabinfo


Reading /proc/net/ip_conntrack like suggested above can easily kill the 
performance of your firewall if done frequently, and in addition may give 
slightly misleadig results as the data is being changed while it is being 
read, not to mention that reading /proc/net/ip_conntrack is very slow when 
the traffic and number of entries is high.

Regards
Henrik

