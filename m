From: Paul <gabaod@yahoo.com>
Subject: Iptables - Port forwarding - extremely baffled.
Date: Wed, 30 Apr 2003 12:33:07 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030430193307.64412.qmail@web13509.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Ok ive been trying to attempt basic port forwarding
for past days and now im extremely confused :)

First off instead of going with my normal firewall
script, i decided to just open everything up and just
test a basic port forwarding.

I first ran this

$IPTABLES -P INPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F INPUT
$IPTABLES -F FORWARD
$IPTABLES -F OUTPUT
$IPTABLES -t nat -P PREROUTING ACCEPT
$IPTABLES -t nat -P POSTROUTING ACCEPT
$IPTABLES -t nat -P OUTPUT ACCEPT
$IPTABLES -t nat -F PREROUTING
$IPTABLES -t nat -F POSTROUTING
$IPTABLES -t nat -F OUTPUT


to fully clear everything and open everything up.

I then ran this

iptables -t nat -A PREROUTING -i eth0 -p tcp -d
externalip --dport 22 -j DNAT --to 192.168.1.8:22

And i tested it from outside the network, and yes it
fully connected me to port 22 on 192.168.1.8  by ssh
into externalip:22

Ok, now i know port forwarding DOES work :)

Well i want to be able to ssh to my firewall, and also
to 192.168.1.8  so I reran the above flushing script
to re-clear everything out.

I then ran this

iptables -t nat -A PREROUTING -i eth0 -p tcp -d
externalip --dport 22022 -j DNAT --to 192.168.1.8:22

only difference now is external port will be 22022
instead of the previous 22.   So i try to connect to
externalip:22022  and the connection just times out,
so it didnt forward externalip:22022 to
192.168.1.8:22, but it will forward  externalip:22 to
192.168.1.8:22

Please assist me in the right direction on why i cant
let it be a different external port other than 22. and
yes ive tried other various ports besides 22022 as
well :/

thanks
-paul 

__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com

