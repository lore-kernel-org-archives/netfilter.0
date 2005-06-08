From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: netfilter logging
Date: Wed, 08 Jun 2005 12:26:07 -0500
Message-ID: <42A72A2F.8050505@gmx.co.uk>
References: <5885.212.100.225.55.1118237133.squirrel@webmail.*>
	<20050608153440.094d81e2.vincent@info.unicaen.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050608153440.094d81e2.vincent@info.unicaen.fr>
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

Vincent Lenouvel wrote:
> 	echo "4 4 1 7">  /proc/sys/kernel/printk
> 
> [...]

http://www.linux.it/~rubini/docs/sysctl/sysctl.html

Interesting. But wouldn't that still print emerg messages to console? 
Does it not make more sense to change the --log-level being used?
-- 
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header

