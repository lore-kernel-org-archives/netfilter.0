From: "casfre@gmail.com" <casfre@gmail.com>
Subject: strange ACK SYN URGP=0 in an iptables firewall with statefull enabled.
Date: Thu, 7 Feb 2008 20:10:25 -0200
Message-ID: <aaef12150802071410r1e6d66ffw57a3557da6751965@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=06DFGapW/KU1Ugxn7TbBGNtcE4QkUyrEo5AGXarlJik=;
        b=spd18m+nCd1MgMP8SKXDt82S17X6mBUPEn1a4Eg/HJ6r3AwxaGyc2lhCUOBnBJ4UpxHbYcMXqiw1wgFbCkTLN58L2DiyXuciY4Nh9c1xOyYj7DHrggtPI2/SHILShcR0EzUy+jVa4q3D0h/1yc9rdITv+lnU9syuZyh98d0X8G0=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

HI,

     English is not my native language, so forgive about my mistakes.

     I think you can point me to right direction to investigate some
"weird" log lines from my iptables ( 1.3.7 )

     I use -m state to control my traffic and I am see a lot of log
lines, from a lot of src ips ( out of my range and from other
countries) and with SPT=3D80 PROTOCOL=3DTCP directed to machines, in my
lan. There are some line were SPT=3D10100 or 6667.

     The strange thing is that target IPs were never used in my LAN.
They are in our range, but, we never used them. Other detail: all
lines have ACK SYN URGP=3D0.

     I log everything I drop and, in that cases, an
RELATED,ESTABLISHED rule is blocking the packages.

    Could some one point me in a good direction to solve/investigate
the problem?

C=E1ssio
