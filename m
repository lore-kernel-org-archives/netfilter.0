From: <hamals@infinito.it>
Subject: FTP rules
Date: Mon, 31 Jan 2005 17:40:24 +0100
Message-ID: <web-42708298@infinito.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org


  my PCs behind my firewall didn't get ftp connection to 
any external ftp server. Why?

/sbin/modprobe ip_contrack
/sbin/modprobe ip_contrack_ftp

# LAN -> INTERNET
iptables -A FORWARD -i $LAN -o $INET -p tcp --dport 21 -j 
ACCEPT
iptables -A FORWARD -i $LAN -o $INET -p tcp --dport 20 -j 
ACCEPT

# INTERNET ->LAN
iptables - A FORWARD -i $INET -o $LAN -p tcp -m state 
--state ESTABLISHED, RELATED -j ACCEPT

# NAT
iptables -t nat -A POSTROUTING -s $IPs_LAN -o $INET -j 
SNAT  --to-source $INET_IP


Thanks fo help
_______________________________________
Connessione ed e-mail gratuita da 10 mb
consultabile tramite web e tramite pop.
www.infinito.it vieni a scoprire tutti 
i nostri servizi!

http://www.infinito.it/xmail


