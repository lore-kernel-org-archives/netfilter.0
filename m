From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: bridge + transparent proxy
Date: Tue, 24 Aug 2004 08:28:53 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512BF@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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

> hi all , i`m running linux kernel 2.4.20 with bridge installed (2 =
eth).. the
> bridge works nice and i can block any traffic that i want
> the problem is i can`t do tranparent proxy , i tried using
>
> iptables -A PREROUTING -t nat -p tcp --dport 80 -j DNAT --to =
$myproxy:3128
>
> and it didn`t work... my bridge didn`t get any incoming traffic from =
client
> to port 80 or 3128....
> is it because bridge only run in layer 1 or something else ? sorry for =
my
> dumb question :)
> any idea ?
>
> Regards,
>
>
> Kristian

try:  http://en.tldp.org/HOWTO/TransparentProxy-7.html

and for what it's worth--bridges are layer 2.

-j

