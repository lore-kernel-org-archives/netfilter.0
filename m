From: Mattia Martinello <liste@mattiamartinello.com>
Subject: DNAT
Date: Fri, 29 Aug 2003 00:57:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F4E88DD.6060704@mattiamartinello.com>
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

Hi all

I created a script that setup a set of rules on the nat table.
It works good without any problem on SuSE 8.0, and now I wish to move 
the system on Debian.
I installed Debian and I set the network correctly like on SuSE and I 
copied the script on it.
The scripts shows me no error, and the rules works good, but there is a 
little problem.
The DNATs from the local network works very well (I can see the server 
which is on the DMZ from the local network), but the DNATs from the 
Internet doesn't work! From the Internet (ppp0) i cannot see the server 
which is on the DMZ.
On SuSE 8.0 all works good and I didn't change anything in the script!
The input, output and forward chains are all setted on ACCEPT, like all 
the chains on the nat table.

This works good:
iptables -t nat -A POSTROUTING -s $LocalNET/24 -o ppp0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s $LocalNET/24 -o ppp0 -j ACCEPT
iptables -t nat -A POSTROUTING -s $LocalNET/255.255.255.0 -o eth2 -j 
MASQUERADE
iptables -t nat -A PREROUTING -p tcp -i eth1 -d $PublicIP -j DNAT --to 
$ServerIP

This DOESN'T work! :(
iptables -t nat -A PREROUTING -p tcp -i ppp0 -d $PublicIP --dport 80 -j 
DNAT --to $ServerIP:80

The kernel in use is 2.4.20 with all netfilter modules.

Where could be the problem?

Thank you very much!
Bye
Mattia.


