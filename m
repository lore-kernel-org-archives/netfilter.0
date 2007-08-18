From: Richard <netfilter@ghz.fr>
Subject: IPtables settings to access a backup FTP
Date: Sat, 18 Aug 2007 21:08:59 +0200
Message-ID: <46C743CB.801@ghz.fr>
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

Hello, this is my first message so I hope I'm doing this right ! :)

I've got iptables setup and running well on my server and up to now I've 
not had any problems, however I have just installed a backup system 
which needs to connect by FTP to a distant server.

With my firewall disactivated all works fine, however with the firewall 
activated when I use the "ls" command of the debian ftp command line 
package (CWD) I get:

200 ok then a long wait then :
421 Service not available, remote server has closed connection.

I've tried this on two different FTP's and it only works if the firewall 
is disactivated.

One server is a plesk server but the server I need to connect to I do 
not know much about, with filezilla on my pc I've managed to connect to 
it with both FTP active and FTP passive so I guess it can do both.

On my server I just do :

ftp ftp.server.com
username
password

So I'm not sure if it connects as passive or active.

These are the ports that I have got open :

-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

-A INPUT -p tcp -m tcp --dport 20 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 21 -j ACCEPT

-A OUTPUT -p tcp -m tcp --dport 20 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 21 -j ACCEPT

Which ports do you suggest I should open to connect to this FTP server ?

Thanks in advance,

Richard


