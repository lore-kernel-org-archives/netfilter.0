From: Eric Constantineau <mekanik@nerim.net>
Subject: firewalling
Date: Tue, 18 Feb 2003 10:45:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E5200A1.CDFD3C90@nerim.net>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi everybody,

I run iptables in my "devil-linux" firewall but I still have some
questions.

I still have problems with FTP, it has to be set with "enable firewall
access" to be able to run well (I run cuteftp), passive mode or not.  I
want ftp to be transparent as if there were no firewall at all, so users
are not annoyed by settings...

Another thing is how could I set up a web server behind my firewall, I
read a bit about DNAT and SNAT, but still doesnt work from internet.  It
works inside, in the same LAN, but over the net, the server is
unreachable...

See the problem is, all my lan, including the firewall, has the same WAN
IP Address, lets say 1.2.3.4...  So when I connect to 1.2.3.4 with
destination port 80, with my DNAT settings :

iptables -t nat -A PREROUTING -d 1.2.3.4 -p tcp --dport 80 -j DNAT
--to-destination 4.3.2.1
it should redirect all packets to the web server lan ip(4.3.2.1)

then for the connexion within the LAN to this server I still have to add
this line :
iptables -t nat -A POSTROUTING -s 4.3.2.1 -p tcp --sport 80 -j SNAT
--to-source 1.2.3.4

I made that from scratch reading this quite good doc :
http://www.netfilter.org/documentation/tutorials/blueflux/iptables-tutorial.html

at 5.5.11. DNAT target
but still, doesnt work perfectly, :-(

Thanks for helping me out

Eric




