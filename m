From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: help...
Date: Wed, 17 Dec 2003 18:22:21 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312171822.21343.Antony@Soft-Solutions.co.uk>
References: <000801c3c291$db2de390$6400a8c0@stillnickcomp1> <00df01c3c4c8$ed220980$7000a80a@melita.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00df01c3c4c8$ed220980$7000a80a@melita.com>
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

On Wednesday 17 December 2003 6:09 pm, Ian Hunter wrote:

> Start off by giving us your existing rules?
> ----- Original Message -----
> From: "Cristiano Soares" <stillnick@terra.com.br>
> To: <netfilter@lists.netfilter.org>
> Sent: Sunday, December 14, 2003 5:30 PM
> Subject: help...
>
> Hi, i would like to know if u guys could help me with a simple problem that
> im having trying to set up a network server. I have DSL conection and im
> sharing it with a network. I had set up the DHCPD server, all the DHCP
> clients in my network can receive an IP from the server, but they cant
> browse. I know that there as some lines that i have to set up to make de
> server allow the clients to browser normaly. and i also know that it has
> something to do with iptables, and maskarading. Please, i need help doing
> this. I have MSN and ICQ if anyone would like to help me. I have SSH server
> running also. please, please, i need help. Thanks a lot.

Sounds like this guy simply needs to know:

iptables -A POSTROUTING -o $EXTIF -j MASQUERADE
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT

If that doesn't do the trick then yes, post your existing ruleset and tell us 
what works and what doesn't (and how you're testing it).

Antony.

-- 
Abandon hope, all ye who enter here.
You'll feel much better about things once you do.

                                                     Please reply to the list;
                                                           please don't CC me.


