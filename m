From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Redirection to local lan, isn't DNAT method unsafe.
Date: Thu, 1 Apr 2004 09:37:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404010937.47442.Antony@Soft-Solutions.co.uk>
References: <40696C1A.5080400@personalsoft.com.br> <002a01c417c2$d94db7e0$de0aa8c0@comp>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002a01c417c2$d94db7e0$de0aa8c0@comp>
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

On Thursday 01 April 2004 9:25 am, Bo Jacobsen wrote:

> I use DNAT to redirect traffic from the external lan eth0 (192.168.1.1) to
> a specific host (192.168.10.10) on the internal lan (eth1) like this:
>
> iptables -t nat -A PREROUTING  -p tcp --dport 80  -d 192.168.1.1 -j DNAT
>     --to 192.168.10.10 -i eth0
>
> and then I allow the redirected traffic:
> iptables -a FORWARD -p tcp --dport 80  -d 192.168.10.10 ........
>
> It works as expected but with this aproach, it's actually possible from the
> outside to find out what internal ip, the http server is located at !.
> All one has to do is sending to 192.168.10.1, 192.168.10.2, 192.168.10.3
> etc.  (to eth0 on the outside) until one hits the server. The rules allows
> it.
>
> I have not been able to figure out how to solve this problem.

It is normally recommended *not* to do filtering in the nat or mangle tables, 
however in this case if you really want to do what you say then that is the 
solution.

iptables -I PREROUTING -t nat -s 192.168.1.0/24 -d 192.168.10.10 -p tcp 
--dport 80 -j DROP

Note the -I which inserts the rule before the prerouting rule you listed 
above.

Regards,

Antony.

-- 
What is this talk of "software release"?
Our software evolves and matures until it is capable of escape, leaving a 
bloody trail of designers and quality assurance people in its wake.

                                                     Please reply to the list;
                                                           please don't CC me.


