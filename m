From: "GK GK" <imitheos@hotmail.com>
Subject: DCC send connections
Date: Sat, 18 May 2002 21:41:39 +0000
Sender: netfilter-admin@lists.samba.org
Message-ID: <F66XLsxpTljBOh8s4KW0000002b@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org



Hello.
I have a problem with dcc send in irc.I've read past posts on the lists and 
done
everything they said but i can't figure what goes wrong.
I have a machine with a plain 56k pstn modem.
My setup is the following.
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -m limit --limit 5/minute -j LOG --log-level warning 
--log-prefix "INPUT DROP: "
iptables -A OUTPUT -o ppp0 -j ACCEPT
iptables -A OUTPUT -m limit --limit 5/minute -j LOG --log-level warning 
--log-prefix "OUTPUT DROP: "
I have some other irrelevant rules too.

I can dcc recieve even without the ip_conntrack_irc and ip_nat_irc but i 
cannot dcc send.
I have tried with ip_conntrack_irc and with ip_conntrack_irc/ip_nat_irc.
I also passed "ports=6667,6668" as a parameter.

P.S i have only one machine that's why i am so confused why it isn't working
What i have seen in the logs is that i block for some reason the packets 
from the machine i am trying to send so i guess the connection tracking 
didn't work


Thank you for your time and excuse the size of my post.


_________________________________________________________________
MSN Photos is the easiest way to share and print your photos: 
http://photos.msn.com/support/worldwide.aspx


