From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: source-mac filtering
Date: Mon, 12 Jan 2004 11:06:35 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040112160635.GB8023@cannon.eng.us.uu.net>
References: <Sea1-F167vrztUmdyB400051e33@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Sea1-F167vrztUmdyB400051e33@hotmail.com>
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
To: =?iso-8859-1?Q?H=E5kan?= Engblom <cynic_0@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Sun, Jan 11, 2004 at 06:39:53PM +0100, H=E5kan Engblom wrote:

> Yes, I've come to realize that.
>=20
> Is it technically necessary for the dhcp-server to do so, or could it b=
e=20
> that some other dhcpd behaves different ?

No, isc uses AF_LINK, if avalable.

Ramin

>=20
> A work with test normally, so I don't know very much about the internal=
=20
> structure in Linux.
>=20
> br H=E5kan E.

