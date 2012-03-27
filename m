From: Nils Rennebarth <nils.rennebarth@funkwerk-ec.com>
Subject: REJECT target faster for remote than for local packets?
Date: Tue, 27 Mar 2012 15:51:34 +0200
Message-ID: <4F71C5E6.8040001@funkwerk-ec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,

A simple firwall rule
  iptables -I OUTPUT --protocol tcp --dport 80 -j REJECT
prevents local processes from making TCP connections to port 80,
and those who try will get a -ECONNREFUSED. Good.

But why do they get the error only after a few seconds? A tcpdump
shows that ICMP Packets are generated on the loopback interface:

When doing
  wget http://host:80/
exactly two ICMP packets show up on lo:
  15:45:11.850785 IP 10.10.10.144 > 10.10.10.144: ICMP 10.10.10.31 tcp =
port 80 unreachable, length 68
  15:45:14.849298 IP 10.10.10.144 > 10.10.10.144: ICMP 10.10.10.31 tcp =
port 80 unreachable, length 68
But only the second one has an effect:

Connecting to host|10.10.10.31|:80... failed: Connection refused

My question is:=20
 1) why?
 2) is there another way to make connections to a certain set of hosts =
fail fast
    and without delay, without changing the applications itself.

--=20

Mit freundlichen Gr=FC=DFen / with kind regards

Nils Rennebarth, Software Developer

--
=46unkwerk IP-Appliances GmbH
M=F6nchhaldenstra=DFe 28
D-70191 Stuttgart

Tel: +49 711 900300 - 0
=46ax: +49 711 900300 - 90

E-Mail: Nils.Rennebarth@funkwerk-ec.com

Location: GmbH Nuernberg, Local Court Nuernberg, HRB 25481
Managing Directors: Torsten Urban
--------------------------------
The information contained in this e-mail has been carefully researched,
but the possibility of it being inapplicable in individual cases cannot
be ruled out. We therefore regret that we cannot accept responsibility
or liability of any kind whatsoever for the correctness of the
information given. Please notify us if you discover that information is
inapplicable.

