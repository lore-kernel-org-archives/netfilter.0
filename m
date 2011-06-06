From: <bmcdowell@coxhealthplans.com>
Subject: [2:656]?
Date: Mon, 6 Jun 2011 19:35:32 +0000
Message-ID: <92A9C99A1E5FF14F8538DDEE14996A5203341F@chp-exg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello list.=A0 I'm in the process of 'modernizing' my iptables scripts =
to utilize iptables-save/iptables-restore.=A0 I've imported my script o=
nto a test box, have exported via -save, and now I have a question or t=
wo about what I'm seeing.=A0=20

=46or starters, is there a reference for the changes in format?=A0 Goog=
le is most unhelpful when trying to search for "[2:656]", for example.

Specifically, I'd like to know what the "2:656" means in the following =
line:

-----
*filter
:INPUT DROP [2:656]
-----

Why isn't it simply:

-----
*filter
:INPUT DROP
-----

And what would happen if I changed it?


Thanks in advance.



Bob McDowell
Network/Security Engineer=20
Cox HealthPlans
