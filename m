From: Brent Clark <bclark@rocketseed.us>
Subject: Re: (No subject header)
Date: Tue, 30 Nov 2004 09:09:06 +0200
Message-ID: <41AC1C92.4030700@rocketseed.us>
References: <41aba9f5.308.7f37.1299399369@arbbs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41aba9f5.308.7f37.1299399369@arbbs.net>
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
To: black@arbbs.net
Cc: netfilter@lists.netfilter.org

John Black wrote:
>  
> I'm trying to setup a connection to port 3389 on a windows
> 2003 server.
> 
> my server 80.1.1.1
> 
> public ip address for windows server110.20.30.15
> 
> private ip address for windows server 192.168.0.15
> 
> 
> is this right:
> iptbles -t nat -A PREROUTING -d 80.1.1.1 -p tcp \
> --dport 3389   -j DNAT --to 110.20.30.15:2289
> iptbles -t nat -A PREROUTING -d 110.20.30.15 -p tcp\
> --dport 3389   -j DNAT --to 192.168.0.15:2289

Hi

This is my ruleset

Hope it helps

$IPT -t filter -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -t nat -A PREROUTING -i eth0 -p tcp -s 1.2.3.4 --dport 3389 -j DNAT 
--to 192.168.111.124:3389
$IPT -t filter -A FORWARD -i eth0 -p tcp -s 1.2.3.4 --dport 3389 -d 
192.168.111.124 -j ACCEPT

Kind Regards
Brent Clark

