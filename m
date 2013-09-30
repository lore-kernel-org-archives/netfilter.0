From: jack seth <bird_112@hotmail.com>
Subject: Getting iptables not to reply
Date: Mon, 30 Sep 2013 15:58:48 +0000
Message-ID: <SNT147-W156511006C6569D034DE84BF140@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Ok, if you have an 'accept' rule for a service that is not currently ru=
nning, is it possible to have iptables to simply not respond instead of=
 reporting the port as 'closed'?=A0 During a port scan at grc.com, if t=
he router doesn't reply the port will be reported as 'stealth'. 		 	   =
		  