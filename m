From: Ruslan Spivak <alienoid@is.lg.ua>
Subject: REDIRECT question
Date: Fri, 11 Jul 2003 14:09:15 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F0E9ADB.7080005@is.lg.ua>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello!

Can you help me with the following:

i try to make REDIRECT on my local host -

$IPTABLES -t nat -N REDIRECT_CHAIN
$IPTABLES -t nat -A REDIRECT_CHAIN -p tcp --dport 80 -j REDIRECT 
--to-port 7080
$IPTABLES -t nat -A PREROUTING -j REDIRECT_CHAIN

When users in my LAN connect to my host's 80 port they are redirected to 
7080 - it's ok. But when i try to do on my host - telnet localhost 80 - 
i get connection refused (looks like redirection doesn't work). What 
maybe the problem?

Best regards,
Ruslan



