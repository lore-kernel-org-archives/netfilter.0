From: =?UTF-8?Q?=C4=B0brahim_Ercan?= <ibrahim.ercan@engineer.com>
Subject: How to add wildcard netmask to ipset?
Date: Fri, 21 Sep 2012 10:35:19 +0300
Message-ID: <CAK6Qs9=Q4tpOjB6JfcSS3fbnyQdAv_Oqcz4zzqqZx5e10PvrAg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-devel-owner@vger.kernel.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: netfilter-devel@vger.kernel.org

Hello,

We are using ipset and we want to add wildcard netmasks to ipset. We
are using hash:net to store our ips. Ipset does not accept adding
netmasks so when adding a network like 192.168.1.0/255.255.255.0 we
convert it to 192.168.1.0/24 CIDR notation and add. But a network like
192.168.2.0/255.0.255.0 cannot be converted to CIDR nor can be added
to ipset. What can we do?

--=20
=C4=B0brahim Ercan
--
To unsubscribe from this list: send the line "unsubscribe netfilter-dev=
el" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
