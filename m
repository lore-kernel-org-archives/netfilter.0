From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: "No Route: Rusty's brain broke" ??????
Date: Tue, 7 Sep 2004 10:45:46 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF56794DF@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: dravya <dravya@magma.ca>, Netfilter mailing list <netfilter@lists.netfilter.org>

dravya wrote:
> Hi all,
>=20
> I have two ppp connections setup and I want access the internet via
> these links.... However, I get the error message "kernel: No Route:
> Rusty's brain broke".=20
>=20
> Is there a patch associated with this.... or can you suggest any
> fixes...=20
>=20
> Why would something like this happen??? Is this a problem with the
> ipt_MASQUERADE.c code???=20
>=20
> any tips or suggestions are much appreciated.
>=20
> Thanks
>=20
> Dravya

Read the long thread in the development archives from last week or the
week before. There's two fighting opinions as to what should be done
about this. Its pretty technical and there isn't a patch available to my
knowledge. I know Herald Welte might be able to help if he's willing.

