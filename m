From: "Erick Sanz" <esanz@minorplanetusa.com>
Subject: RESEND: ip_conntrack_ftp and port forwarding
Date: Tue, 8 Jun 2004 13:08:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLECICIIDHIEIENHHOOLAEFCCBAA.esanz@minorplanetusa.com>
References: <FLECICIIDHIEIENHHOOLIEDPCBAA.esanz@minorplanetusa.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FLECICIIDHIEIENHHOOLIEDPCBAA.esanz@minorplanetusa.com>
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

	I sent the bellow message yesterday, but got no answers.

	I am sure it did not get there; if it did, sorry for the
repost.

	The question is, can I have an internal FTP server? the
firewall would have to FORWARD the connections to port 21, and
then ip_conntrack_ftp would have to allow the rest of the 
communication in...  Does this work?

	For more information, please read bellow message...

	is there anybody using it?

Best regards,
Erick



> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Erick Sanz
> Sent: Monday, June 07, 2004 12:30 PM
> To: netfilter@lists.netfilter.org
> Subject: ip_conntrack_ftp and port forwarding
> 
> 
>  
> 	All,
> 
> 	I have a firewall at home protecting a web server (personal
> stuff); I would like to add ftp capabilities in order to upload
> files from work, so I can work home.
> 
> 	ASCII diagram:
> 
> 
> 	DSL -- Firewall -- Web server / FTP server
> 
> 
> 	My current rules to allow http are (no other rules included):
> 
> 
> iptables -t nat -A PREROUTING -p tcp -d 172.16.1.34 --dport 80 -j DNAT \ 
> 	--to 192.168.0.20
> iptables -A POSTROUTING -t nat -o eth0 -j MASQUERADE
> 
> iptables -A FORWARD -i eth0 -p tcp -d 192.168.0.20 --dport 80 -m state \
> 	--state NEW,ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -i eth1 -p tcp -s 192.168.0.20 --source-port 80 -j \
> 	ACCEPT
> 
> 	I know I need to use ip_conntrack_ftp; however I am not sure if
> it allows port forwarding...
> 
> 	Really basic question, but I was wondering what everybody 
> is doing...
> 
> Best regards,
> Erick
> 
> 
> This email message has been scanned for viruses.
> 
> 
> 
> 
> This email message has been scanned for viruses.
> 


This email message has been scanned for viruses.


