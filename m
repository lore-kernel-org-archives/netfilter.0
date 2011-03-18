From: Pandu Poluan <pandu@poluan.info>
Subject: iptables-save bug?
Date: Fri, 18 Mar 2011 19:44:49 +0700
Message-ID: <AANLkTikFzbKdjjddsJMr_Rb6-6w1bu1hwOzBCVXZU=X7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello,

I think I found an iptables-save bug.

A rule that's *supposed* to be saved as:

-A PREROUTING -m conntrack --ctstate UNTRACKED -m comment --comment
"Don\'t process untracked" -j ACCEPT

Is instead saved as:

-A PREROUTING -m conntrack --ctstate  -m comment --comment "Don\'t
process untracked" -j ACCEPT

(i.e., the "UNTRACKED" option is missing)

I don't know if the other --ctstate options are also missing.

Details:
- iptables -v =3D=3D v1.4.4
- uname -a =3D=3D "Linux aeacus-4 2.6.32-29-generic-pae #58-Ubuntu SMP =
=46ri
=46eb 11 19:15:25 UTC 2011 i686 GNU/Linux"


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
More on me:=C2=A0=C2=A0My LinkedIn Account=C2=A0 My Facebook Account
