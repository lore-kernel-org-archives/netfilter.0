From: Eric Leblond <eleblond@init-sys.com>
Subject: Re: Iptables bandwidth limit
Date: 20 Sep 2002 14:07:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1032523652.25927.16.camel@tech004>
References: <Pine.LNX.4.33.0209201316530.2343-100000@ns1.tegbrink.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0209201316530.2343-100000@ns1.tegbrink.com>
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
To: netfilter@lists.netfilter.org

On Fri, 2002-09-20 at 13:17, Daniel Cohen wrote:
> Is it possible to set a bandwidth limit with IPTABLES. Lets say for
> instance that 10.1.204.49/32 should have maximum 100k speed to 10.1.10.30=
.
>=20
> Can iptables fix this?

You can almost do this with the limit module, but you should better use
HTB or CBQ (QOS) which are really done for this.

BR,
--=20
=C9ric Leblond
courriel : eleblond@init-sys.com


