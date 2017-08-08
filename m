From: J Doe <general@nativemethods.com>
Subject: Question regarding meta skuid
Date: Tue, 8 Aug 2017 17:01:46 -0400
Message-ID: <5EB94417-274C-45CD-BA35-B7C545491C34@nativemethods.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I am currently experimenting with nftables syntax for a LAMP web server.

Initially I used the following rules:

add rule filter input tcp dport { http, https } ct state new,established,related accept
add rule filter output tcp sport { http, https } ct state established,related accept

I then though it would be good to limit traffic to processes with specific user ids.  In the case of the webserver this would be "root" as well as "www-data".

This works on outbound traffic:

add rule filter output tcp sport { http, https } meta skuid { root, www-data } ct state established,related accept

...but when I attempt to limit inbound traffic to processes that are run on the *SERVER* as either "root" or "www-data":

add rule filter input tcp dport { http, https } meta skuid { root, www-data } ct state new,established,related accept

...a web client cannot complete the connection.

When I remove the "meta skuid { root, www-data }" from the inbound rule, everything is ok.

I am assuming this is because nftables cannot determine what process was the originator of the inbound traffic.  That makes sense, but what I'd like to know is there a way to limit *INBOUND* traffic to only specific processes ?  In that case, allow inbound HTTP/S traffic *ONLY* to processes running under "root" or "www-data" as opposed to knowing that the traffic originated from the *CLIENT* as "root" or "www-data" ?

Thanks,

- J


