From: seberino@spawar.navy.mil
Subject: valid INPUT/OUTPUT rule piece?--> '-p tcp --tcp-flags ACK,
	FIN FIN -j DROP', etc.
Date: Tue, 25 Jan 2005 16:18:55 -0800
Message-ID: <20050126001855.GC15359@spawar.navy.mil>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Please explain these:

$IPTABLES -t filter -A INPUT -p tcp --tcp-flags ACK,FIN FIN   -j DROP
$IPTABLES -t filter -A INPUT -p tcp --tcp-flags ACK,PSH PSH   -j DROP
$IPTABLES -t filter -A INPUT -p tcp --tcp-flags ACK,URG URG   -j DROP
$IPTABLES -t filter -A INPUT -p tcp --tcp-flags ALL     NONE  -j DROP

Do first 3 imply you must send ACK when you send a FIN, PSH or URG?

And does last mean you must set *some* TCP flag always?

CS

