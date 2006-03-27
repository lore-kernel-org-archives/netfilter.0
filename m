From: Mike Wright <ebwximaurm@mailinator.com>
Subject: Re: ip redirection
Date: Mon, 27 Mar 2006 08:21:05 -0800
Message-ID: <442810F1.3020300@mailinator.com>
References: <52837e3e0603270713g798cea20v1e718747a631a095@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <52837e3e0603270713g798cea20v1e718747a631a095@mail.gmail.com>
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

Bruno Nunes wrote:
> this is what the dns server does:
> 
>  intranet.xxxxxxxxx.com.br --> AAA.AAA.AAA.AAA
> 
>  requests to intranet... goes to AAA....A  (the router)
> 
>  this is what i want:
> 
>  AAA.AAA.AAA.AAA (router) --> BBB.BBB.BBB.BBB (webserver)
> 
>  BBB...B is an IP address inside a private network like 192.168.1.x
>  AAA...A is a worldwide ip address like 139.82.x.x
> 
>  How can I do this redirection with iptables?

It's called Network Address Translation.  (man iptables)

iptables -t nat -A PREROUTING -d AAA.AAA.AAA.AAA \
          -p tcp -m tcp --dport 80 \
          -j DNAT --to-destination BBB.BBB.BBB.BBB

> 
>  thanks!
> 
>  bruno
> 
> 
> 

