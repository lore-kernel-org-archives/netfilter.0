From: Morvan <mmuller@softplan.com.br>
Subject: statefull filter for Inbound to FTP server (passive mode)
Date: Tue, 24 Aug 2004 17:24:20 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3.0.3.32.20040824172420.003df030@xxx>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

To have an ftp server on a DMZ segment (behind the fw) I need to open 21/tcp, syn=1 and all ports above 1024/tcp, syn=1 to the FTP server IP. For me it is very bad because I have other services running on the ftp server box that cannot be reached by the world.

My question: There is and application filter extension for ftp_server that interact with iptables/ipfilter for handle dynamically inbound/reverse passive mode ftp connections based on a established ftp control channel (21/tcp), to a ftp server on the DMZ. (make statefull filtering based on the first connection established to 21/tcp port).
 
For example I only create the inbound rule in the fw for the ftp server in DMZ (allow any tcp 21 syn) an this application filter open the reverse socket for inbound passive connections, that require syn=1 in ports above 1024/tcp. So only sources that have a established ftp session (21/tcp) with the ftp server can see ports above 1024, and only the port handled by the control session on port 21/tcp.

PS:
For outbound connections via NAT/iptables there is "ip_nat_ftp" module to make ftp clients to work in passive and port mode, OK! I want inbound statefull filtering for a ftp server.


Thanks, 
Morvan


