From: "ArioS" <christian@wanxp.net>
Subject: Re: bridge + transparent proxy
Date: Tue, 24 Aug 2004 20:13:39 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002201c489dc$2c8f8470$fd14a8c0@wanxpr3yianevq>
References: <D5C9032B2B09C64EA2409D6214E91AC90512BF@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

i tried it and it seems not work.... :)
i`m googling and found this site http://ebtables.sourceforge.net/
has anyone tried this before ? maybe can share ur experience :)


Regards,


Kristian
----- Original Message -----
From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, August 24, 2004 7:28 PM
Subject: RE: bridge + transparent proxy


> hi all , i`m running linux kernel 2.4.20 with bridge installed (2 eth)..
the
> bridge works nice and i can block any traffic that i want
> the problem is i can`t do tranparent proxy , i tried using
>
> iptables -A PREROUTING -t nat -p tcp --dport 80 -j DNAT --to $myproxy:3128
>
> and it didn`t work... my bridge didn`t get any incoming traffic from
client
> to port 80 or 3128....
> is it because bridge only run in layer 1 or something else ? sorry for my
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



