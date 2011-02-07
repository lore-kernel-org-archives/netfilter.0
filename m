From: Carlos Cruz Luengo <carlos@cruzccl.com>
Subject: Allow all established and related connections
Date: Mon, 7 Feb 2011 13:22:32 +0100
Message-ID: <AANLkTinhVk9+s2qGjVbZdLOOj3A-9CSuBH48OnHr_USs@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mail List - Netfilter/iptables <netfilter@vger.kernel.org>

Hi,

I am writing a firewall script and I have run into a doubt. Is it
correct to allow already established and related connections by a set
of rules like these at the beginning of the script...

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

=2E.. and then only take care of NEW connections? This way I could allo=
w
ssh connections to the firewall just with this rule...

iptables -A INPUT -p tcp --dport ssh -m state --state NEW -j ACCEPT

=2E.. instead of with these two rules:

iptables -A INPUT -p tcp --dport ssh -m state --state NEW,ESTABLISHED -=
j ACCEPT
iptables -A OUTPUT -p tcp --sport ssh -m state --state ESTABLISHED -j A=
CCEPT

Sorry if this subject has already been asked in the mailing list (I
have not found any specific information and I want to be sure that is
not a mistake or a insecurity...) and thank you in advance!

--
Carlos Cruz Luengo
PGP key at: http://wwwkeys.eu.pgp.net/
=46ingerprint: BA1C 9932 D5B4 2B53 1DBC=A0 269B 2CC0 37C4 E996 EBF1
