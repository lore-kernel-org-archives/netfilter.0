From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPtables and DDclient
Date: Fri, 27 Sep 2002 22:44:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020927214402.UJBU13996.mta05-svc.ntlworld.com@there>
References: <000801c26504$df5d3f60$0401a8c0@crazymother>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000801c26504$df5d3f60$0401a8c0@crazymother>
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

On Thursday 26 September 2002 3:31 am, Marc-Andr=E9 Boulais wrote:

> hi, I am currently looking for a way to let "ddclient" ( IP updater progr=
am
> ) pass through iptables. I was first looking for the ports involved with =
it
> but I can't seem to find any info on that.
>
> If you know how I could build a rule to let it pass through ( cuz right
> now, it is blocked ) iptables. Please let me know.

I do not know what ddclient is, however you can find out what sort of packe=
ts=20
it uses by putting a LOGging rule at the end of your FORWARD chain, just=20
before you throw all the remaining packets away with the default DROP polic=
y:

iptables -A FORWARD -j LOG --log-prefix "Forward block "

This is assuming, of course, that you're trying to send ddclient *through* =

the firewall, and not from it or to it (in which case you'd want to LOG the=
=20
packets in the OUTPUT or INPUT chains).

Once you've seen what sort of packets it's using, you can add the appropria=
te=20
rules to let it through...


Antony.

--=20

All matter in the Universe can be placed into one of two categories:

1. things which need to be fixed
2. things which will need to be fixed once you've had a few minutes to play=
=20
with them

