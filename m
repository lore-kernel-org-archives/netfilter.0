From: <skmail@mcewen.wcnet.org>
Subject: internal ftp/port forwarding problem
Date: Tue, 24 Sep 2002 16:24:36 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0209241608490.8828-100000@mcewen.wcnet.org>
References: <FLEKIPPLAEDMJMOOBBDPKEGOCPAA.stewart.thompson@shaw.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FLEKIPPLAEDMJMOOBBDPKEGOCPAA.stewart.thompson@shaw.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I am behind a firewall at work, trying to open up a path through a linux
firewall at a second remote site.  Following are the iptables rules that I
am trying to use.  I can get logged in, but since firewalls are involved
it's set for passive ftp and when it opens the data connection for
directory listing it comes back as this:

COMMAND:>	PASV
227 Entering Passive Mode (10,8,13,16,4,66).

Which if I'm correct means try to connect to 10.8.13.16 (ftp server's
internal address, which is why it doesn't work) for the passive data
connection.  I can't figure out why iptables isn't nat'ing this to work.  
All my iptables ftp options are compiled directly into the kernel, 2.4.19
with V 1.2.7 iptables.  Hopefully somebody out there can help explain to
my addled brain why this isn't working.  Thanks!

------------------------------------------


# forward port 2101 to internal for an internal ftp server 

$IPTB -t nat -A PREROUTING -d $EXT_IP -p tcp --dport 2101 -j DNAT --to
$INT_FTP_SRVR:2101


$IPTB -A FORWARD -s ! $INT_NET -d $INT_FTP_SRVR -p tcp --dport 2101 -j
ACCEPT


$IPTB -t nat -A POSTROUTING -s $INT_IP -p tcp --sport 2101 -j SNAT --to
$EXT_IP:2101


$IPTB -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT 

$IPTB -A FORWARD -m state --state NEW -i $INTDEV -s $INT_NET -j ACCEPT



