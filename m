From: =?ISO-8859-15?Q?J=F6rg_Sch=FCtter?= <netfilter@schuetter.org>
Subject: Re: voice IP
Date: Mon, 3 Nov 2003 22:38:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031103223834.7e537399.netfilter@schuetter.org>
References: <3FA6B9B8.2040703@adinet.com.uy>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FA6B9B8.2040703@adinet.com.uy>
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

Hallo Manuel,

On Mon, 03 Nov 2003 17:25:28 -0300
Manuel Tato <madness@adinet.com.uy> wrote:

> i have this firewall, i have at 192.168.1.40 a voice ip gateway, i'm=20
> doing portforward to this ip.
> i make phone calls with out major problems, but i can=B4t recive any...
> someone have voip experience trough linux fw/routers?
> thanks in advance
> manuel
>=20
>=20
[...]
> #
> iptables -F
> iptables -t nat -F
> iptables -t mangle -F
> iptables -A INPUT -j ACCEPT
> iptables -A FORWARD -j ACCEPT
> iptables -A OUTPUT -j ACCEPT

after accepting all the traffic (INPUT/FORWARD/OUTPUT) there is no
"need" in adding the following lines regarding the filter table.
[...]


J=F6rg

--=20
J=F6rg Sch=FCtter           http://www.lug-untermain.de/
joerg@schuetter.org     http://www.schuetter.org/joerg/
ICQ: 298982789          http://mypenguin.bei.t-online.de/


