From: bjorn <b972@telia.com>
Subject: Temporally disable a host
Date: Sat, 14 May 2005 12:08:51 +0200
Message-ID: <1116065330.2995.106.camel@crux>
Mime-Version: 1.0
Content-Transfer-Encoding: Quoted-Printable
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
Content-Type: text/plain; charset="macroman"
To: netfilter@lists.netfilter.org

Hello,

I use iptables based on the MonMotha's Firewall script.
I partly understand what it does but have not been able
to absorb all the functionality/possibilities that iptables
offers...

I would like to temporally disable one of the hosts inside
by private network from internet access. Possibly all traffic
or only http traffic. My idea was to add this rule through a
cron job at a specific time and then later run another job that
deletes the rule.

Please help me with a suitable iptables command to do this.

Regards,

/Bj=C3=B6rn


