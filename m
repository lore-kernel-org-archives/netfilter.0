From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: Simple question about ip range
Date: Mon, 29 Jun 2009 21:14:18 +0100 (WEST)
Message-ID: <2464.89.180.68.200.1246306458.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi people,
Sorry about this super basic question, how do i specify a ip range? For
example for a rule like this:

iptables -A INPUT -p tcp --dport 80 -s 192.168.1.211-219 -d 192.168.1.206
-j ACCEPT

I just want to allow the ip's 192.168.1.211 till .219.
What would be the correct syntax?

Jorge,

