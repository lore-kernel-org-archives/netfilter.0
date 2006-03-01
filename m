From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Outgoing port is wrong
Date: Wed, 1 Mar 2006 15:05:39 +0100 (CET)
Message-ID: <62561.193.173.147.3.1141221939.squirrel@webmail.sterenborg.info>
References: <62850.193.173.147.3.1141216557.squirrel@webmail.sterenborg.info>
	<000001c63d2e$ec88b510$7b82a8c0@aladin>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000001c63d2e$ec88b510$7b82a8c0@aladin>
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
To: netfilter@lists.netfilter.org

On Wed, March 1, 2006 13:51, Master wrote:
>> This was working, but the new security of the applications does demand
>> that the services should be able to reinitiate the connection, using t=
he
>> same port as on the way in. So I need to make sure that box1
>> (192.168.1.107:15009) always uses 62.59.197.53:18107 to connect to the
>> outside.
>>
>> How do I setup these rules correctly for in and out going?
>
> Have you looked at "man iptables", the SNAT section ?
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    SNAT
> ....
> It takes one type of option:
>
>        --to-source  ipaddr[-ipaddr][:port-port]
>
> which  can  specify  a  single  new source IP address, an inclusive ran=
ge of
> IP addresses, and optionally, a port range (which is only valid if the =
rule
> also specifies -p tcp  or  -p  udp).
> ....
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> It looks like :
>
> $ipt -A POSTROUTING -s 192.168.1.107 -p tcp --sport 15009 \
>   -j SNAT 65.59.197.53:18107
>
> should do the trick.
>
>
> Gr,
> ROb
>
>
> Hoi Rob,
>
> I have looked it through and many more documents, but still missing
> something.
>
> I used:
> -A POSTROUTING -s 192.168.1.107 -p tcp --sport 15009 \
>   -j SNAT -o eth0 --to 65.59.197.53:18107
>
> Should this be in the 'nat' or 'mangle' part?

You are trying to NAT the connection so that would be the nat table.

> Should I also add an INPUT ACCEPT for 192.168.1.107:15009?

Packets are only going through one filter chain. These are NATed so they =
are
going through the FORWARD chain.

Are these packets dropped or are they NATed differently from what you exp=
ected
? Maybe you can add a logging rule or use tcpdump (et al) to see what is
happening.


Gr,
Rob



