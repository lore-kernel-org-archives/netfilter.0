From: Justin Schoeman <justin@expertron.co.za>
Subject: Re: "beep" on match
Date: Tue, 07 Nov 2006 08:51:50 +0200
Message-ID: <45502D05.1050807@expertron.co.za>
References: <454FB587.9010806@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <454FB587.9010806@gmx.de>
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
To: Erik Alberti <erik.alberti@gmx.de>
Cc: netfilter@lists.netfilter.org

I doubt you will ever be able to do that directly, but it should be no=20
problem to make a simple application using lipipulog, and

iptables ... -j ULOG

So the iptables match sends the packet to the userspace logging daemon,=20
which then does the 'beep'.  Could even use the --ulog-prefix option to=20
specify the text of the command to execute...

-justin

Erik Alberti wrote:
> Hallo!
>=20
> Ich suche nach einer M=F6glichkeit ein externes Programm bei einem matc=
h
> einer Regel auszuf=FChren. Beispiel:
>=20
>   iptables ... -j exec("/usr/bin/beep -f 5000 -l 1000")
>=20
> -----------------------------------------------------------------------=
-
>=20
> Hello!
>=20
> I am looking for a possibility of executing an external program in the
> field of a match of a rule. Example:
>=20
>   iptables ... -j exec("/usr/bin/beep -f 5000 -l 1000")
>=20
>=20
> Erik
>=20


