From: Pablo Neira <pablo@eurodev.net>
Subject: Re: CLUSTERIP error "iptables: Invalid argument"
Date: Thu, 03 Mar 2005 10:19:33 +0100
Message-ID: <4226D6A5.9090307@eurodev.net>
References: <7203.1109797991@www46.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <7203.1109797991@www46.gmx.net>
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
To: alex_oz@gmx.net
Cc: netfilter@lists.netfilter.org

alex_oz@gmx.net wrote:
> I tried the new Netfilter target CLUSTERIP using kernel-2.6.10. I discovered
> that there is still no userspace support in iptables-1.3.0. So I added
> "CLUSTERIP" in iptables-1.3.0/extenstions/Makefile and rebuilt
> iptables-1.3.0 with CLUSTERIP-support.

legba:/home/pablo/iptables-1.3.0/extensions# ls -la libipt_CLUSTERIP.so
-rwxr-xr-x  1 pablo pablo 6385 2005-03-03 09:44 libipt_CLUSTERIP.so

Really? It seems to compile just fine here

> Nevertheless it seems that shared library and kernel-object doesn't fit
> thogehter. When I try to input a CLUSTERIP rule like:
> 
> iptables -A INPUT -j CLUSTERIP --new --hashmode sourceip --clustermac
> 01:ab:cd:ef:ab:cd --total-nodes 2 --local-node 1

you forgot to add the interface and the IP, eg: -i eth0 -d 1.1.1.1

CLUSTERIP is still marked as experimental, so maybe you could find any bugs.

--
Pablo

