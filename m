From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: Simple question (nfcan: addressed to exclusive sender for this address)
Date: Wed, 5 May 2004 12:35:29 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040505163529.GA27677@salty>
References: <001501c432b5$7a5c5f80$a704a8c0@mpro4167>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <001501c432b5$7a5c5f80$a704a8c0@mpro4167> (from +nfcan+jimlaur+47365373fb.omagrane#mediapro.es@spamgourmet.com on Wed, May 05, 2004 at 11:27:23 -0400)
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On 2004.05.05 11:27, Oriol Magran=E9  - omagrane@mediapro.es =20
wrote:
>=20
>     Hello!
>     Just one question...
>     I have a firewall with the INPUT, OUTPUT and FORWARD
> policies set to DROP, and now I want to allow connections
> from localhost to localhost (any port). Which chains are
> implied here? INPUT? OUTPUT? Both?
>     How should the needed rule(s) be?
>=20
>     Thank you very much in advance!
>=20
>     Oriol
>=20
>
I put these simple rules in my INPUT and OUTPUT chains.
I checked the counts, and these handle the most traffic,
so I put them first in their chains.

# accept packets originating on this machine
iptables -A INPUT -i lo -j ACCEPT

# allow packets from this machine to this machine
iptables -A INPUT -o lo -j ACCEPT

I hope that helps.

Jim


