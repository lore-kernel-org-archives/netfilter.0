From: Rudi Starcevic <tech@wildcash.com>
Subject: Essential ICMP
Date: Fri, 18 Feb 2005 09:50:58 -0800
Message-ID: <42162B02.8060308@wildcash.com>
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

Hi,

I'd like to allow only the essential ICMP message messages.
This is for a very busy web server using about 60MB/per sec.

I have this list of what I think are the essential ICMP types I should 
allow.
Do you think this is correct?
Am I missing anything ?
 
ICMP,Type,Code Used By
0     0     Ping
3     4     Path-MTU Discovery
4     0     Source Quench
8     0     Ping
11     0     traceroute

Many thanks.
Regards Rudi


-- 
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.300 / Virus Database: 265.8.8 - Release Date: 14/02/2005


