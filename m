From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: how to change the tos
Date: Tue, 8 Feb 2005 15:06:32 +0200
Message-ID: <3063e505020805066f0cd28d@mail.gmail.com>
References: <20050208124623.60439.qmail@web54701.mail.yahoo.com>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20050208124623.60439.qmail@web54701.mail.yahoo.com>
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
Content-Type: text/plain; charset="windows-1252"
To: Alaios <alaios@yahoo.com>
Cc: netfilter@lists.netfilter.org

I think you can set only a few values as TOS, 0x0, 0x2, 0x4 and 0x8 .
If you want more, you can use the DSCP target.


On Tue, 8 Feb 2005 04:46:23 -0800 (PST), Alaios <alaios@yahoo.com> wrote:
> Hi i want to apply the patch ftos in order to change
> the tos field in ip packets...
> The problem is that i don't know how to do that
> One guy suggest me the
> http://www.paksecured.com/patches/
> but the patch is for the 2.4 kernel  but i use the
> 2.6.10 kernel.
> In addition to this i have noticed that the 2.6 kernel
> has the following option
> CONFIG_IP_NF_MATCH_TOS
> I don't know if i need to compile it as module or i
> should insert them directly to the kernel...
> Afte recompiling the kernel i have run the make
> KERNEL_DIR=3D/usr/src/linux-2.6.10 but still the command
>=20
> iptables -t mangle -A PREROUTING -i eth0 -p tcp
> --dport 22 -j TOS --set-tos 15
> iptables v1.2.11: Bad TOS Value
> Any suggestion?
>=20
>=20
> __________________________________
> Do you Yahoo!?
> All your favorites on one personal page =E2=80=93 Try My Yahoo!
> http://my.yahoo.com
>=20
>=20


--=20
Bla bla

