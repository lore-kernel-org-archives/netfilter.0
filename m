From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: connect to different port
Date: Thu, 08 Dec 2005 14:13:41 +0100
Message-ID: <43983185.1060600@mnemon.de>
References: <43982D8E.9020308@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43982D8E.9020308@eccotours.dyndns.org>
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

Brent Clark schrieb:
> Hi all
> 
> I would like to have it so that a connection (destined for port 8080)
> comes in on eth0 and jumps to port 3389
> 
> $IPT -t nat -A PREROUTING -i eth0 -p tcp --dport 8080 -j DNAT --to
> 192.168.111.248:3389
> $IPT -t filter -A FORWARD -i eth0 -p tcp --dport 8080 -d 192.168.111.248
> -j ACCEPT

Try "--dport 3389" in your FORWARD rule, as the destination port is
already rewritten in nat/PREROUTING.

If you don't have it already, you need a rule in FORWARD that allows the
traffic back. Something like:

-A FORWARD -s 192.168.111.248 -j ACCEPT

or something more restrictive.

HTH,

Joerg

