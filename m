From: Paul Jakma <paulj@alphyra.ie>
Subject: ftp nat and non-standard ports
Date: Wed, 16 Jul 2003 18:29:29 +0100 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0307161829250.28436-100000@dunlop.admin.ie.alphyra.com>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hi,

i'm trying to get NAT working for FTP, where the FTP server is on a
non-standard port. ie:

    client------Linux-------FTP server

the linux machine is (should) NAT the data connection from the client.

The NAT in general is working fine, icmp, client->ftp server command
channel, etc. What is not working is the ftp data channel. the FTP
server is on port 6370, and i have the following in modules.conf:

options ip_conntrack_ftp ports=21,6370
options ip_nat_ftp ports=6370,21

I have the following rule in the nat table:

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination         
SNAT       all  --  anywhere             10.118.248.161 to:10.118.251.90 

What i see if i tcpdump on the linux box the link to the ftp server is:

client 				server
        <normal FTP command channel initiation>
	<Site features negotiated, CWD sent, etc..>

10.118.251.90:33698
  PORT a,b,c,d,131,164          
                                10.118.248.161:6370
                                  port accepted.           

10.118.251.90:33698
  LIST
			        10.118.248.161:6369 -> 10.118.251.90:33700
                                  SYN

				  SYN

				  <etc>

The data channel does not get NATed back to the client.

What exactly am i doing wrong?

regards,
-- 
Paul Jakma	Sys Admin	Alphyra
	paulj@alphyra.ie
Warning: /never/ send email to spam@dishone.st or trap@dishone.st



