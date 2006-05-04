From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Obtain original address from redirected connection
Date: Thu, 04 May 2006 20:51:24 +0200
Message-ID: <445A4D2C.1000001@plouf.fr.eu.org>
References: <20060502025450.73457687.pedro.werneck@terra.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060502025450.73457687.pedro.werneck@terra.com.br>
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

[Sorry for the late answer, I just subscribed to the list]

Hello,

Pedro Werneck wrote :
> 
> I have a daemon, a sort of proxy, written in Python, who receives
> redirected connections with a rule like this:
> 
> iptables -t nat -A PREROUTING -j DNAT -p TCP -s source --to-destination host:port
> 
> The problem is that I need access to the original destination address,

You can parse /proc/net/ip_conntrack on the NAT box, which contains the 
  list of the connections currently handled by conntrack/NAT. This is 
how Squid retrieves the original destination address when running in 
transparent mode.
Note : on "recent" kernels you need root privileges to read this file.

