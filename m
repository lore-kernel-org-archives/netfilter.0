From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: conntrack mysql database. Plausible?
Date: Wed, 7 Nov 2012 15:11:18 -0200
Message-ID: <20121107151118.1976dd3f@pulsar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hi All

Is it possible to (or how to) maintain a mysql database with the assured
connections' time range?

Something like: time ASSURE'd, time DESTROYed, and the 5'tuple IPs dst and
src, ports dst and src and protocol.

Have you guys seem something like this?

This would be useful to point out which clients behind a NAT accessed in
the last few days.

Regards
Ethy
