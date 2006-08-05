From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Conntrack for related service
Date: Sat, 05 Aug 2006 11:32:41 +0200
Message-ID: <44D465B9.4060807@rtij.nl>
References: <000901c6b842$c19de2a0$4764a8c0@mhsystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000901c6b842$c19de2a0$4764a8c0@mhsystems.com>
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
To: Mikhail <misha@mhsystems.com>
Cc: netfilter@lists.netfilter.org

Mikhail wrote:

>I've placed this filter in mangle table before I do my DNAT. I've also added
>the rule to clean up recent list in case of RST type of disconnect.
>  It seems to me though that script in this version has a flaw. Let's say
>someone creates 2 instances of the same application with the same source
>address and then closes one of them. I think this will effectively kill
>MSSQL connection for the remaining instance. Is there any way to count RMI
>connections originated from the same source IP and then start dropping MSSQL
>requests only in case that count reaches 0?
>  
>

Yes you're right. What you could do is not look at fin and rst packets, 
but use the timing feature of the recent module. Use a large timeout. So 
what you want is , if there has been activity from this ip address in 
the past X seconds on the RMI port, allow the mssql port.

Obviously that will not work if there has been no activity on the RMI 
port recently (or in case you have a lot of connections, the connection 
got evicted by recent for a newer one). But if rmi activity always 
occurs shortly before opening a connection to mssql it should do the trick.

HTH,
M4


