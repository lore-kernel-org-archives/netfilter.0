From: "noa levy" <noalevy@hotmail.com>
Subject: Re: stateful UDP with unknown source port on INPUT?
Date: Sun, 01 Apr 2007 15:39:30 +0300
Message-ID: <BAY121-F1848947AF48B36B0E9D801A9610@phx.gbl>
References: <460C4667.1090406@rtij.nl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <460C4667.1090406@rtij.nl>
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
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: m@rtij.nl
Cc: netfilter@lists.netfilter.org

Thanks!
I forgot to mention, though, that my source port for the SNMP informs is=20
also random, so I can't match against the destination port for the incoming=
=20
packet - does the recent target also maintain a port list or is it IP=20
addresses only?


>From: Martijn Lievaart <m@rtij.nl>
>To: noa levy <noalevy@hotmail.com>
>CC: netfilter@lists.netfilter.org
>Subject: Re: stateful UDP with unknown source port on INPUT?
>Date: Fri, 30 Mar 2007 01:06:15 +0200
>
>noa levy wrote:
>>Hi,
>>I am working on a machine that needs to send SNMP informs, and receive=20
>>ACKs for these informs. I am using iptables as my firewall, and I need to=
=20
>>find a way to open a pinhole for the ACK to get back to me. My problem is=
=20
>>that SNMP informs are sent to a predefined UDP port (162) but the ACKs ar=
e=20
>>returned from a random port.
>>The following rules exist to allow established UDP sessions:
>>iptables -A INPUT-p udp -m state =96state ESTABLISHED -j ACCEPT
>>iptables -A OUTPUT -p udp -m state =96state NEW,ESTABLISHED -j ACCEPT
>>
>>My problem is that, since the source port of the ACK is a random one, the=
=20
>>ACKs are dropped. Is there a way to allow all incoming UDP packets with a=
n=20
>>unknown source port and an established dest port?
>
>Not directly, but you could use the recent match for this. On outgoing=20
>requests, add the IP to the recent set. On incoming packets, first match o=
n=20
>the destination port, then match on recent to see if the IP had an recent =

>outgoing request.
>
>I use a similar strategy to reject (instead of drop) indent queries from=20
>hosts I made a tcp connection to and that works, so this should to.
>
>HTH,
>M4
>

_________________________________________________________________
Don't just search. Find. Check out the new MSN Search!=20
http://search.msn.com/


