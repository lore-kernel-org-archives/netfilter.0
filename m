From: Jason Opperisano <opie@817west.com>
Subject: Re: transparent bridge troubles?
Date: Fri, 7 Jan 2005 14:44:06 -0500
Message-ID: <20050107194406.GA900@bender.817west.com>
References: <074001c4f4ea$388d1070$3e0010ac@esonet18>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <074001c4f4ea$388d1070$3e0010ac@esonet18>
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

On Fri, Jan 07, 2005 at 01:53:48PM -0500, mdpeters wrote:
> This is what my iptables setup looks like.
> 
> /usr/local/sbin/iptables -P FORWARD DROP

k--so all packets traversing FORWARD that don't match one of the
following rules will get dropped.

> /usr/local/sbin/iptables -A FORWARD -p tcp --syn -m state --state NEW -j QUEUE
> /usr/local/sbin/iptables -A FORWARD -p tcp -m state --state RELATED,ESTABLISHED -j QUEUE
> /usr/local/sbin/iptables -A FORWARD -p udp -j QUEUE
> /usr/local/sbin/iptables -A FORWARD -p icmp -j QUEUE

and all we've done is QUEUE packets.

> #/usr/local/sbin/iptables -L

please use "iptables -vnxL" in the future when posting output.

> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination
> 
> Chain FORWARD (policy DROP)
> target     prot opt source               destination
> QUEUE      all  --  anywhere             anywhere
> QUEUE      tcp  --  anywhere             anywhere            tcp
> flags:SYN,RST,ACK/SYN state NEW
> QUEUE      tcp  --  anywhere             anywhere            state
> RELATED,ESTABLISHED
> QUEUE      udp  --  anywhere             anywhere
> QUEUE      icmp --  anywhere             anywhere
> 
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination

well--you're queuing all your packets to a userspace daemon--what are
you doing with them when they get there?

-j

--
"To alcohol: the cause of, and solution to, all of life's problems."
        --The Simpsons

