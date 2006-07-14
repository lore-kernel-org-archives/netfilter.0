From: "Fabio S. Silva" <fabiofoz@gmail.com>
Subject: uid-owner
Date: Fri, 14 Jul 2006 09:22:59 -0300
Message-ID: <12ec50350607140522p40cc8a86jd5b08fa88a555900@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all, i want to know how to work with uid-owner i 've tried to use
with this rule

iptables -A OUTPUT -m owner --uid-owner fabio -j DROP

but all packets created by this user pass the firewall
 if i create the rule in the machine of user fabio its works, but i
need to create the rule in my firewall gateway, in the firewall i can
see user fabio with the command id fabio, its returns ok to me, i've
tried to use with the user id but didnt work.

any idea?

thanks

