From: Romain Moyne <aero_climb@yahoo.fr>
Subject: port translation
Date: Sun, 11 Jan 2004 11:21:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4001239D.7010904@yahoo.fr>
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

Hello,

I'm French and my english is bad ;)

I have a http server (debian 3.0) behind a router (debian 3.0). I have a 
problem when I want to log the visitor's IP of my website with PHP or 
Perl or all language. I have always the IP of my router ! Somebody tell 
me that I must do port translation but I have searched and I haven't 
fand anything.
Can you help me ?
This is the rules of my router :

iptables -t nat -A PREROUTING -d MyIP -p tcp --dport 80 -j DNAT 
--to-destination 192.168.0.3:80

Romain



