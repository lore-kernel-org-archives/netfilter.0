From: Javier Miguel =?unknown-8bit?q?Rodr=EDguez?= <javier@talika.eii.us.es>
Subject: Rule matchup in iptables
Date: Thu, 6 Mar 2003 13:47:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030306124758.GB23703@talika.eii.us.es>
Reply-To: javier@talika.eii.us.es
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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


	Hello

	I have a iptables based firewall, with 5 gigabit ethernet
adapters and almost 8000 rules (ouch!). This is a "test bed", (still) not a
production enviroment

	I can see delays in traffic when crosses the firewall
(miliseconds). I want to optimize the firewall rules (we use a LOT of
VoIP) , so this is my question: Is there any way to know when a packet matches a rule? 
-j LOG is not feasible (thousands of packets per second). I want something like this: 

Last two hours:

Rule 1: 15000 hits, 150 megabytes
Rule 2: 3500 hits, 34 megabytes
Rule 3: 9675 hits, 2 megabytes
ad infinitum...

	Other question? How can I test iptables rules? In ipchains I
could try them, but with iptables do I have to generate fake traffic?

	Thank you for your support.


