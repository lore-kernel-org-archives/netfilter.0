From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: layer7 problem
Date: Wed, 24 Aug 2005 12:27:31 +0200
Message-ID: <430C4B93.3080009@mnemon.de>
References: <430BC558.8000406@telefonica.net> <430C3676.30904@mnemon.de>
	<430C3E1E.6060703@telefonica.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <430C3E1E.6060703@telefonica.net>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Antonio P=E9rez schrieb:
> Hi Joerg,
>=20
> Thanks for your reply, I also tried PREROUTING and also many different
> protocols, not only http and the problem remains the same, everything
> seems to work properly, no errors, but the number of marked packets
> remains empty.
> Any idea will be apreciated, thanks.

Could you please post the output of iptables-save ? I assume, that some
other rules are the culprit ;)

Have a nice time,

Joerg

