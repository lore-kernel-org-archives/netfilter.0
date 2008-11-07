From: "Henrique Netfilter" <henrique.netfilter@gmail.com>
Subject: Redirect back to internal network
Date: Fri, 7 Nov 2008 15:06:02 -0200
Message-ID: <ebccda510811070906s62a2619di8a8d54dc4b3b9f9e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=U+NScpBX5vpZop83M9E/9QLbjSkH1iCHkJ9Cs+LGfBY=;
        b=kPxlJok2hbYqp/eBW16JuJzuPEidYa+AzUUDYGx/4DyYRZLb7yID5LyAzHTpc6QOn+
         5d1njWWnLYtUHjUFhcjtttjMJFQX/G/3D7GxkrcAR/EBuULJZ2gdVjVU8XrdxTMbcMaq
         ptOHPS58UFBFUe9jlonyQsYp26N2mgQCabR28=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="johab"
To: netfilter@vger.kernel.org

Good afternoon,

I=B4m trying to redirect connections to an external address back to an
internal address, like this:

A =3D Any internal machine (192.168.X.X)
B =3D Internal Server           (192.168.X.4)
C =3D Firewall Internal Address     (192.168.X.1)
D =3D Firewall External Address    (10.X.X.1)
E =3D Router Internal Address       (10.X.X.10)
=46 =3D Router Internet Address       (YYY.YY.Y.YY)


A =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> |            |
 |            |
                                        | C      D |
----------------------------------- | E      F |
B <=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D |            |
 |            |

I want, when machines A asks for port 80 in F, the firewall (iptables)
C/D redirects it back to B (access must not be done using a proxy).

Here=B4s what I=B4ve tried:

-A PREROUTING -s 192.168.X.X -d YYY.YY.Y.YY -p tcp -m tcp --dport 80
-j DNAT --to-destination 192.168.X.4

Checked TCPDump, and here=B4s what I=B4ve got:

IP 192.168.X.X.1365 > 192.168.X.4.80
IP 10.X.X.1.4972 > 192.168.X.4.80
IP 192.168.X.4.80 > 10.X.X.1.4972

Apparently it did work. But once my web server answers, the answer is
not sent back to the machines in my internal network.

Anyone that can give me some light into it?

Thank you

Henrique
