From: "Rob Verduijn" <rverduij@dds.nl>
Subject: RE: rp-l2tpd iptables and rh9 but no google
Date: Mon, 28 Jul 2003 22:18:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <HBELLDKFGOFPEHBLCFCLGECBCCAA.rverduij@dds.nl>
References: <1058557759.16546.2.camel@porky>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1058557759.16546.2.camel@porky>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi again,

I've set my MTU on eth0 eth1 and ppp0 to 1472
Ive been playing around with tcpdump
I gave the following command
tcpdump -i ppp0 -w dumptcp
When I surf to www.redhat.com everything goes wel and I get all kinda out=
put
in my file
But when I surf to google I get nothing, no output whatsoever.
Did I give in the wrong syntax?

Regards
Rob



-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Eric Leblond
Sent: vrijdag 18 juli 2003 21:49
To: netfilter@lists.netfilter.org
Subject: Re: rp-l2tpd iptables and rh9 but no google


Le ven 18/07/2003 =E0 21:01, Rob Verduijn a =E9crit :
> Hi there,
>
> I've got this curious problem with netfilter.

> I did
> echo 1 > /proc/sys/net/ipv4/ip_forward

>
> I can ping google so icmp seems to work but I can't surf the web for
google.
> Neither windows nor linux will work.

You may have look to the MTU, with encapsulation in L2TP you loose some
bytes.
To test try increase your ping size with the -s option.

If it is working with -s 1500 then try to look at tcpmss.

BR,
--
Eric Leblond <eric@regit.org>



