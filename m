From: Dimitri Yioulos <dyioulos@onpointfc.com>
Subject: Dropping brute force attacks
Date: Thu, 10 Jan 2013 13:55:12 -0500
Message-ID: <201301101355.12763.dyioulos@onpointfc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

Hello, all, and Happy New Year.

A few weeks ago I added a post about how to tweak the set up 
of rules to  drop the ip addresses of machines trying to do 
a brute force login via ipop3d.  What I've noticed is that 
few, if any, addresses are being dropped.  Fortunately, I 
have fail2ban installed on our mail server, so the attacks 
are being blunted.  Still, I'd like to cut these attacks 
off at the pass, so to speak.  With you kind indulgence, 
allow me to provide information on my set-up again so that 
perhaps someone can help me get this working properly.

Our mail server sits in a DMZ; NAT and Forward rules are in 
place to make the mail server work (and it does, very 
well).  So, what I did was set the Forward rules to jump to 
a chain I created called "block_email_brute" (the name 
sucks, but, hey).  Here are the rules:

block_email_brute  tcp  --  anywhere             
server.mydomain.com tcp dpt:pop3

block_email_brute  tcp  --  anywhere             
server.mydomain.com tcp dpt:smtp

And here are the rules in the "block_email_brute" chain:

           tcp  --  anywhere             server.mydomain.com 
tcp dpt:pop3 state NEW recent: SET name: DEFAULT side: 
source

LOG        tcp  --  anywhere             server.mydomain.com 
tcp dpt:pop3 state NEW recent: UPDATE seconds: 60 
hit_count: 6 TTL-Match name: DEFAULT25 side: source LOG 
level info prefix `Anti Email Bruteforce: '

DROP       tcp  --  anywhere             server.mydomain.com 
tcp dpt:pop3 state NEW recent: UPDATE seconds: 60 
hit_count: 6 TTL-Match name: DEFAULT side: source

           tcp  --  anywhere             server.mydomain.com 
tcp dpt:smtp state NEW recent: SET name: DEFAULT25 side: 
source

LOG        tcp  --  anywhere             server.mydomain.com 
tcp dpt:smtp state NEW recent: UPDATE seconds: 60 
hit_count: 6 TTL-Match name: DEFAULT25 side: source LOG 
level info prefix `Anti Email Bruteforce: '

DROP       tcp  --  anywhere             server.mydomain.com 
tcp dpt:smtp state NEW recent: UPDATE seconds: 60 
hit_count: 6 TTL-Match name: DEFAULT25 side: source

ACCEPT     tcp  --  anywhere             anywhere            
tcp flags:SYN,RST,ACK/SYN

ACCEPT     tcp  --  anywhere             anywhere            
tcp state RELATED,ESTABLISHED

I realize that port 110 is the one being attacked, but I 
added 25 just for good measure.

I hope the above information is clear and complete enough.  
Your help is greatly appreciated.

Dimitri

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

