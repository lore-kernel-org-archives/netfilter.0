From: Mariusz Kruk <Mariusz.Kruk@epsilon.eu.org>
Subject: Re: forward packets directly to net?
Date: Thu, 5 May 2005 16:24:39 +0200
Message-ID: <20050505142439.GA12229@epsilon.rdc.pl>
References: <200505051153.52443.chadley@pinteq.co.za>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200505051153.52443.chadley@pinteq.co.za>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, May 05, 2005 at 11:53:52AM +0200, Chadley Wilson wrote:
> #Clear All Tables
> ${ipt} -t filter -F
> ${ipt} -t nat -F

After cleaning the tables, you should set the policies to DROP.
(iptables -P)

> ## allow all from local interfaces [localhost]
> ${ipt} -t filter -A INPUT -s 127.0.0.1 -j ACCEPT

That's weird. You try to accept all traffic on INPUT chain originating
at localhost. Wouldn't it be just simplier to accept INPUT traffic on
interface lo?

> ##Allow {chad} to etel internet direct
> ${ipt} -t nat -A POSTROUTING -o ${ext} -s ${chad} -d ${etel} -p tcp -m tcp 
> --dport 80 --state NEW,ESTABLISHED,RELATED -j ACCEPT
> ${ipt} -t filter -A FORWARD -p tcp -m tcp -s ${chad} -d ${etel} -o ${ext} 
> --dport 80 -j MASQUERADE
> 
> 
> 
> Please could someone help me with a simpler rule?

1. You swapped the targets in those chains. You should ACCEPT in filter
and MASQUERADE in nat.
2. If you have static IP, why not use SNAT?
3. You need more rules, depending on what you want to achieve. If you
want a 1-1 mapping, you may look at modules like, IIRC, netmap, but
probably DNAT target would be sufficient.
4. Do you really need statefull filtering of forwarded packet?

-- 
[------------------------] 1*2*3*3*37  - the prime factorization of the
[  Kruk@epsilon.eu.org   ] number of the beast
[ http://epsilon.eu.org/ ] 
[------------------------] 

