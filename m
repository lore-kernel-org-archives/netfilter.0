From: Sapient2003 <sapient@qwest.net>
Subject: Communication Redirect (Revised)
Date: Wed, 30 Apr 2003 16:50:37 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EB0371D.8080300@qwest.net>
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
To: netfilter <netfilter@lists.netfilter.org>

OpenBSD uses the packet filter pf to redirect communications to a 
program. Is ther anything like this for Linux? I tried IPTABLES for this 
task, like so: iptables -t filter -A INPUT -p udp -s 0/0 -d 66.47.159.11 
--destination-port 53 -j REDIRECT dns ... As it turns out, REDIRECT 
isn't for forwarding packets to another program...


