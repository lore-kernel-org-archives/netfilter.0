From: "Jesper Lund" <jesper@ballbreaker.dk>
Subject: ICMP type3, code 13 not RELATED
Date: Wed, 30 Apr 2003 11:19:33 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1435.212.242.51.102.1051694373.squirrel@www.ramstedt.dk>
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

Hi

I live in Denmark, where we have got an ISP, who blocks for incomming port
25 to their customers. This is for preventing open relays. Okay, I can
make a closed relay, and I do not use them as my own ISP, so I don't
really care for that.

They have "solved" the problem in the way, that the ISP has a backup MX,
which is the only MX in the world who can talk to the customers mail
server. So for your domain, i make:

domain.dk.    IN MX 10 mail.domain.dk.
domain.dk.    IN MX 10 backup-mx.isp.dk.

And it works

But my problem is that when my own mailserver tries to deliver a mail to a
mailserver by a customer, a router in another ip than the customer sends
me that ICMP packet. That packet is obviosly not RELATED, and the
conection tracking does not send that ICMP packet back to my mailserver
which initially started the failing connection.

The packet can be seen here:
http://home.ballbreaker.dk/phpstat/id.php?id=614279

So what do I do now ?

Rgds,
Jesper Lund

