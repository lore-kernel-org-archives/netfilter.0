From: "Hard__warE" <hard__ware@hotmail.com>
Subject: SNAT of ICMP fragmentation-nee
Date: Mon, 10 Jun 2002 22:56:32 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <000501c2107e$3ed0f300$7b0010ac@dynamicaccess.lan>
Reply-To: "Hard__warE" <hard__ware@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

> iptables -I POSTROUTING  -t nat -p icmp --icmp-type \
> fragmentation-needed -j LOG --log-prefix "icmp SNAT POST "
>
> iptables -I PREROUTING -t mangle  -p icmp --icmp-type \
> fragmentation-needed -j LOG --log-prefix "icmp SNAT PRE "
>

do you need to log all interfaces / chains

or a particular adapter ????

ok have you tried using this instead

$IPTABLES -t nat -A POSTROUTING -p icmp --icmp-type \
fragmentation-needed -j LOG --log-prefix "icmp SNAT POST "

$IPTABLES -t nat -A PREROUTING -p icmp --icmp-type \
fragmentation-needed -j LOG --log-prefix "icmp SNAT PRE "

....

oh and this one is for

Antony Stone ... :D ... Gday ..

>Hmmm.   Okay - this is beyond my understanding of netfilter - can anyone
else
>suggest why icmp packets going through the machine would get logged and
>processed by PREROUTING and FORWARD but not by POSTROUTING ?

i have tested this with ICMP and it iz very true ...

It seems as if the IPtables Box handles the actuall ICMP traffic locally

So a box on the local lan can ping someone on the net and in your

POSTROUTING Stage the packets arnt logged ...

packets may flow through the actuall Theroy of Prerouting ---> Forward -->
Postrouting

and actually not go through the Postrouting stage ...

I found by using IP alias's and a few modifications to your IPTables script
you can acheive alot of

things that are thought to be not possible .... :D .. hehhe







