From: Mattia Martinello <mattia@mattiamartinello.com>
Subject: New chain
Date: Sun, 12 Jan 2003 00:58:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E20AFBE.5060404@mattiamartinello.com>
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

Hi

I wish to create and use a new chain which logs all DROP packets, but 
after DROP rules i must write ACCEPT rules too.
All DROP packets (not ALLOWED ones) have to be logged.
I wish to open the comunications between 192.168.1.0/24 and 192.168.1.254.
All packets between 192.168.1.0/24 and 192.168.1.254 haven't to be logged.

I tried to do this:

iptables -N LOG_DROP
iptables -A LOG_DROP -j LOG --log-tcp-options --log-ip-options 
--log-prefix '[IPTABLES DROP] : '
iptables -A LOG_DROP -j DROP

iptables -A INPUT -j LOG_DROP
iptables -A OUTPUT -j LOG_DROP
iptables -A FORWARD -j LOG_DROP

iptables -A LOG_DROP -s 192.168.1.0/24 -d 192.168.1.254/255.255.255.255 
-j ACCEPT
iptables -A LOG_DROP -s 192.168.1.254/255.255.255.255 -d 192.168.1.0/24 
-j ACCEPT

But it doesn't work.
Could you tell me how I can solve this problem, please?

Thank you very much
Bye
Mattia


