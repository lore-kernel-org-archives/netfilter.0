From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: rp-l2tpd iptables and rh9 but no google
Date: Mon, 28 Jul 2003 16:30:39 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307282031.h6SKVejX019011@discmail.com>
References: <HBELLDKFGOFPEHBLCFCLGECBCCAA.rverduij@dds.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <HBELLDKFGOFPEHBLCFCLGECBCCAA.rverduij@dds.nl>
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
To: 'Rob Verduijn' <rverduij@dds.nl>, netfilter@lists.netfilter.org

I had a funky issue that was similar and it turned out that I had the =
wrong
subnet mask on my internet interface.  Coincidentally, my network also
started with 64. (I think) - the same as google; but because my subnet =
mask
was wrong, I could not see google!


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Rob Verduijn
Sent: Monday, July 28, 2003 4:19 PM
To: netfilter@lists.netfilter.org

Hi again,

I've set my MTU on eth0 eth1 and ppp0 to 1472
Ive been playing around with tcpdump
I gave the following command
tcpdump -i ppp0 -w dumptcp
When I surf to www.redhat.com everything goes wel and I get all kinda =
output
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





