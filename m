From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: [newbie]
Date: Sun, 9 Mar 2003 16:50:32 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303091650.32340.Alistair@nerdnet.ca>
References: <006901c2e62a$2d4ef780$3200a8c0@xp1700>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006901c2e62a$2d4ef780$3200a8c0@xp1700>
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
To: Frederic SOSSON <fred_sos@swing.be>, netfilter@lists.netfilter.org


	For this to work you would need to load 
	ip_nat_Ftp and ip_conntrack_ftp with the parm
	ports=21,113
	otherwise the connection tracker and the nat will only watch
	port 21.


	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!
	


On March 9, 2003 05:53 am, Frederic SOSSON wrote:
> Hi all,
>
> I'm juste a newbie in iptables ;)  My problem is, i have a linux box
> routing my DSL connection, i set these rules:
>
> iptables -A FORWARD -i ppp0 -o eth0 -j ACCEPT
> iptables -A FORWARD -i eth0 -o ppp0 -j ACCEPT
> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> iptables -A FORWARD -j LOG --log-prefix "Firewall: "
>
> == Great, i have acces to thet NET ! ==
>
> I have also a machine (192.168.0.50) in my local network running an FTP
> client this one runing an identd daemon (port 113) to access to an FTP
> server on the internet, i have added this rule
>
> iptables -t nat -A PREROUTING -p tcp --dport 113 -i ppp0 -j DNAT --to
> 192.168.0.50:113
>
> But my FTP client tels me:
>
> [11:51:58] PORT 192,168,0,50,13,161
> [11:51:58] 200 PORT command successful.
> [11:51:58] LIST
> [11:52:02] 425 Can't build data connection: No route to host.
>
> Any help would be appreciate ;)
>
>
>
> Frederic

-- 

