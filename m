From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Order in ruleset edition
Date: Wed, 26 Nov 2003 10:59:08 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122EA8@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: Alejandro Cabrera Obed <sisdis@tournet.com.ar>, "Netfilter lista (iptables)" <netfilter@lists.netfilter.org>

The order of rule insertion only matters when the rules have the same
table and chains. So, the following table/chain combinations can be
applied in any order:

Raw/PREROUTING
Mangle/PREROUTING
Nat/PREROUTING
Mangle/INPUT
Filter/INPUT
Mangle/FORWARD
Filter/FORWARD
Raw/OUTPUT
Mangle/OUTPUT
Filter/OUTPUT
Nat/OUTPUT
Mangle/POSTROUTING
Nat/POSTROUTING

Also, any policy (-P ..) rules can be applied in any order, but if you
have more than one policy rule for any of the above table/chain
combinations, the later executed rule will persist.

-----Original Message-----
From: Alejandro Cabrera Obed [mailto:sisdis@tournet.com.ar]=20
Sent: Wednesday, November 26, 2003 10:41 AM
To: Netfilter lista (iptables)
Subject: Order in ruleset edition

Hi !!!
I'm trying to construct my own ruleset of iptables; I'm editing a file
script.

My question is the following:

Is there any order about CHAINS and TABLES that I have to follow in
order to
construct my iptables ruleset ??? For example, is it the same if firstly
I
write in my script my the FORWARD rules and then the OUTPUT and INPUT
rules
or viceversa ???

Thanks a lot and regards !!!

Alejandro.



