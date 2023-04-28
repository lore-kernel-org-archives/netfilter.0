From: Glen Huang <heyhgl@gmail.com>
Subject: Possible to check if ip daddr belongs to an interface in the
 prerouting chain?
Date: Fri, 28 Apr 2023 11:58:51 +0800
Message-ID: <D797AC4D-8B12-4F80-8C82-1591C3658D0B@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682654335; x=1685246335;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9RcOcwHZxmTKXgAUOQ/I59nBX1fsM9aBC++VdNhXx90=;
        b=d7d9t1O4bMbUkGHzXK0jqKygjDegYRIWnATnipU62Jazhu2AYrGQdwQeruvQGWOwtt
         Zue2G8/4Ev+geRMEKMwoEno6SzIjn8dAw9P3JIdv0EAWCbwkrrmRIQ29C4RsbQ8zpnQa
         6//+3juIeKQfbP8231ucq8Ef2f0fdFX1EGZYeAp25dxrmLJjIdSsVmlE7UP43+O9QcWf
         uvJYGip1DmsuIhs5gE4SKSqxKlyQ1hG3leDrOcBPCsZlgw6qV7iEah4nY33ZLSKB0hjw
         /xGYhgVOXD7X7N/Rr7N9b2S3lajZ2ZJ267WXreS9bxagAK89KXlgTFm+Z4k1Q9sDFM6l
         bN3Q==
Sender: Glen Huang <hey.hgl@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Hi,

I use tproxy to redirect all traffic from the lan interface, but I want =
to exemplify traffic whose destination IP belongs to the wan interface. =
I wonder if it=E2=80=99s possible to specify if ip daddr matches the wan =
interface IP in the prerouting chain?

The only solution I can think of right now, is to create a set, and =
manually update the set with wan IPs (also whenever they change), which =
is very cumbersome.=20

I wonder if there is a direct way to that in nft?

I use nft1.0.7 with kernel 5.15.108=
