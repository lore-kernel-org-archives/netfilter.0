From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Not forwarding?
Date: Sun, 28 Mar 2004 22:24:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403282224.12071.Antony@Soft-Solutions.co.uk>
References: <20040328155231.32b07799@darna.vectec.net> <200403282154.17071.Antony@Soft-Solutions.co.uk> <20040328170733.23247779@darna.vectec.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040328170733.23247779@darna.vectec.net>
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

On Sunday 28 March 2004 10:07 pm, Cody Harris wrote:

> I rewrote the rules following your suggestions. It still doesn't work:
>
> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
> target     prot opt in     out     source              destination
> ACCEPT     all  --  eth1   any     anywhere             anywhere

Okay, that will allow all packets coming through from eth1

> ACCEPT     tcp  --  any    any     anywhere             192.168.0.2       
> tcp dpt:ssh state RELATED,ESTABLISHED

That will allow packets coming through from 192.168.0.2 (which is plugged in 
to eth1) to destination port 22.

You have no rule to allow the reply packets back (and the above rule won't 
allow the NEW packets through, either).

Try this:

iptables -F FORWARD
iptables -P FORWARD DROP
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -s 192.168.0.2 -p tcp --dport 22 -j ACCEPT

If that doesn't work tell us exactly how you are testing it - which machine is 
the SSH client on, where is the server, what are the IP addresses...

Regards,

Antony.

-- 
It is also possible that putting the birds in a laboratory setting 
inadvertently renders them relatively incompetent.

 - Daniel C Dennet

                                                     Please reply to the list;
                                                           please don't CC me.


