From: Frank Wunderlich <frank-w@public-files.de>
Subject: Flowtable with ppp/bridge
Date: Mon, 26 Apr 2021 17:30:47 +0200
Message-ID: <16CF72C8-335A-48D2-BA6F-FF632735DCFD@public-files.de>
Reply-To: frank-w@public-files.de
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1619451052;
        bh=63Z/oCDVAITePu3EtlJbRzOUJ65AIfbfkqRBbge7zFo=;
        h=X-UI-Sender-Class:Date:Subject:Reply-to:To:From;
        b=FIGkbw8FpL/DP2nIajqXMXwJX6O4t1wtqUbRqXMIH5KAnVWk3j2UR89zdoB/iymB4
         cqubAajzUYwzBoEJSZQe9sZINoPiOcNVqoKodwEu08lKmbA6n4QhmnaGfLKwH7iIIY
         16ynoSdmnT+geI3vvdd87nAUKoomaSqw81Uk1wuU=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,
I try to setup a flowtable for use with ppp(oe) and bridge interface=2E

http://forum=2Ebanana-pi=2Eorg/t/new-netfilter-flow-table-based-hnat/12049=
/60?u=3Dfrank-w

table ip filter {
flowtable ft {
hook ingress priority 10;
devices =3D {"ppp8","lanbr0"};
flags offload
}

I cannot get nft (0=2E9=2E8) apply this

Any idea? Is there a kernel option or something in nft missing?
regards Frank
