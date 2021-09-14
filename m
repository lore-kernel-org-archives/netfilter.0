From: Florian Westphal <fw@strlen.de>
Subject: Re: Haproxy's "send-proxy-v2" =?utf-8?Q?do?=
 =?utf-8?B?ZXNu4oCZdA==?= work when conntrack is disabled
Date: Tue, 14 Sep 2021 16:30:23 +0200
Message-ID: <20210914143023.GC25110@breakpoint.cc>
References: <e15f6ae7-2a80-3dc2-2092-b59312a6e2cb@internetx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e15f6ae7-2a80-3dc2-2092-b59312a6e2cb@internetx.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: InterNetX - Marc Reymann <marc.reymann@internetx.com>
Cc: netfilter@vger.kernel.org

InterNetX - Marc Reymann <marc.reymann@internetx.com> wrote:
> Haproxy and our Proxy app are running on the same server. Haproxy sends
> requests to the Proxy app via the proxy prototcol:
>=20
> listen web_proxy_app
>         bind *:443 ssl crt /etc/ssl/our-certs no-sslv3
>         server proxy-app /tmp/proxy.sock send-proxy-v2
>=20
> As soon as we exclude port 443 from the conntrack table via nft like this:
>=20
> chain PREROUTING_NOTRACK {
>         type filter hook prerouting priority -300 policy accept
>         iif VLAN1012 tcp dport { 80, 443 } notrack
>=20
> the proxy app doesn=E2=80=99t receive the correct IP values:
>=20
> -   Proxy          2 123.123.129.3 57893 234.236.46.5 443   <--- before,
> good
> -   Proxy          2 123.123.129.3 58217 123.123.129.3  58217  <--- after,
> bad
>=20
> Somehow the destination IP and port information gets lost.

<wild guess> "app" uses getsockopt SO_ORIGINAL_DST to fetch the
destination address and has no error handling for this.

Really, no idea.  How does the application obtain those addresses?
