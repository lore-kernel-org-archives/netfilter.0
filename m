From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: iptables ROUTE target
Date: Sun, 26 Jun 2005 13:42:08 +0300
Message-ID: <3063e505062603425d055f38@mail.gmail.com>
References: <3f3cb3f205062523401dfb411f@mail.gmail.com>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3f3cb3f205062523401dfb411f@mail.gmail.com>
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
To: Maya Zimerman <maya.zimerman@gmail.com>
Cc: netfilter@lists.netfilter.org

I can't remember exactly, but i think the kernel headers for this
target miss some struct declarations. If you get incomplete type for
some structs, get them from iptables sources (after you patch them
with pom-ng) and add those structs in .h files included in the .c file
which gives errors.

On 6/26/05, Maya Zimerman <maya.zimerman@gmail.com> wrote:
> Hi,
> I have noticed that the ROUTE target is experimental. However |I would
> like to use it. There seem to be some header files missing. Does
> anyone know when the complete code can be found?
>=20
> Thanks
> Maya
>=20
>=20


--=20
Bla bla

