From: Steve Murphy <murf@parsetree.com>
Subject: iptables commands interfere with each other
Date: Wed, 18 May 2011 10:48:21 -0600
Message-ID: <BANLkTinknwdKqT=RP28ERv9Ybjr+mBfTKg@mail.gmail.com>
References: <BANLkTikhC4FeiKz94trqSiFSNcPJG353Vw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTikhC4FeiKz94trqSiFSNcPJG353Vw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello--

I haven't done it on enough kernels and different OS's to be certain it
is a general problem, or a version problem, or what, but....

When I fire up fail2ban with a set of jails all using iptables to block=
,
one of the jails will usually not get set up correctly, as if the comma=
nds
to create chains, rules, etc, were ignored or lost.=A0 If I introduce a
sleep before
each jail is created, such that no two jails will be created and set
up at the same time,
then all the problems go away.

This is on CentOS 5.5/5.6.

Am I alone and weird, or do others see this also? Is there known issues=
 on this?

murf
