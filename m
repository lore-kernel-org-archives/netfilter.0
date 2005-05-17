From: "Wennie V. Lagmay" <wlagmay@yanbulink.net>
Subject: Host blocking
Date: Tue, 17 May 2005 13:30:58 +0300
Message-ID: <003b01c55acb$841114a0$f00aa9c0@winxp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Our ISP's Proxy server is proxy.ISP.net , our company's own proxy server is 
proxy.ourcompany.net. Our own proxy server has delay_pool but our ISP proxy 
server dont have. I want to control our client to use only our company proxy 
server. how can I block the proxy.ISP.net using IP tables so that every body 
can be force to use our compnay proxy server. (note that our company proxy 
server is connected to our ISP proxy server as cache_peer parent)

thanks,

wennie 


