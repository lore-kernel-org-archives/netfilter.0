From: E2IA <e2ia.ci@gmail.com>
Subject: xt_ACCOUNT define many network by table
Date: Thu, 27 Jan 2011 16:55:14 +0000
Message-ID: <AANLkTik+=rifOKRpurA3da=OMe-Jp96Y=YMRC1itgmQ4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=uymOq4FADS5+A7DbUwyBI/t6dI27l8b5w7shY2Lh1EU=;
        b=UUSef+ZLockNcRKuY0+J53juRIu7h6QlOKN4bQs3Z4fOFq1kYlAuUUAy7JarpCHx48
         /vcEukCGMssx0qGzcliJ41JdXefky1l/zqx7OzVJv+vdArBS/cvAxEKL58VGN1SArIAK
         bNVlbGH9AvNs59YijdLrEXt1KGU6NeRgCzxSA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi,
all I'm using xt_ACCOUNT for accounting on my linux box.
I have two network 192.168.2.0/24 and 172.16.2.0/24. and i want to
account these 2 network via table http.
So i've made these two rules :
rule 1:=C2=A0 iptables=C2=A0 -t mangle=C2=A0=C2=A0 -A=C2=A0 POSTROUTING=
=C2=A0=C2=A0 -m mark --mark=C2=A0 123
-j ACCOUNT --addr=C2=A0 192.168.2.0/24=C2=A0 --tname http
rule 2:=C2=A0 iptables=C2=A0 -t mangle=C2=A0=C2=A0 -A=C2=A0 POSTROUTING=
=C2=A0=C2=A0 -m mark --mark=C2=A0 123
-j ACCOUNT --addr=C2=A0 172.16.2.0/24 =C2=A0=C2=A0 --tname http

but when I enter the rule2 i got this error message :
[282339.158532] ACCOUNT: Table http found, but IP/netmask mismatch.
IP/netmask found: 192.168.2.0/255.255.255.0
[282339.158670] ACCOUNT: Table insert problem. Aborting

I'm wondering and I'd like to know if there is mean to define a table
for 2 deferent network.
regards.
