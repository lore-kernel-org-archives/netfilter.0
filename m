From: Mike Dillinger <miked@softtalker.com>
Subject: nftables: Allow NAT Access with Timeout
Date: Wed, 22 Jan 2020 16:01:37 -0800
Message-ID: <d44f6c86-27bf-aff5-4251-b1cbf06de174@softtalker.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I am running nftables 0.9.3 on Debian 10.=A0 Behind the Linux router, I hav=
e multiple clients, mostly Windows.=A0 Some of them would like to run an ap=
plication such as Torrent but I'd like to limit the time that can happen.=
=A0 Ideally, I'd like use use a set within the nat table and have the acces=
s automatically expire after 4 hours.=A0 I have hit a brick wall and I don'=
t see a straightforward way to do this since each nat entry needs a destina=
tion IP, inbound port, and destination port, yet set's only have a single o=
ne of those entries.=A0 I was leaning toward using a set because that's the=
 only entry type that has automatic timeouts as far as I can tell.

Is there a simple way to achieve this, or am I stuck manually adding rules =
and coming back later to manually delete them?

Thank you!
-MikeD
