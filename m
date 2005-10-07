From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: Re: How would this help my LAN / network
Date: Fri, 07 Oct 2005 18:36:36 +0200
Message-ID: <4346A414.3030809@eccotours.dyndns.org>
References: <4346866D.8080900@eccotours.dyndns.org>
	<4346913E.6070501@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4346913E.6070501@gmail.com>
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
To: Sorin Panca <sorin.panca@gmail.com>
Cc: netfilter@lists.netfilter.org

Sorin Panca wrote:
> 
> Small packets and control pachets should have priority because they
> carry intrractive traffic.

HI

I just had this other Idea,

I have a few services running in my private LAN, - Rules as so:

# To allow PPL to see PORT 80 and 443 for a particular webserver
$IPT -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT --to 192.168.111.11:80
$IPT -t filter -A FORWARD -i eth0 -p tcp --dport 80 -d 192.168.111.11 -j ACCEPT
$IPT -t nat -A PREROUTING -i eth0 -p tcp --dport 443 -j DNAT --to 192.168.111.11:443
$IPT -t filter -A FORWARD -i eth0 -p tcp --dport 443 -d 192.168.111.11 -j ACCEPT

# TO ALLOW SMTP
$IPT -t nat -A PREROUTING -i eth0 -p tcp --dport 25 -j DNAT --to 192.168.111.11:25
$IPT -t filter -A FORWARD -i eth0 -p tcp --dport 25 -d 192.168.111.11 -j ACCEPT

Can / should I use this following to help my internal web / mail server.

$IPT -t mangle -A PREROUTING -p tcp -m tcp --sport 80 -j TOS --set-tos Maximize-Throughput
$IPT -t mangle -A PREROUTING -p tcp -m tcp --sport 25 -j TOS --set-tos Maximize-Throughput

Just something I was thinking.

Kind Regards
Brent Clark

