From: Askar <askarali@gmail.com>
Subject: droping too many ports
Date: Fri, 24 Sep 2004 02:45:43 +0600
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <a0f69e504092313454a9090b3@mail.gmail.com>
Reply-To: Askar <askarali@gmail.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

hi all

what if I do (and im doing this from last two hours ;))

iptables -A FORWARD -p tcp --dport 31000:65500 -j DROP
iptables -A FORWARD -p udp --dport 31000:65500 -j DROP

yes I am Droping too many ports at once, (actually its default ACCEPT
machine), as far I know not a single well known service is running on
port above 31000?

Actaully I duno what to do coz im watching (through tcpdump )lot of
clients accessing higher ports, thats why I puts these rules.

iptables -L -nvx  gives too many counts whenever I checked, especailly
numbers are very high for UDP "udp --dport 31000:65500 -j DROP"


Im i doing right thing? (see im getting counts on it )
Am I droping some ligitimate packets? 
or ours clients (sitting on M$ OS) are infected?

may I extend the rules to INPUT and OUTPUT ?

regards
tired :(
-- 
(after bouncing head on desk for days trying to get mine working, I'll make
yer life a little easier)

