From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ip/snat + port/dnat
Date: Sun, 9 May 2004 15:27:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405091527.09223.Antony@Soft-Solutions.co.uk>
References: <Pine.LNX.4.44.0405081217430.6314-100000@dns.media-lab.com.pl>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0405081217430.6314-100000@dns.media-lab.com.pl>
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

On Saturday 08 May 2004 11:44 am, R=F3=BFa=F1ski Sergiusz wrote:

> > iptables -A POSTROUTING -t nat -p tcp --dport 2525 -j SNAT --to $extI=
F:25
> >
> > Is that what you wanted?
>
> no, no, this change _source_ port, I need target 'SNAT' and change
> _destination_ port. PC from internal network may connect to ANY smtp
> server in the world (not local smarthost), but must manualy setup
> other port. Examples:
>
> A. Internal network Outlook (192.168.0.5 via Linux 1.2.3.4):
> setup smtp server: 195.205.84.133 port 2525
> - Connection LAN:
>   192.168.0.5:1024 -> 195.205.84.133:2525
> - SNAT+DNAT/PORT Internet:
>   1.2.3.4:65000 -> 195.205.84.133:25
>
> B. Internal network WORM (192.168.0.5 via Linux 1.2.3.4):
> smtp server: 195.205.84.133 port 25
> - Connection LAN:
>   192.168.0.5:1024 -> 195.205.84.133:25
> - DROP

Oh, I see - neat trick :)

Try this:

iptables -A PREROUTING -t nat -p tcp --dport 25 -j DROP
iptables -A PREROUTING -t nat -p tcp --dport 2525 -j DNAT --to :25

I generally advise people *not* to put DROP rules in the nat table, howev=
er=20
here you have an exception which merits this.   If you prefer not to do t=
hat,=20
and would like to DROP packets in FORWARD instead, try this:

iptables -A PREROUTING -t mangle -p tcp --dport 25 -j MARK --set-mark 1
iptables -A PREROUTING -t nat -p tcp --dport 2525 -j DNAT --to :25
iptables -A FORWARD -m mark --mark 1 -j DROP

Regards,

Antony.

--=20
I think, therefore I am.
I'm pink, therefore I'm Spam.
I drink, therefore I think I am.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


