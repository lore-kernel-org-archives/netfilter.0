From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: statefull filter for Inbound to FTP server (passive mode)
Date: Tue, 24 Aug 2004 16:11:52 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <412BAF18.1030503@pbl.ca>
References: <3.0.3.32.20040824172420.003df030@xxx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3.0.3.32.20040824172420.003df030@xxx>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Morvan wrote:
> To have an ftp server on a DMZ segment (behind the fw) I need to open 21/tcp, syn=1 and all ports above 1024/tcp, syn=1 to the FTP server IP. For me it is very bad because I have other services running on the ftp server box that cannot be reached by the world.
> 
> My question: There is and application filter extension for ftp_server that interact with iptables/ipfilter for handle dynamically inbound/reverse passive mode ftp connections based on a established ftp control channel (21/tcp), to a ftp server on the DMZ. (make statefull filtering based on the first connection established to 21/tcp port).
>  
> For example I only create the inbound rule in the fw for the ftp server in DMZ (allow any tcp 21 syn) an this application filter open the reverse socket for inbound passive connections, that require syn=1 in ports above 1024/tcp. So only sources that have a established ftp session (21/tcp) with the ftp server can see ports above 1024, and only the port handled by the control session on port 21/tcp.
> 
> PS:
> For outbound connections via NAT/iptables there is "ip_nat_ftp" module to make ftp clients to work in passive and port mode, OK! I want inbound statefull filtering for a ftp server.

It is done exactly the same way for inbound (server) as you would do for 
outbound (client) connections.  This is just a hint, modify to match 
your configuration/needs:

-A INPUT -p tcp --sport 1024: --dport 21 -m state --state 
NEW,ESTABLISHED -j ACCEPT
-A INPUT -p tcp --sport 1024: --dport 1024: -m helper --helper ftp -m 
state --state RELATED -j ACCEPT
-A OUTPUT -p tcp --sport 20 --dport 1024: -m helper --helper ftp -m 
state --state RELATED -j ACCEPT

Add additional options to restrict it further (interfaces, IP 
addresses/ranges, and so on) as you need.

You need to manually load ip_conntrack_ftp and/or ip_nat_ftp (depending 
if you need it to work over NAT) for above to work.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

