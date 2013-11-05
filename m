From: jack seth <bird_112@hotmail.com>
Subject: Does INVALID state match FIN, Xmas tree, and NULL packets?
Date: Mon, 4 Nov 2013 20:53:59 -0600
Message-ID: <SNT147-W79A417E1DFEE7ED2E9965CBFF10@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Does the rule 'iptables -I INPUT -m state --state INVALID -j DROP' get =
rid of those scans?=A0 Also, what exactly does INVALID match? 		 	   		=
  