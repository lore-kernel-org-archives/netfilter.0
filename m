From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: I think iptables is not alowing me to connect
Date: Sat, 21 Sep 2002 14:46:24 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D8C6A20.8020607@fugmann.dhs.org>
References: <001f01c260ce$7e185ad0$2101a8c0@aerowillys> <20020920200354.RYHR292.mta01-svc.ntlworld.com@there> <005501c260ed$d5563eb0$2101a8c0@aerowillys>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: AndreLSM <a.news@terra.com.br>
Cc: netfilter@lists.netfilter.org

AndreLSM wrote:
> Sorry I was not very clear,
> 
> Actualy I removed all iptables rules with:
> iptables -F
> iptables -X
> iptables -Z
> 
> but adsl still hangs and does not connect.
Have you changed the default policies to ACCEPT on the default chains,
e.g.:
$ iptables -P INPUT ACCEPT
$ iptables -P OUTPUT ACCEPT
$ iptables -P FORWARD ACCEPT

That might help
Anders Fugmann



