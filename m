From: "Aaron Gray" <angray@beeb.net>
Subject: Can I use ip_conntrack_ftp on a server firewall ?
Date: Fri, 16 Dec 2005 23:44:50 -0000
Message-ID: <004301c6029a$b49f8490$0200a8c0@AMDADVENT>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Netfilter List <netfilter@lists.netfilter.org>

I have a RedHat 9 and Fedora Core 4 Servers I am setting up. I am using an 
FTP demon on the server, Apache mod_ftpd, but when enabled the firewall is 
blocking the FTP connection.

How do I create rules to allow FTP passive and active connections to the 
server ?

Do I use ip_conntrack_ftp or can I just create some rules that will do the 
job ?

Many thanks in advance,

Aaron 


