From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: CLASSIFY target confusion
Date: Sat, 10 Sep 2005 14:45:24 -0500
Message-ID: <200509101445.24816.rob0@gmx.co.uk>
References: <BAY107-DAV15EE440C9687F21C6C112CB79B0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY107-DAV15EE440C9687F21C6C112CB79B0@phx.gbl>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Saturday 2005-September-10 13:08, Deepak Seshadri wrote:
> Here is a snippet from my script:

Perhaps it's a minor and insignificant detail, but the terminology is 
wrong; these are iptables-save(8) rules, not a script.

> *mangle
> -A POSTROUTING -o eth0 -s 10.0.2.0/24 -j router
> -A router -j CLASSIFY --set-class 1:21
> -A router -p tcp --dport 80 -m layer7 --l7proto exe -j CLASSIFY
> --set-class 1:23
> -A router -j ACCEPT
>
> As you see above:
> - All packets from 10.0.2.x will jump to the chain "router"
> - Here it gets classified to TC's class 1:21

And at that point they are finished in the mangle table POSTROUTING 
chain, and out they go.

> - But if the packet matches the layer-7 policy "exe", it will get
> classified to TC's class 1:23

Unless matched by the first rule, which all traffic does match.

> the class 1:21. Could someone please help me here?

Always assume that any target is a terminating one, unless documented 
otherwise. Reverse the order of the first and second rules, and you 
will get what you want.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

