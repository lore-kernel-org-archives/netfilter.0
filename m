From: "Erick Sanz" <esanz@minorplanetusa.com>
Subject: ip_conntrack_ftp and port forwarding
Date: Mon, 7 Jun 2004 12:29:40 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLECICIIDHIEIENHHOOLIEDPCBAA.esanz@minorplanetusa.com>
References: <200405141237.08794.gdh@acentral.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405141237.08794.gdh@acentral.co.uk>
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
To: netfilter@lists.netfilter.org

 
	All,

	I have a firewall at home protecting a web server (personal
stuff); I would like to add ftp capabilities in order to upload
files from work, so I can work home.

	ASCII diagram:


	DSL -- Firewall -- Web server / FTP server


	My current rules to allow http are (no other rules included):


iptables -t nat -A PREROUTING -p tcp -d 172.16.1.34 --dport 80 -j DNAT \ 
	--to 192.168.0.20
iptables -A POSTROUTING -t nat -o eth0 -j MASQUERADE

iptables -A FORWARD -i eth0 -p tcp -d 192.168.0.20 --dport 80 -m state \
	--state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth1 -p tcp -s 192.168.0.20 --source-port 80 -j \
	ACCEPT

	I know I need to use ip_conntrack_ftp; however I am not sure if
it allows port forwarding...

	Really basic question, but I was wondering what everybody is doing...

Best regards,
Erick


This email message has been scanned for viruses.


