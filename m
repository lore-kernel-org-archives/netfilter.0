From: Nilesh <niluforalways@yahoo.com>
Subject: [squid-users] Giving trouble when blocking MSN messenger
Date: Mon, 1 Nov 2004 06:21:01 -0800 (PST)
Message-ID: <20041101145915.575CF3451A@1am>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: Squid <squid-users@squid-cache.org>
Cc: netfilter@lists.netfilter.org

====== (Header) e-mail Filtrado ======
Hello All,

I am not able to block MSN Messenger when I put this
rule in rc.firewall script 
This rule is required for to connect VPN sever at
client side.
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to
$EXTIP
Could any one tell me what needs to be change in
Squid.conf for blocking MSN messenger or tell me the
way to block it.

Thanks and Regards 
Nilesh,



__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 


