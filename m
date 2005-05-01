From: Askar <askarali@gmail.com>
Subject: Re: DNS rules
Date: Sun, 1 May 2005 14:52:09 +0500
Message-ID: <a0f69e50505010252180ba805@mail.gmail.com>
References: <911ce5913bf2.913bf2911ce5@vsnl.net>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <911ce5913bf2.913bf2911ce5@vsnl.net>
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
To: "varun_saa@vsnl.net" <varun_saa@vsnl.net>
Cc: netfilter@lists.netfilter.org

Again it depends, how you setup your default policies. In case you are
using recommended "default DROP" then you have to tell iptables to
allow "udp 53" towards your ISP.

iptables -A FORWARD -p udp --dport 53 -j ACCEPT


If you are running a small LAN then running a cache only dns on your
gateway would be beneficial, (that it will cache the lookups)

dnsmasq is excellent cache only dns server and i'm sure you would get
is running within 10 minutes.
you can also use bind in cache only mode.

regards

Askar Ali
On 5/1/05, varun_saa@vsnl.net <varun_saa@vsnl.net> wrote:
> Hello,
>      My server is on Mandriva 10.1
> eth0 is WAN with static IP connected to 512K DSL
> eth1 is LAN - 192.168.0.0/24 and 192.168.21.0/24
>=20
> I have 2 DNS provided by the ISP.
>=20
> Is it usefull to have rules for DNS included
> in the iptables ?
>=20
> Thanks
>=20
> Varun
>=20
>=20


--=20
I love deadlines. I like the whooshing sound they make as they fly by.
Douglas Adams

