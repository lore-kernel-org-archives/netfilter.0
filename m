From: Nicolas Grossi <nicolas.grossi@gmail.com>
Subject: question about using iptables.
Date: Wed, 15 Apr 2009 10:45:22 -0300
Message-ID: <49E5E4F2.2070502@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=PfJmNxc6Za7jz0smabEM2+eglnqJtk9jrowPATqhtKk=;
        b=QHInCDpzkLOasWYKWSG2AzXjSo7yXmbtle6/qD4IEavknDmbSgUd9JeYPP24IzpOLH
         UrmTqz/eYt2st4Dlw7smzjgmawUrffd9LBLDyDu/f/9AW6pTiWI9U2G/YyFbnfRJWXW2
         O0FetnZC8ViuE0fDK469CddBETsVMH9MqYU2M=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

People:
           I=B4m new using iptables and i want to know if it is possibl=
e=20
to forward all the packages to a specific port to a specifica ip=20
address. This is my environment and what i need to do:

I have a lan under 190.168.0.x

then a have a gateway with iptables + ipcop to filter all packages to=20
WAN (internet)

My ISP give us a set o public ips and all the packages from the lan to=20
the wan use one public ip (one from that set) =3D 190..139.106.194

Currently our smtp server is been considered as SPAM for a few domains=20
(and we need to change this ASAP).

It is poosible to configure iptables to set all the packages from=20
190.168.0.x:25 (smtp port) to use a different public ip addres of the=20
set that our isp gives us?

brieflly:

all packages from our lan to a port different to 25 use 190..139.106.19=
4=20
and all packages from our lan to port 25 use 190.139.106.195

Thanks in advance!

Nico




