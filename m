From: Rio Martin <rio@martin.mu>
Subject: Re: Rules for Blocking Proxies...THANKS !!
Date: Wed, 28 Apr 2004 13:53:25 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404281353.25093.rio@martin.mu>
References: <000b01c426f6$cc216f10$36b4fea9@SABNANIS> <200404201537.12472.Antony@Soft-Solutions.co.uk> <000801c42d47$01e04760$36b4fea9@SABNANIS>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000801c42d47$01e04760$36b4fea9@SABNANIS>
Content-Disposition: inline
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
To: Netfilter <netfilter@lists.netfilter.org>

On Thursday 29 April 2004 00:34, Harry wrote:
> Hi All,
> Many thanks Mr.Antony, Alexix and the rest who helped me with the rule, the
> DNAT rule works great!! Was just going thru a website
> http://www.antiproxy.com
> wow...they have loads of ports thru which proxies can be bypassed?So does
> that mean I have to write rules for each of the relavent ports?at the
> moment I have just done for port 3128, and blocked the site antiproxy.com
> thru squid.
> Suggestions are welcome...
> Regards
> Harry

Maybe you should change Policy for FORWARD chain into Default DENY.
After that, you can add your allowed connection port list to be allowed. Like 
port 80,25,53,110,8080,etc..

- Rio.Martin -


