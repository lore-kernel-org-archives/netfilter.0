From: Pawel Pilat <poster_pl@yahoo.com>
Subject: ECN problem?
Date: Mon, 21 Jun 2004 01:59:01 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040621085901.47720.qmail@web13422.mail.yahoo.com>
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

Hello everyone,
it's my first post on this list so plese understanding
...
I think that i have problem with ECN , this is my
situation:

IN--->R--->ISP

where:
IN - my internal net
R - my linux router (2.4.25, ipt-1.2.9)
ISP - my ISP

so when i trying to connect from internal net to
Internet i expirencing very slow transfers (500 - 700
bps) but from router everything is ok (transfer rate
50 - 60 kbps)
when i used tcpdump on external interfece on router i
realized that my ISP sends to me in every TCP packet
TOS field set to 0x03 (ECN-CT + ECN-CE)
i think that is the problem

i tried using:

iptables -t mangle -A PREROUTING -i $EXTIF -j TOS
--set-tos 0x00 but without any result

my question is:
1.it is possible to set linux box to ignore this
fields in packets?
2. there is another way to solve the problem?

thank for advices
best regards

POSTER PL



		
__________________________________
Do you Yahoo!?
Take Yahoo! Mail with you! Get it on your mobile phone.
http://mobile.yahoo.com/maildemo 

