From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: owner module
Date: Mon, 9 Aug 2004 17:27:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408091727.30522.Antony@Soft-Solutions.co.uk>
References: <20906.1092067633@www24.gmx.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20906.1092067633@www24.gmx.net>
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

On Monday 09 August 2004 5:07 pm, Daniel Boy wrote:

> Hello,
>
> I try to implement the command "--cmd-owner" for some
> services in the "filter" table.
>
> When I do so the corresponding services do not terminate
> correctly any more.
>
> For example I opened an SSH connection and terminated
> it after the successful login with the "logout" command.
> Afterwards on the servers side "ps" and "netstat" says
> the connection is still alive. On the client side
> "netstat" says "FIN ACK", "LAST ACK", "CLOSING" and I get
> some log entries in "messages".

FIN ACK will be from client -> server (because the client is terminating the 
connection).

LAST ACK is either from server to client (so the server has agreed the 
connection is ending) or else from client to server (in response to a FIN ACK 
from the server, again proving that the server wants to terminate the 
connection).

The output from ethereal would be useful, so we can see a packet trace of 
exactly what goes in which direction.

> The necessary iptables-rules at client-side:
>
> iptables -A OUTPUT -m owner --cmd-owner "ssh" -p tcp -s CLIENT -d SERVER
> --sport 1024:65535 --dport 22 -j ACCEPT

Personally I would omit the "-s CLIENT" and "--sport 1024:65535" from the 
above.

> iptables -A INPUT -p tcp -s SERVER -d CLIENT --sport 22 --dport 1024:65535
> -j ACCEPT

Why do you have a "--sport 22" rule in INPUT instead of just allowing "-m 
state --state ESTABLISHED" packets?

> Some of the drop-log entries at client-side:

It would be helpful to see the rest of your ruleset, including the details of 
your "drop-log" rules, so we know how they fit in with the two rules you have 
told us above.

> Aug  9 15:29:54 CLIENT kernel: DROP IN= OUT=eth0 SRC=CLIENT DST=SERVER
> LEN=52 TOS=0x10 PREC=0x00 TTL=64 ID=129 DF PROTO=TCP SPT=33442 DPT=22
> WINDOW=24752 RES=0x00 ACK URGP=0
> Aug  9 15:29:55 CLIENT kernel: DROP IN= OUT=eth0 SRC=CLIENT DST=SERVER
> LEN=52 TOS=0x10 PREC=0x00 TTL=64 ID=130 DF PROTO=TCP SPT=33442 DPT=22
> WINDOW=24752 RES=0x00 ACK URGP=0
> Aug  9 15:29:55 CLIENT kernel: DROP IN= OUT=eth0 SRC=CLIENT DST=SERVER
> LEN=52 TOS=0x10 PREC=0x00 TTL=64 ID=131 DF PROTO=TCP SPT=33442 DPT=22
> WINDOW=24752 RES=0x00 ACK URGP=0
>
> So I would say the boolean #--cmd-owner "ssh"# is immediately
> invalid. So the client cannot inform the server about the closing.

How about testing this with a LOG rule using the "-m owner" match, so that you 
have some other rule allowing the packets, and you just LOG the ones which 
match the owner test, to see whether it logs what you expect?

Regards,

Antony.

-- 
Most people have more than the average number of legs.

                                                     Please reply to the list;
                                                           please don't CC me.


