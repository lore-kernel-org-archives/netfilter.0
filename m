From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables to redir subdomain to certain ports
Date: Sun, 14 Jan 2007 22:23:27 -0600
Message-ID: <45AB01BF.1010600@riverviewtech.net>
References: <6acf2da00701130734r62945d54k9f6759dc95431e72@mail.gmail.com>
	<Pine.LNX.4.61.0701131710290.19940@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0701131710290.19940@yvahk01.tjqt.qr>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 01/13/07 10:11, Jan Engelhardt wrote:
> Only if www.domain.com has a distinct ip address from dl.domain.com. If 
> that does not hold true, use Apache's mod_rewrite magic, because then 
> you are actually working on l7 rather than l3.

I'm not sure that mod_rewrite by its self will provide that much help. 
If you use mod_proxy, possibly in conjunction with mod_rewrite, you can 
configure a virtual domain of Apache to be a reverse proxy.  Thus when a 
client connects to Apache on 80 asking for a virtual domain, Apache will 
then go and as thttpd for the contents on behalf of the client.  This 
will mean that the clients will never have to choose a different port. 
If you need help with such, email me directly as this is not really a 
Netfilter issue.


Regarding L7 filter, it may work, but you would have to make sure that 
the returning traffic was un-redirected.  If you do not un-redirect the 
traffic, there is a very good chance that clients will see returning 
traffic directly from the thttpd server on port 81, thus the clients 
firewall and / or client IP stack will stop the connection.



Grant. . . .

