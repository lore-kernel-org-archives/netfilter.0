From: Bala <egrpbala@yahoo.com>
Subject: DNAT on single NIC
Date: Sun, 6 Feb 2005 23:24:03 -0800 (PST)
Message-ID: <20050207072403.52817.qmail@web54504.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi All,
       Is it possible to setup DNAT on single NIC?

       I am trying to setup DNAT in my 
DMZ machine to access local webserver(private UP) 
having single NIC and pulic IP

 with

iptables  -t nat -I PREROUTING -i eth0 -p tcp --dport
80  -j DNAT --to-destination 10.62.100.98:80

iptables -I FORWARD -i eth0 -p tcp -d 10.62.100.98
--dport 80 -j ACCEPT

is it correct??, I can't access local(private IP)
web server, if I remove the rules I can reach public
IP
DMZ machine from internet.

thanks in advance,
-bala-




		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - Easier than ever with enhanced search. Learn more.
http://info.mail.yahoo.com/mail_250

