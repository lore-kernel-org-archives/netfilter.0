From: mustafa hassan <mustafaazeem@yahoo.com>
Subject: iptables
Date: Thu, 26 Feb 2004 18:23:05 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040227022305.99743.qmail@web21106.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hi all
plz solve my problem bcuz i have to complete my
assignment
i m having a problem that when i make transparent
redirection with following command
#iptables -t nat -A PREROUTING -i eth0 -p tcp --dport
80 -j REDIRECT --to-port 80
i m getting an error message from squid as follow
when i try to access suppose
http://www.face-pic.com/dawson48
the squid gives me an error
----------------------------------------------------------------------------------------------------------------
While trying to retrieve the URL: /dawsoon48 

The following error was encountered: 

Invalid URL 
Some aspect of the requested URL is incorrect.
Possible problems: 

Missing or incorrect access protocol (should be
`http://'' or similar) 
Missing hostname 
Illegal double-escape in the URL-Path 
Illegal character in hostname; underscores are not
allowed 
-------------------------------------------------------------------------------------------------------------------------
it automatically eliminates the portion
http://www.face-pic.com
while if i set my browser to proxy then i dont get
this error instaed everything works fine
plz help me out

=====
Mustafa Hassan Malik
(Khadim Hussain)

Unix is very simple, but it takes a genius to understand the simplicity. (Dennis Ritchie) 





__________________________________
Do you Yahoo!?
Get better spam protection with Yahoo! Mail.
http://antispam.yahoo.com/tools

