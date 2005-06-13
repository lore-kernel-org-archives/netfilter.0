From: David Busby <busby@edoceo.com>
Subject: Re: Clusterip usage
Date: Mon, 13 Jun 2005 14:48:12 -0700
Message-ID: <42ADFF1C.2020503@edoceo.com>
References: <57F9959B46E0FA4D8BA88AEDFBE582909E99@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <57F9959B46E0FA4D8BA88AEDFBE582909E99@pxtbenexd01.pxt.primeexalia.com>
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
Cc: netfilter@lists.netfilter.org

ClusterIP is very similar to Microsofts Windows Load Balancing component, maybe Google can show you issues that others 
had on that side to help you plan.  I worked on that comp. at M$ a while ago (1999).  ClusterIP may have the same issues 
that WLBS had like:

All hosts see all traffic and must discard the ones that are "not mine".  Increased network traffic.
Then there is the multicasting issue too, some switches had problems with this.
Also tune the hashmode based on the types of protocols you'll see, meaning
http as sourceip-sourceport-destport, and ssh as sourceip (or maybe sourceip-sourceport depending on traffic load). 
Good luck.

/djb


Gary W. Smith wrote:
> This should work but if you run into needing slightly more functionality than can be procuded by iptables you're stuck.  This was our case.  We decided on LinuxHA and then finally on LinuxHA/DRBD.  This combination worked well for us (plus it was easy to configure).  Our additional funcitionality is based on the fact that we need to NAT serveral IP's.
>  
> Hope this helps.
>  
> Gary Smith
> 

