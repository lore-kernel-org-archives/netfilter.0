From: "J. Bakshi" <joydeep@infoservices.in>
Subject: how to clean up old entries from ipt_recent ?
Date: Mon, 07 Sep 2009 15:42:07 +0530
Message-ID: <4AA4DC77.2080409@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello Pascal,

I don't know if I should create a new thread or continue with this one.
But this is a new issue though a continuation of ipt_recent and blacklist.
My script to show the blacklisted ip is running well. During my
experiment with blacklist I have found that blacklisted ips are still
there at

/proc/net/ipt_recent/blacklist

Even after the blacklist interval the client can access the server
successfully; the server still shows the client ip as blacklisted.
Definately the ip can be removed or "clear" as described in the man page
but storing the ip permanently at  /proc/net/ipt_recent/blacklist  is 
very confusing.  How can you then check if the ip is still blacklisted
or able to communicate with the server in real-life  ?

