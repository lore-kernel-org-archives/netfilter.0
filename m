From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Multiple SNAT
Date: Mon, 9 Sep 2002 13:06:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209091206.g89C6Uv05291@vulcan.rissington.net>
References: <000201c25717$ce09ac80$0201a8c0@Operator>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000201c25717$ce09ac80$0201a8c0@Operator>
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
To: netfilter@lists.samba.org

On Tuesday 20 August 2002 9:56 pm, saki wrote:

> hello  i have internet cafe with 50 client and 1 server with 16 public
> address client1, client2, client3, client4  exit to ip.public.no.1
> client5, client6, client7, client8  exit to ip.public.no.2
> client9, client10, client11, client12  exit to ip.public.no.3
> ........
> ........
> client ip address 192.168.1.1 - 192.168.1.50
> public ip address 202.47.12.30 - 202.47.12.45
>
> any one can help ?
> i have installed redhat7.2 for server

iptables -A POSTROUTING -t nat -s 192.168.1.0/30 -j SNAT --to 202.47.12.30
iptables -A POSTROUTING -t nat -s 192.168.1.4/30 -j SNAT --to 202.47.12.31
iptables -A POSTROUTING -t nat -s 192.168.1.8/30 -j SNAT --to 202.47.12.32
iptables -A POSTROUTING -t nat -s 192.168.1.12/30 -j SNAT --to 202.47.12.33

etc.

Antony.

-- 

If at first you don't succeed, destroy all the evidence that you tried.

