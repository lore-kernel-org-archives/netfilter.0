From: "Nathan Cassano" <nathan@cjhunter.com>
Subject: TCP delay, SMTP errors
Date: Mon, 10 Jun 2002 13:45:50 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <001601c210bf$d1a5fef0$2901a8c0@amos>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org


Hi folks,
	Our website (on an internal NAT'ed network) connects our email
server (on an external network). The website uses a SMTP PHP class to
send mail using socket connections. The problem is a delay in connecting
to the mail server that causes the class to quit prematurely. I fixed
the problem by adding a function call to sleep(1) after fsockopen() but
this is a hack. Is there a better way to fix this TCP delay? I tried
setting the TOS value to Minimize-Delay but I didn't see any difference.
Any suggestions are welcome. 

Nathan

PHP script 
<?php

$this->connection = fsockopen("mail.server.tld", 25, $errno, $errstr,
30);

socket_set_timeout($this->connection, 10, 0);

$smtp_greeting = fgets($this->connection, 512);

?>

$IPTABLES -A OUTPUT -t mangle -p tcp --dport 25 -j TOS --set-tos
Minimize-Delay


