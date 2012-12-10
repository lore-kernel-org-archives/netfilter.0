From: Arnoud Tijssen <ATijssen@Ram.nl>
Subject: RE: About cluster deployments.
Date: Mon, 10 Dec 2012 07:21:00 +0100
Message-ID: <E7E899956E6065488DBC6623F76F36A275BF60EA6B@RAMNL-EX02.Ram.nl>
References: <CACuyg27siFFNibqe4rZCQnUX0KGatmGscoKyA7ViCi1uGg=drw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CACuyg27siFFNibqe4rZCQnUX0KGatmGscoKyA7ViCi1uGg=drw@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

=46or IPTables have a look at:

http://www.linuxjournal.com/article/10964


________________________________________
=46rom: netfilter-owner@vger.kernel.org [netfilter-owner@vger.kernel.or=
g] On Behalf Of Humberto Juc=E1 [betolj@gmail.com]
Sent: Friday, December 07, 2012 5:27 PM
To: netfilter@vger.kernel.org
Subject: About cluster deployments.

Hi all,

I'd like to know the group opnion about available GPL cluster
solutions. At the  moment I'm working with a solution based on ucarp
(vip address) and rsync (conf
 syncs) without synchronizing the conntrack table - im using active /
passive model.

 I'm adopting a configuration with two ucarp groups. One group
determines which firewall will be dedicated to Internet control and
other is for internal control.

The most suitable configuration into Internet has been keepalived + con=
ntrackd.
 I think it's a great alternative, but ... I'm having some doubts.

What do you think of implementations with CLUSTERIP?
I did some tests, but found it a bit unstable. Maybe for my mistakes.
I found articles  criticizing and others saying that the target
CLUSTERIP will sync the conntrack table too. It's true?

To synchronize the configuration i thought about using the DRDB, but i
 found it very complex to manage - increases the difficulty in adding
or removing nodes. In tests that i did, I prefer GlusterFS. But i'm
undecided. I still think rsync  the most simple, secure and fast way
to synchronize settings. In my opinion the other methods amplify the
complexity unnecessarily (for firewalls).

I found articles defending the cluster configuration with corosync + pa=
cemaker.
It seems a fairly complete solution, but thought is not ideal for firew=
all.

I intend to test models with active/active, but there isn't much
documentation on the subject.

What opinion do you have about it (cluster solutions)?
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
