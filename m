From: Rob <netfilter@cloudtown.com>
Subject: Propert IPTABLES Configuration
Date: Fri, 06 Dec 2002 18:25:48 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.2.20021206181820.009e93d0@64.83.193.200>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I am attempting to setup a Half-Life Counter-Strike Server on my 
machine.  I need
it setup so people can access it from the internet and my intranet.

I found the following ports I need setup.

TCP 6003 outbound, incoming replies (as specified in woncomm.lst)
TCP 7002 outbound, incoming replies (as specified in woncomm.lst)
UDP 27010 outbound, incoming replies (as specified in woncomm.lst)
UDP 27011 outbound, incoming replies (as specified in woncomm.lst)
UDP 27012 outbound, incoming replies (as specified in woncomm.lst)
UDP 27013 outbound, incoming replies
UDP 27015 outbound, incoming replies on 27015-27050


would something like this be right?

IPTABLES -A INPUT -i eth0 -p tcp -s any/0 -d any/0 --dport 6003 -m state 
--state ESTABLISHED,RELATED -j ACCEPT

with that in mind would I have to create an output for each one too?

IPTABLES -A OUTPUT -o eth0 -p tcp --dport 6003 -m state --state 
NEW,ESTABLISHED,RELATED -j ACCEPT

Thanks for your help.

Rob


