From: Martijn Lievaart <m@rtij.nl>
Subject: Re: stateful UDP with unknown source port on INPUT?
Date: Fri, 30 Mar 2007 01:06:15 +0200
Message-ID: <460C4667.1090406@rtij.nl>
References: <BAY121-F279EE21E84B52D2FA87CB1A9740@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY121-F279EE21E84B52D2FA87CB1A9740@phx.gbl>
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
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: noa levy <noalevy@hotmail.com>
Cc: netfilter@lists.netfilter.org

noa levy wrote:
> Hi,
> I am working on a machine that needs to send SNMP informs, and receive=
 
> ACKs for these informs. I am using iptables as my firewall, and I need=
 
> to find a way to open a pinhole for the ACK to get back to me. My 
> problem is that SNMP informs are sent to a predefined UDP port (162) 
> but the ACKs are returned from a random port.
> The following rules exist to allow established UDP sessions:
> iptables -A INPUT-p udp -m state =96state ESTABLISHED -j ACCEPT
> iptables -A OUTPUT -p udp -m state =96state NEW,ESTABLISHED -j ACCEPT
>
> My problem is that, since the source port of the ACK is a random one, 
> the ACKs are dropped. Is there a way to allow all incoming UDP packets=
 
> with an unknown source port and an established dest port?

Not directly, but you could use the recent match for this. On outgoing 
requests, add the IP to the recent set. On incoming packets, first match=
 
on the destination port, then match on recent to see if the IP had an 
recent outgoing request.

I use a similar strategy to reject (instead of drop) indent queries from=
 
hosts I made a tcp connection to and that works, so this should to.

HTH,
M4


