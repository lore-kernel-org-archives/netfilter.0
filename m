From: Giorgio Zarrelli <zarrelli@in3it.com>
Subject: Re: Default policy
Date: Sat, 21 Dec 2002 19:12:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E18PoFF-0005ys-00@kashyyyk.netfilter.org>
References: <001501c2a8f3$40be2e40$1a01a8c0@vishal>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001501c2a8f3$40be2e40$1a01a8c0@vishal>
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
To: system@eluminoustechnologies.com
Cc: netfilter@lists.netfilter.org

On Saturday 21 December 2002 14:16, you wrote:

> Hi All,
>
> Following is the policy that my firewall generation script gives, but my
> system hangs when i execute this, I am using ssh to execute this script. I
> am opening all other required ports. When I comment the last two lines my
> script works fine.
>
> ******Script*******
>
> #Set default policies to DROP
>
> $IPTABLES -P INPUT DROP
>
> # Rejecting all Packets
>
> #$IPTABLES -A INPUT -s 0/0 -d 0/0 -p udp -j DROP
> #$IPTABLES -A INPUT -s 0/0 -d 0/0 -p tcp -j DROP

Ssh hangs because you drop all packets on tcp from and to everywhere.. So, 
your connection to the server is being cut. But policies like yours make no 
sens.

Regards

Giorgio Zarrelli

