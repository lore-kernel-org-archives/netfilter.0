From: "markooff" <markooff@interia.pl>
Subject: A bug with using match limit
Date: Thu, 12 Dec 2002 11:01:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000501c2a1c5$61121740$0400a8c0@1>
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

Hello!

Perhaps it's not a really new topic on this board, but i've found this
problem recently
I share my DSL connection with 4 other people and
i was just trying to limit one of them (who used to download lots of films,
mp3s )
and when i tried to use inverted match limit just like

     iptables -I FORWARD -p tcp -d 192.168.0.3 -m ! limit --limit 5/s -j
DROP

i received an error message :

iptables v1.2.6a: Couldn't load match `!':/usr/lib/iptables/libipt_!.so:
cannot open shared object file: No such file or directory

Try `iptables -h' or 'iptables --help' for more information.

This looks like iptables treats an "!" after "-m" like an sparate match ,
not connected with limit expression
But in the Iptables Tutorial 1.1.15 by Oskar Andreasson  there is written :
"The limit match may also be inverted by adding a ! flag in front of the
limit match. It would then be expressed as -m ! limit. This means that all
packets will be matched after they have broken the limit."

I don't know, perhaps i've did somethig wrong (what it could be ??? ), but i
tried every possible combination of
m, limit and  ! expressions, without any results.

Ofcourse i'd managed to solve my problem by
root@horus:/etc# iptables -I FORWARD -p tcp -d 192.168.0.3 -j DROP
root@horus:/etc# iptables -I FORWARD -p tcp -d 192.168.0.3 -m limit --limit
5/s -j allowed

but it's not a proper solvation :))

Thanks a LOT

Pawel Markowski
markooff@interia.pl
markooff@uj.edu.pl
Linux Registered User
         #289621



----------------------------------------------------------------------
FAKTY, wydarzenia, relacje, opinie... >>> http://link.interia.pl/f16a4 



