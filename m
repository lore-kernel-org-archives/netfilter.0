From: "Kevin D. White" <web_crawlz@yahoo.com>
Subject: Ok, how about this?
Date: Sat, 29 May 2004 13:22:26 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040529202226.59280.qmail@web41701.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

# Pick out TCP packets
$TPath -N NEWTCP
$TPath -A NEWTCP -p tcp --tcp-flags ALL FIN -j
LOGFINPROBE
$TPath -A NEWTCP -p tcp --tcp-flags ALL SYN,ACK -j
LOGSYNACK
$TPath -A NEWTCP -p tcp --tcp-flags NONE -j
LOGNULLSCAN
$TPath -A NEWTCP -p tcp --tcp-flags ALL FIN,URG,PUSH
-j LOGXSCAN
$TPath -A NEWTCP -p tcp --tcp-flags ALL ACK -j
LOGACKSCAN
$TPath -A NEWTCP -p tcp -j DROP

Am I missing any suspect flags combinations or
problems with these?

## INPUT table

$TPath -A INPUT -p ALL -m state --state
ESTABLISHED,RELATED -j ACCEPT  #now I am only left
with NEW packets
$TPath -A INPUT -p ALL -i $ExNet -d 255.255.255.255 -j
DROP 	

#$TPath -A INPUT -p ALL -m multiport
--destination-port 22,53,80,110 -j OPEN   #this line
is out because I have no open ports

$TPath -A INPUT -p tcp -m --limit 10/minute -m
multiport --destination-port $TarPits -j TARPIT
$TPath -A INPUT -p tcp -j NEWTCP

$TPath -A INPUT -p icmp -m --limit 1/s -j LOGFLOOD
$TPath -A INPUT -p icmp -j REJECT --reject-with
icmp-net-unreachable  

$TPath -A INPUT -p udp -m --limit 10/minute -j
LOGUDPSCAN
$TPath -A INPUT -p udp -j DROP

$TPath -A INPUT -p ALL -j DROP

Do you see any obvoius problems with this INPUT chain?
 For now its a stand alone machine.

Does "/etc/init.d/iptables clear" set all the tables
to DROP?

Do PID's change?

If yes:
I would like to have this script start up applications
(Firefox, xmms, proFtp, etc.), gather and store their
PID's into variables.  Where would I call this script
from to have the OS boot to a desktop and those
programs running, with the PID's stored and the
table's appended with those PID's?  If I was to close
the program and start it up again, would the PID
change?

And finally, can I make changes on the fly?  I mean
after the everything has started, can I run Iptables
from the command line or run more script and make the
changes, any problems with doing this?

Thanks






	
		
__________________________________
Do you Yahoo!?
Friends.  Fun.  Try the all-new Yahoo! Messenger.
http://messenger.yahoo.com/ 

