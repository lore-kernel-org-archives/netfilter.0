From: "J. Bakshi" <joydeep@infoservices.in>
Subject: A very basic chain question
Date: Mon, 07 Sep 2009 12:28:29 +0530
Message-ID: <4AA4AF15.8000602@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello list,

Please bother  with me as this time I have a very basic question about
iptables chain and I have not found any answer yet.  I am in a process
to create a complex  ssh checking rule where conditions are checked one
by one and finally the valid packets are accepted.  The scenario is like

````````````
check limit ( say 10/min) --> check connlimit ( 2 per ip ) --> check
hashlimit ( 2 attempt per min) ---> ACCEPT.
````````````````````

I have made a chain called sshrate but don't find the way to append the
rules in that chain one by one. If I simply append the rules as accept
then the very first rule is working bypassing the other two and my
objective is to pass the rules in a pipe one by one and finally accept
the valid packets. Could any one enlighten me in that direction ?

Thanks
