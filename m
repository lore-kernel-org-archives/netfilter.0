From: kate <kate7234@yahoo.com>
Subject: managing LOG files
Date: Fri, 22 Oct 2004 09:40:33 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041022164033.12322.qmail@web21523.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

I have a firewall script that only allows
pre-determined Ip addresses to attempt logon.
Allowable access gets logged in /var/log/secure while
TCP rules dump all other traffic, and get LOGGED in
/var/log/messages. - This is a Home LAN, and that's a
lotta data !

Is there a way of redirecting all this to a separate
file? Is there a better way to deal with all this?

my rules include-

# LOG rules go to /var/log/messages
iptables -A INPUT -m limit --limit 1/sec --limit-burst
3 -j \
	LOG --log-level 4 --log-prefix "FW DROP INPUT: "

thanks in advance
kate


		
__________________________________
Do you Yahoo!?
Yahoo! Mail Address AutoComplete - You start. We finish.
http://promotions.yahoo.com/new_mail 

