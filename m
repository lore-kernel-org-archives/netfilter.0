From: Kirk <whereisgui@gmail.com>
Subject: Re: Confused about NAT and forwarding
Date: Wed, 23 Feb 2005 13:24:59 -0800
Message-ID: <48be50bb05022313244004375@mail.gmail.com>
References: <48be50bb050222142429a5be8f@mail.gmail.com>
	<421BB636.8050104@arcoscom.com>
Reply-To: Kirk <whereisgui@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <421BB636.8050104@arcoscom.com>
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

> PRIV_PROXY_IP=192.168.0.2
> PUB_PROXY_IP=a.b.c.d
> IPT=iptables
> 
> $IPT -t nat -I POSTROUTING -s $PRIV_PROXY_IP -o eth0 -j SNAT --to
> $PUB_PROXY_IP
> 

I just want to let you guys know that this solution worked. 

Thanks again.

