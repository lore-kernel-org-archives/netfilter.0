From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Blocking access to UDP port 53 (DNS) - Solution
Date: Mon, 11 Aug 2003 14:25:18 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030811182518.GC11900@cannon.eng.us.uu.net>
References: <12CC60849165134FB7DF8570B621F4D51C89CD@mailxserver.euler.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <12CC60849165134FB7DF8570B621F4D51C89CD@mailxserver.euler.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Len L." <len@euler.com>
Cc: netfilter@lists.netfilter.org

I'm glad it worked but a small note: Is there any standard/RFC specifying
that an MX lookup must come from port 25? Or is it just an arbitrary
observation which works for certain smtp servers and fails for others?

Ramin

On Mon, Aug 11, 2003 at 12:48:22PM -0500, Len L. wrote:

> OK, 
> I got it. Here is the rule set I tried and had success (b.t.w. The DNS server is fire walled but is a standalone machine - no forwarding) 
> The answer was to reference DNS requests for port 25 only. 
> iptables -A INPUT --protocol udp --source-port 25 -s 63.143.210.0/24 -j LOG --log-prefix "XXX LOCAL UDP DNS XXX "
> iptables -A INPUT --protocol udp --source-port 25 -s 63.143.210.0/24 -j ACCEPT
> iptables -A INPUT --protocol udp --source-port 25 -j LOG --log-prefix "XXX EXTERNAL UDP LOG XXX "
> iptables -A INPUT --protocol udp --source-port 25 -j ACCEPT
> iptables -A INPUT -p udp -j LOG --log-prefix "XXX UDP DROP XXX "
> iptables -A INPUT -p udp -j DROP 
> Also will drop the 25 sport reference on the internal side along with the logging as a final solution
> 
> 
> Len Laulainen 
> 
> 
> 

