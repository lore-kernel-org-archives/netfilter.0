From: Pandu Poluan <pandu@poluan.info>
Subject: Question on raw table and match state
Date: Fri, 11 Feb 2011 14:46:37 +0700
Message-ID: <AANLkTin7iGxO6rS4XiziUVWJt-4cfH8-h4-cg3354-2C@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

I am wondering if the following rule will work:

iptables -t raw -A PREROUTING -p icmp -m state --state
RELATED,ESTABLISHED -j ACCEPT

Rgds,
--
Pandu E Poluan
~ IT Optimizer ~
Visit my Blog: http://pepoluan.posterous.com
Google Talk:=C2=A0=C2=A0=C2=A0 pepoluan
Y! messenger: pepoluan
MSN / Live:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pepoluan@hotmail.com (do not =
send email here)
Skype:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pepoluan
