From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: iptables ftp problems; unable to "ls"
Date: Wed, 5 Nov 2003 19:06:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311051906.47233.Alistair@nerdnet.ca>
References: <BEA73FB6B8F62545A5B2818724D0DF2902E70864@u.library.Arizona.EDU>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BEA73FB6B8F62545A5B2818724D0DF2902E70864@u.library.Arizona.EDU>
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
To: "Han, Yan" <hany@u.library.arizona.edu>, netfilter@lists.netfilter.org

On November 5, 2003 06:40 pm, Han, Yan wrote:
> We use a linux server as a firewall and forward packets to different
> servers. In this case, we applied the iptables to forward packets from
> $Fido to $AtlasFtp for FTP. It is ok that we can log in the ftp server, but
> unable to do other things such as "ls", neither does Windows GUI FTP.
>
> Does anyone know why the FTP does not work? (we opened the port 20 and 21
> for FTP)? Is there something wrong with ports?
>
>
> ############    FTP   #########
>   iptables -t nat -A PREROUTING -i eth0 --dst $Fido -p tcp --dport
> $FTP_Port -j DNAT --to $AtlasFtp
> #    iptables -t nat -A PREROUTING -i eth0 --dst $Fido -p udp --dport
> $FTP_Port -j DNAT --to $AtlasFtp
>
>     iptables -t nat -A POSTROUTING -p tcp --dst $AtlasFtp --dport $FTP_Port
> -j SNAT --to-source $Fido
> #    iptables -t nat -A POSTROUTING -p tcp --dst $AtlasFtp --dport
> $FTP_Port -j SNAT --to-source $Fido
>
>     iptables -t nat -A OUTPUT --dst $Fido -p tcp --dport $FTP_Port -j DNAT
> --to-destination $AtlasFtp
>  #   iptables -t nat -A OUTPUT --dst $Fido -p udp --dport $FTP_Port -j DNAT
> --to-destination $AtlasFtp
>
>
>
> Yan
	
	I don't understand all your rules, but the only ones you should need are 
	the PREROUTING rules.  ip_conntrack_ftp and ip_nat_ftp should handle 
	the rest of that natively ... 

	You will need a rule in FORWARD to allow the connection through the firewall
	after the connection, ESTABLISHED,RELATED will handle the ftp connections.


	you need to insert 
	modprobe ip_conntrack_ftp 
	modprobe ip_nat_ftp
	
	if you're using a non-standard ftp port use
	modprobe ip_conntrack_ftp ports=(comma separated list of ports to max 5 
ports) 
	modprobe ip_nat_ftp ports=(comma separated list of ports to max 5 ports)

	(unhh .. that max number may be my kernel only....)
	

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

