From: Frank Smith <fsmith@hoovers.com>
Subject: Re: iptables ftp problems; unable to "ls"
Date: Wed, 05 Nov 2003 18:03:53 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <99330000.1068077032@hoovers-59.hoovers.com>
References: <BEA73FB6B8F62545A5B2818724D0DF2902E70864@u.library.Arizona.EDU>
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

--On Wednesday, November 05, 2003 16:40:05 -0700 "Han, Yan" <hany@u.library.arizona.edu> wrote:

> 
> We use a linux server as a firewall and forward packets to different
> servers. In this case, we applied the iptables to forward packets from $Fido
> to $AtlasFtp for FTP. It is ok that we can log in the ftp server, but unable
> to do other things such as "ls", neither does Windows GUI FTP.
> 
> Does anyone know why the FTP does not work? (we opened the port 20 and 21
> for FTP)? Is there something wrong with ports? 
> 
> 
>############    FTP   #########
>   iptables -t nat -A PREROUTING -i eth0 --dst $Fido -p tcp --dport $FTP_Port
> -j DNAT --to $AtlasFtp
>#    iptables -t nat -A PREROUTING -i eth0 --dst $Fido -p udp --dport
> $FTP_Port -j DNAT --to $AtlasFtp
> 
>     iptables -t nat -A POSTROUTING -p tcp --dst $AtlasFtp --dport $FTP_Port
> -j SNAT --to-source $Fido
>#    iptables -t nat -A POSTROUTING -p tcp --dst $AtlasFtp --dport $FTP_Port
> -j SNAT --to-source $Fido
> 
>     iptables -t nat -A OUTPUT --dst $Fido -p tcp --dport $FTP_Port -j DNAT
> --to-destination $AtlasFtp
>  #   iptables -t nat -A OUTPUT --dst $Fido -p udp --dport $FTP_Port -j DNAT
> --to-destination $AtlasFtp
> 
> 
> 
> Yan 

You need to add a state RELATED rule to allow the data connection
opened back to the client, or use passive mode FTP.

Frank


-- 
Frank Smith                                      fsmith@hoovers.com
Systems Administrator                           Voice: 512-374-4673
Hoover's Online                                   Fax: 512-374-4501


