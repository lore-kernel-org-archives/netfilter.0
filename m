From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: pb : iptables - redirection - prerouting
Date: Mon, 3 May 2004 15:19:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405031519.36791.Antony@Soft-Solutions.co.uk>
References: <1665.80.119.127.166.1083557070.squirrel@poste.isima.fr>
Reply-To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1665.80.119.127.166.1083557070.squirrel@poste.isima.fr>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On Monday 03 May 2004 5:04 am, marquis@poste.isima.fr wrote:

> Hello
>
> I have installed an ftp server on 192.168.0.25 port 6666 mode PASV.
> I can connect myself from 192.168.1.36 with giving 192.168.0.25 as server
> IP. I cannot connect myself from 192.168.1.36 giving one of the FireWall
> IPs. Normal ! I must use prerouting utility to redirect packets.
> To do prerouting of anyone to my ftp server (192.168.0.25), I do this :
>
> $IPTABLES -A FORWARD -p tcp --dport 6666 -j ACCEPT
> $IPTABLES -A FORWARD -p tcp --dport 60100:60200 -j ACCEPT
>
> $IPTABLES -A PREROUTING -t nat -p tcp --dport 6666 -j DNAT
> --to-destination 192.168.0.25
> $IPTABLES -A PREROUTING -t nat -p tcp --dport 60100:60200 -j DNAT
> --to-destination 192.168.0.25
>
> but it doesn't work : I can even not connect to the ftp server !
>
> Could you help me ?

Perhaps the FTP server is not using a port in the range 60100-60200 for the 
second channel connection?

Antony.

-- 
G- GIT/E d- s+:--(-) a+ C++++$ UL++++$ P+(---)>++ L+++(++++)$ !E W(-) N(-) o? 
w-- O !M V+++(--) !PS !PE Y+ PGP+> t- tv@ b+++ DI++ D--- e++>+++ h++ r@? 5? 
!X- !R K--?

                                                     Please reply to the list;
                                                           please don't CC me.


