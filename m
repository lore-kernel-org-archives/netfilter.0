From: MICHAL BLIZNAK <michal.bliznak@schneider-electric.com>
Subject: Limitation of connection rate (SYN packets) without timing
 restrictions.
Date: Tue, 14 Mar 2017 09:39:45 +0000
Message-ID: <DB5PR0401MB18967DE8D3D746330DDE5A1AA7240@DB5PR0401MB1896.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schneiderelectric.onmicrosoft.com; s=selector1-schneiderelectric-com02c;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=EMMVuwCNxwduyY0fo8hlzClF4Wm1jwqrujwWs/AFzoU=;
 b=Mm3lczZVEXlDGZKpwSLGpF8pr/Q+U7loZ1HhQSH/MobDkOws8BarxJawvTXeArfEBCGsVKnvxLekIokjhBi4V2yMs8CSuAzIOVS/FT0cAS+9ytnPGfT46st5qO/1ymxPBTAHG5HO831/AlAvdvJ/fBwir6Ra2fV/FEa6z3fXdLE=
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Dear All,

I'd like to know whether we can (by using iptables rules) restrict connecti=
on rates in the following way: We need to limit number of TCP connections r=
equest per a second, but without restrictions on at which exact time slot w=
ithin the one second period the connection attempts (SYN packets) arrive. L=
et's consider the following scenario: The connection rate limitation specif=
ied in iptables should accept just 10 new TCP connections (SYN packets) per=
 one second. By using limit, or hashlimit match module we can achieve that =
but based on our tryings, the iptables works in a way that just one SYN pac=
ket is acceptable within  1/10s (i.e. 100 ms). It means, that if, for examp=
le, 9 SYN packets arrive in the first 100ms then just one packet is accepte=
d and the rest is rejected even when no new SYN packet arrives within subse=
quent 900ms. I know, that we could set burst value to any number higher tha=
n one, but it doesn't solve the problem if several SYN packets arrive at th=
e beggining of the time period and previous time period was fully loaded. I=
'd like to know whether it is feasible to set the iptables so that some tot=
al number of new connection requests (comming from ANY IP address but aimin=
g to some specific port) can be accepted regardless on exact timing.

Best regards and thanks for your ideas in advance,=20

Michal Bliznak
=A0=A0=A0=A0=A0=A0=A0=20


