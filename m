From: Michael Schachtebeck <schachti@rbw.goe.net>
Subject: limit extension
Date: Tue, 19 Jul 2005 20:07:59 +0200
Message-ID: <42DD417F.4090804@rbw.goe.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I'm trying to redirect some people on my router once a day to a local
apache to show them a status page.

I'm using the following iptables rule to redirect them:

/sbin/iptables -t nat -I PREROUTING -p tcp -s $IP -i $LAN_DEV --sport
1024: --dport 80 --syn -m limit --limit 1/d --limit-burst 1 -j REDIRECT
--to-port 5000

At first, I thought everything was fine: I got redirected when trying to
open the first page in my browser, and after that, I could surf normally
without being redirect. But after about 30 minutes, I got redirected
again, and iptables -t nat -vnL PREROUTING said that the rule had
matched twice.

What am I doing wrong? Why was I redirect a second time? In my opinion,
the second redirection should not have happened then, but 1 day (24
hours) later...

Any hint is welcome...

Michael.
-- 
PGP Public Key:  http://www.num.math.uni-goettingen.de/schachte/key.asc
Key fingerprint: C474 8B85 17C0 0232 E439 0FBF 2451 E452 293C D798

