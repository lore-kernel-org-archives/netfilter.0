From: Jukka Laaksola <jukka.laaksola@netland.fi>
Subject: ip_nat_ftp and TCP retransmission
Date: Thu, 21 Sep 2006 10:04:27 +0300
Message-ID: <4512397B.8090409@netland.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi!

We have problems with ftp client behind NAT. Our firewall is Debian 
sarge with iptables version 1.2.11-10. ip_nat_ftp module seems to work 
usually perfect but sometimes active ftp fails.

In our case there are many PORT-commands in FTP session and those PORT 
commands ip and host parameters are changed correctly by ip_nat_ftp 
module. But occasionally the ftp client behind the NAT does not get 
enough soon response to PORT port command from public ftp server. Then 
the client does retransmission on PORT command. ip_nat_ftp does not 
change the server ip and port of those retransmissed PORT commands.

Something like that:
----8<----
220 OPNET FTP server OK
USER anonymous
200 Command OK.
PORT x,y,z,162,19,201
200 PORT command successful.
STOR ASIAKAS
150 Opening data connection.
226 Transfer complete.
200 PORT command successful.
RETR AINEISTO
150 Opening data connection.
226 Transfer complete.
PORT x,y,z,162,20,86
200 PORT command successful.
STOR PALVELU
150 Opening data connection.
226 Transfer complete.
PORT x,y,z,162,20,87
200 PORT command successful.
RETR AINEISTO
150 Opening data connection.
226 Transfer complete.
PORT x,y,x,162,20,88
PORT 192,168,1,59,20,88
----8<----


The x,y,z,162 is our public IP and the 192.168.1.59 is IP of the FTP 
client. The ftp client is bank software client and there comes 
communication failure at those retransmission. The ftp server closes the 
connection after retransmission because of the PORT command with private IP.

Is there anything we can try to correct the problem?

Thanks

-- 
Jukka Laaksola
Netland Oy

