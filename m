From: Arkadiusz Miskiewicz <arekm@pld-linux.org>
Subject: Re: -m string  and RELATED
Date: 04 Nov 2002 13:25:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <873cqhttby.fsf@arm.t19.ds.pwr.wroc.pl>
References: <87znsptzey.fsf@arm.t19.ds.pwr.wroc.pl>
	<1036406552.8844.47.camel@elendil>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1036406552.8844.47.camel@elendil>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.samba.org

--=-=-=
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

Cedric Blancher <blancher@cartel-securite.fr> writes:

> I do not see your problem. You want to log packets that :
> 	. contains string "xyztest"
> 	AND
> 	. are NEW, ESTABLISHED or RELATED
>=20
> The first packet logued matches, but not the second as it does not
> contains string "xyztest".
>=20
> So, WTF ? :)))
I was thinking about other packets as related to this one with ,,xyztest''
in it because they all come from the same connection.

> If you want to log the whole session that follows a packet containing
> string "xyztest", then it will be a little more tricky. You have to use
> the patch-o-matic CONNMARK patch (extra section) which provides a target
> to set per connection mark, and a connmark match to match against it.
Nice, thanks. That should do it.

> C=E9dric Blancher  <blancher@cartel-securite.fr>

--=-=-=
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: quoted-printable


--=20
Arkadiusz Mi=B6kiewicz    CS at FoE, Wroclaw University of Technology
arekm@sse.pl   AM2-6BONE, 1024/3DB19BBD, arekm(at)ircnet, PLD/Linux

--=-=-=--

