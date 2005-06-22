From: Christian Theil <christiantheilhave@gmail.com>
Subject: Re: lib ipq
Date: Wed, 22 Jun 2005 11:28:02 +0000
Message-ID: <33d4ee94050622042852fa791e@mail.gmail.com>
References: <a9c045eb041223112937739d16@mail.gmail.com>
	<a9c045eb0506211307394ee574@mail.gmail.com>
Reply-To: Christian Theil <christiantheilhave@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a9c045eb0506211307394ee574@mail.gmail.com>
Content-Disposition: inline
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

You could probably mark the packet using the nfmark field of the skb.=20

If you are doing this with iptables, use the -j MARK target to do
this; something
ala this:
iptables -A OUTPUT -t mangle -i eth0  -j MARK --set-mark 42

Make sure you do this before you queue the packet to userspace.

Regards,
Christian Theil Have.

If you need to do this from userspace with iptables probably
On 6/21/05, Unix User <kerneland@gmail.com> wrote:
> hi all
> I use the lib ipq.  I want to know how one can make the difference
> between an outgoing and incoming packets with the lib ipq .  I queued
> incoming and outgoing packets .
> i use the packet information to look at the tcp/ip headers and check the =
ip
> addresses to see if it is incoming or outgoing but it doesnt work if
> the localhost send a packet at his self (ex : source adress: 127.0.0.1
> , dest adress: 127.0.0.1).
>=20
> how can i make the difference ?
>=20
> sorry for my bad english :)
>=20
>

