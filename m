From: Michal Kepien <lordpopcorn@poczta.onet.pl>
Subject: Re: Firewall Setup on RH 9
Date: Sat, 05 Jul 2003 09:30:23 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0gvcgvc3jjvjmlog4a49p0lgosd9g9702c@4ax.com>
References: <016201c33fa7$5c755eb0$660210ac@christo> <n6tbgvkvn94tuq3f8m01d5rah2n97tgnol@4ax.com> <1057383324.2821.34.camel@alpha.newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1057383324.2821.34.camel@alpha.newkirk.us>
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
To: Joel Newkirk <netfilter@newkirk.us>
Cc: netfilter@lists.netfilter.org

>As I suspected from your misconception about forwarded traffic, you're=20
>an ipchains veteran... ;^)

Wow, thanks for the 'veteran' part :D Actually, I'm quite a newbie up
here, but you're right, I _was_ using ipchains as I was quite unaware
that it isn't the up-to-date tool to administer IP MASQ. However, the
scheme I included in the previous post was taken from the Linux IP
Masquerade HOWTO:

http://www.ibiblio.org/pub/Linux/docs/HOWTO/other-formats/html_single/IP-=
Masquerade-HOWTO.html#RC.FIREWALL-2.4.X-STRONGER

(quite long, sorry :)

>With iptables FORWARD traffic never touches the INPUT or OUTPUT chains,
>those are explicitly for INPUT and OUTPUT to and from the box itself.

I'm using the configuration I presented in the post and it works OK.
However, if you know an easier way to achieve the same goal, please
let me know :)

Below I attach my conception of packet traffic - it is taken from the
Linux IPCHAINS HOWTO, so it may be _not_ up-to-date. If the way
packets are treated changed in iptables, please tell me how.

|        ----------------------------------------------------------------
|        |            ACCEPT/                              lo interface |
|        v           REDIRECT                  _______                  |
|--> C --> S --> ______ --> D --> ~~~~~~~~ -->|forward|----> _______ -->=20
|    h     a    |input |    e    {Routing }   |Chain  |     |output =
|ACCEPT
|    e     n    |Chain |    m    {Decision}   |_______| --->|Chain  |
|    c     i    |______|    a     ~~~~~~~~        |     | ->|_______|
|    k     t       |        s       |             |     | |     |   =20
|    s     y       |        q       |             v     | |     |   =20
|    u     |       v        e       v            DENY/  | |     v   =20
|    m     |     DENY/      r   Local Process   REJECT  | |   DENY/
|    |     v    REJECT      a       |                   | |  REJECT
|    |   DENY               d       --------------------- |=20
|    v                      e -----------------------------
|   DENY                             =20

(i had to include pipes at the left to cheat line wrapping)

Michal Kepien

