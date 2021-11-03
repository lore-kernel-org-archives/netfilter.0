From: serando <serando@sunrise.ch>
Subject: Re: learning to understand iptables
Date: Wed, 3 Nov 2021 19:25:54 +0100
Message-ID: <cf3ef7ac-41b2-7c89-9de5-6ad2dfc5f6fd@sunrise.ch>
References: <b4aec750-bbeb-eb72-33f6-01d1e64c6949@sunrise.ch>
 <85e869fc-bded-c41-db86-91dfbcf5de@jubileegroup.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <85e869fc-bded-c41-db86-91dfbcf5de@jubileegroup.co.uk>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello Ged and all other


Thank you very much.


Here is my first question:
The iptables configuration is as follows:

$ sudo iptables -L
Output:
Chain INPUT (policy ACCEPT)
target=A0=A0=A0=A0 prot opt source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 destination

Chain FORWARD (policy ACCEPT)
target=A0=A0=A0=A0 prot opt source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 destination

Chain OUTPUT (policy ACCEPT)
target=A0=A0=A0=A0 prot opt source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 destination


I have read that with this configuration, my browser only accepts data=20
from the Internet, if it has requested the data. This means that all=20
packets that the browser has not requested are dropped.

Question 1:
Which programme now ensures that data acceptance of unrequested packets=20
is dropped with the above iptables configuration? Is it Netfilter? In=20
this case, does Netfilter filter out these unrequested packets?

Question 2:
If Netfilter is filtering out these packets: I assume that if we would=20
switch off or uninstall Netfilter, then the browser would also accept=20
packets from the Internet that the browser has not requested. Right?

Very interested in this. Thank you.

