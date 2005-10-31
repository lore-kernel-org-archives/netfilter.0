From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: what's the problem of DNAT
Date: Mon, 31 Oct 2005 07:59:15 +0100 (CET)
Message-ID: <Pine.LNX.4.61.0510310758150.11251@filer.marasystems.com>
References: <43a0cdcb0510301931p3f97ff66p@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43a0cdcb0510301931p3f97ff66p@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Buddy wu <ejournal4me@gmail.com>
Cc: netfilter@lists.netfilter.org

On Mon, 31 Oct 2005, Buddy wu wrote:

>   I use '/sbin/iptables -t nat -A PREROUTING -d InternetAddr -p tcp
> --dport 80 -j DNAT --to 192.168.16.100:8087' it can work, but if I use
> 8087 instead of 80,like follows:
> /sbin/iptables -t nat -A PREROUTING -d InternetAddr -p tcp  --dport
> 8087 -j DNAT --to 192.168.16.100:8087 then it can't work. what's wrong
> with it ?

Any other rules in PREROUTING on port 80?

iptables-save -t nat

Regards
Henrik

