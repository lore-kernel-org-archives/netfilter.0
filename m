From: Jason Opperisano <opie@817west.com>
Subject: Re: Host blocking
Date: Tue, 17 May 2005 09:14:15 -0400
Message-ID: <20050517131415.GA844@bender.817west.com>
References: <003b01c55acb$841114a0$f00aa9c0@winxp>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <003b01c55acb$841114a0$f00aa9c0@winxp>
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

On Tue, May 17, 2005 at 01:30:58PM +0300, Wennie V. Lagmay wrote:
> Our ISP's Proxy server is proxy.ISP.net , our company's own proxy server is 
> proxy.ourcompany.net. Our own proxy server has delay_pool but our ISP proxy 
> server dont have. I want to control our client to use only our company 
> proxy server. how can I block the proxy.ISP.net using IP tables so that 
> every body can be force to use our compnay proxy server. (note that our 
> company proxy server is connected to our ISP proxy server as cache_peer 
> parent)

assuming your company proxy server is on a different machine than the
firewall:


  iptables -A FORWARD -p tcp --syn -s proxy.ourcompany.net \
    -d proxy.ISP.net --dport $PROXY_PORT -j ACCEPT

  # assuming your internal machines are allowed unfettered access
  # to the internet

  iptables -A FORWARD -p tcp --syn -d proxy.ISP.net -j DROP

-j

--
"Guy on Street #2: It's 3:00. Where the hell is Louie?
 Guy on Street #1: Well, you tell me. Louie left his house at 2:15 and
 had to travel a distance 6.2 miles traveling at a rate of five miles a
 hour. When will Louie get here? 
 Guy On Street #2: Depends if he stops to see his ho. 
 Guy on Street #1: That's what we call a "variable"."
        --Family Guy

