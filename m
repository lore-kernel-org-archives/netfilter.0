From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Regarding Iptables Redirect Target rule
Date: Tue, 02 Feb 2010 20:18:08 +0100
Message-ID: <4B687A70.4030901@plouf.fr.eu.org>
References: <LB95CFD713BF44ce1B06C76BE068BFE90.1265010613.scalix01.aarboard.ch@MHS> <4B678D5C.7090701@signalogic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B678D5C.7090701@signalogic.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vikram Ragukumar <vragukumar@signalogic.com>
Cc: netfilter@vger.kernel.org, netfilter-devel@lists.netfilter.org

Hello,

Please don't reply to an existing thread when posting a new topic.

Vikram Ragukumar a =E9crit :
>=20
> I would like to know how to construct a rule to intercept packets tha=
t=20
> belong to the port translated stream, but now are coming from Interfa=
ce=20
> 2 and would like to encrypt them before they go out on Interface 1 ?=20

I guess that connmark+CONNMARK would do the job.
