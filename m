From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: ip ro get problem
Date: Wed, 15 Sep 2004 09:51:51 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409150951.51609.Alistair@nerdnet.ca>
References: <20040915104501.GA10207@bluff>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040915104501.GA10207@bluff>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: iptables <netfilter@lists.netfilter.org>

On September 15, 2004 06:45 am, Sandro Dentella wrote:
> Hi all,
>
> I'm using ip route get to debug a routing probelm and I get:
>
>     root@fw-euronet argo # ip route get 192.168.254.10
>     192.168.254.10 dev eth0  src 192.168.254.1
> 	cache  mtu 1500 advmss 1460
>     root@fw-euronet argo # ip route get 192.168.254.10 from 192.168.5.2
>     RTNETLINK answers: Invalid argument
>
>
> What does really mean "RTNETLINK answers: Invalid argument",
>
<< Snippage >>

	Very good question -- and althought there might be someone here who could 
answer this (and I too would like to know since I'm now mucking with iproute2 
and a dual route system) .. But this question would best be asked on a LARTC 
mailing list :

	subscribe here:
	http://mailman.ds9a.nl/mailman/listinfo/lartc

	archive here:
	http://mailman.ds9a.nl/pipermail/lartc/


	Good luck !

	Alistair Tonner

