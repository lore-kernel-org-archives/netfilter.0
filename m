From: czesn <czesn@gazeta.pl>
Subject: basics
Date: Mon, 28 Apr 2003 03:24:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2610830283.20030428032413@gazeta.pl>
Reply-To: czesn <czesn@gazeta.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello everyone,

Im newbe at iptables, and unfourtunately i got nobody to ask for
solution, maybe You may help.

My problem

I want to create quite tight rules of firewall for my home network. I
have set deamons like this:


deamons accessible from ppp0 (internet) and eth1 (local net)
ftp port 21 tcp
ssh port 22 tcp
httpd port 80

seamons accessible ONLY for eth1 (local net)
dhcpd port 67 udp
squid port 3128 tcp

and some squid proccess work on 32773 udp

I cant write rules to block everything other than above services.
I have tryed many solutions, but none of them worked. If anyone of
You, could help me with that i would be forever in debt.

I have a few more newbe question:

1. If in my system runs only deamons that are above on the list, is this nessecery to
   block unussed ports?
2. Is it wise to block all ports above  REGISTERED PORT NUMBERS ( above
   1000 port ), when in system runs http server that answer to client
   from global net on this ports, and proxy server that answer to the
   local clients on this ports ???


-- 
Best regards,
mailto:czesn@gazeta.pl


------------ R E K L A M A ------------ 
PITY 2002 - okres rozliczen trwa! Wystarczy Ci program Jupiter 2002 Premium i po klopocie - nawet skomplikowana deklaracje przygotujesz w kwadrans. Przekonaj sie sam i zamow: http://pity.elfin.pl/premium/ e-mail: pity@elfin.pl. Najpopularniejszy program do rozliczen podatkowych na rynku (od 2001 roku ponad 1.000.000 kopii). Copyright Elfin Sp. z o.o. 

