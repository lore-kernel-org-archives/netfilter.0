From: Petr Titera <P.Titera@century.cz>
Subject: Problems with passive FTP server behind firewall
Date: Tue, 28 Oct 2003 18:36:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F9EA91A.9080800@century.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

I have problems with FTP server placed behind NAT firewall. When client uses 
passive connection to connect to server, data connection between server and 
user is not properly NATed.

Example:
In my configuration I have FTP server in NATed DMZ internal address is 
192.168.0.2, external is x.x.x.x if I connect from host y.y.y.y using passive 
connection and try to list directory I get this trace on firewall:

20:19:08.018386 y.y.y.y.62096 > x.x.x.x.ftp: P 3502261192:3502261198(6) ack 
2505415461 win 17520 [tos 0x10]
20:19:08.039480 x.x.x.x.ftp > y.y.y.y.62096: P 1:50(49) ack 6 win 5840 (DF)
20:19:08.077720 y.y.y.y.62093 > x.x.x.x.23519: S 2350058845:2350058845(0) win 
16384 <mss 1460,nop,wscale 0,nop,nop,timestamp 0 0>
20:19:08.078189 192.168.0.2.23519 > y.y.y.y.62093: S 60330289:60330289(0) ack 
2350058846 win 5 (DF)
20:19:08.273674 y.y.y.y.62096 > x.x.x.x.ftp: . ack 50 win 17520 [tos 0x10]
20:19:14.082245 y.y.y.y.62093 > x.x.x.x.23519: S 2350058845:2350058845(0) win 
16384 <mss 1460,nop,wscale 0,nop,nop,timestamp 12 0>
20:19:14.082781 192.168.0.2.23519 > y.y.y.y.62093: S 66334872:66334872(0) ack 
2350058846 win 5 (DF)

Interesting is, that connection tracking works properly, because replies from 
FTP server looks good:

ftp> dir
227 Entering Passive Mode (x,x,x,x,91,223)
ftp: connect: Connection timed out
ftp>

(server replies with external address of FTP server, but after tha connection 
times out)

When I use active connection on server, everything works as expected.
In kernel 2.4.18 (previous one which I had on firewall) passive connections to 
server works as expected.

I can provide more information on request.

Petr Titera



