From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: netfilter question
Date: Thu, 19 Feb 2004 14:18:08 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402191418.08941.Antony@Soft-Solutions.co.uk>
References: <4034bc3e.3ecb.0@arbbs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4034bc3e.3ecb.0@arbbs.net>
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
To: netfilter@lists.netfilter.org

On Thursday 19 February 2004 1:38 pm, John Black wrote:

> here are the rule sets.
> iptables -A FORWARD -i eth0 -o eth1 -m state --state \ESTABLISHED, RELATED
> -j ACCEPT
> iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
> iptables -A FORWARD -j LOG
>
> iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth0 \
> -d 161.x.x.x/21 -j SNAT --to 161.x.x.x

Okay, so that rule is going to hide your 192.168.0.0/24 network behind the 
public address of the firewall for all packets going to addresses in the 
range 161.x.x.x/21 (ie 8 Class C's in size).

How are you testing this and deciding it doesn't work?

(By the way, why are you only translating packets which are going to 
(presumably) your ISP?   What about packets going anywhere else on the 
Internet?).

Antony.

-- 
The words "e pluribus unum" on the Great Seal of the United States are from a 
poem by Virgil entitled "Moretum", which is about cheese and garlic salad 
dressing.

                                                     Please reply to the list;
                                                           please don't CC me.


