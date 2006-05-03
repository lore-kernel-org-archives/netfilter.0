From: Rob Sterenborg <rob@sterenborg.info>
Subject: Re: DROP before PREROUTING
Date: Wed, 03 May 2006 15:10:44 +0200
Message-ID: <4458ABD4.80005@sterenborg.info>
References: <52837e3e0605030548v485078e0w7ae6bbb9492d674a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <52837e3e0605030548v485078e0w7ae6bbb9492d674a@mail.gmail.com>
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

Bruno Nunes wrote:
> Hi folks,
>   i have this rule which forwards all incoming requests for ipA to a
> local machine as you can see.
>    iptables -t nat -A PREROUTING -d <ipA> -i eth0 -p tcp --dport 80
> -j DNAT --to 192.168.1.4
> 
>  is there any way to allow only a range of machines to use this
> specific rule (not interfering with the other rules)? dropping all
> requests that are not welcome.

By specifying the source IP('s).

iptables -t nat -A PREROUTING -s <src_ip[/mask]> -d <dst_ip> \
  -i eth0 -p tcp --dport 80 -j DNAT --to 192.168.1.4

If you have the iprange match installed, you can also use that to match
a range instead of a subnet or host.
http://www.netfilter.org/projects/patch-o-matic/pom-base.html#pom-base-iprange


Gr,
Rob


