From: Michael Thompson <mike@thompsonmike.co.uk>
Subject: Re: (no subject)
Date: Thu, 10 Feb 2005 04:42:51 +0000
Message-ID: <420AE64B.8060708@thompsonmike.co.uk>
References: <420AE506.4080403@thompsonmike.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <420AE506.4080403@thompsonmike.co.uk>
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
To: Michael Thompson <mike@thompsonmike.co.uk>
Cc: netfilter@lists.netfilter.org

Michael Thompson wrote:
> Every once in a while while I am running a script from cron, it outputs 
> this:
> 
> iptables: Resource temporarily unavailable
> 
> what is that about? Could it be that two processes are trying to access 
> IPTables?
> 
> 

It has also spat out the error of

iptables: Module is wrong version

And
modprobe: Can't locate module ip_tables

Although less frequently than Resource unavailable.


