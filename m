From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Check connection state in libipq hook
Date: Mon, 18 Jun 2007 21:20:13 +0200
Message-ID: <4676DAED.1050003@netfilter.org>
References: <20070618161548.120li24u9dcsok0k@webmail.microgate.fr>	<4676CBB7.4080808@netfilter.org>
	<20070618202242.wa8gjjs892ysg0w8@webmail.microgate.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070618202242.wa8gjjs892ysg0w8@webmail.microgate.fr>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: switcher <switcher@linuxwall.info>
Cc: netfilter@lists.netfilter.org

switcher wrote:
> Pablo Neira Ayuso <pablo@netfilter.org> a =E9crit :
>> Misconception: The connection tracking is a kernel module. libipq is=20
>> a userspace library. You can't invoke such functions from userspace.
>=20
> Errr...
> So, do you know another technique that I can use to do so in userspace ?
> I could maintain a connection state table in userspace but I think it's=20
> a waste of time to redo netfilter's job...

Well, it depends on what you want to do. Anyway, you may also use=20
libnetfilter_conntrack to listen to conntrack events. BTW, libipq has=20
been superseded by libnetfilter_queue and the NFQUEUE target.

--=20
The dawn of the fourth age of Linux firewalling is coming; a time of=20
great struggle and heroic deeds -- J.Kadlecsik got inspired by J.Morris

