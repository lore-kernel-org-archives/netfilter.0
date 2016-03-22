From: Christian Robottom Reis <kiko@acm.org>
Subject: Packets (sometimes) not marked as RELATED/ESTABLISHED
Date: Tue, 22 Mar 2016 15:55:31 -0300
Message-ID: <20160322185530.GA3152@anthem.async.com.br>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello there,

    In periodically looking at my firewall logs I've always noticed that
from time to time a certain pattern will show up in my logs which
indicates that a legitimate stream which should have been marked
RELATED/ESTABLISHED isn't. I have the following rules set up to allow
related incoming traffic:

    -A INPUT -i eth3 -p tcp -m tcp --dport 10000:65535
        -m state --state RELATED,ESTABLISHED -j ACCEPT
    -A INPUT -i eth3 -p tcp -m tcp --sport 10000:65535
        -m state --state RELATED,ESTABLISHED -j ACCEPT

AIUI this is what allows the response from a website request to be
targeted ACCEPT in the INPUT chain. However, my logs show that sometimes
this doesn't work. Here's a recent example:

    [89003.161127] IN=eth3 OUT= MAC=XXX SRC=104.73.89.127 DST=XXX
    LEN=1472 TOS=0x00 PREC=0x00 TTL=53 ID=10958 DF PROTO=TCP SPT=80
    DPT=44709 WINDOW=3775 RES=0x00 ACK URGP=0 

    [89003.497964] IN=eth3 OUT= MAC=XXX SRC=104.73.89.127 DST=XXX
    LEN=1472 TOS=0x00 PREC=0x00 TTL=53 ID=17058 DF PROTO=TCP SPT=80
    DPT=44710 WINDOW=3385 RES=0x00 ACK URGP=0 

    [89049.561143] IN=eth3 OUT= MAC=XXX SRC=104.73.89.127 DST=XXX
    LEN=1472 TOS=0x00 PREC=0x00 TTL=53 ID=26347 DF PROTO=TCP SPT=80
    DPT=44932 WINDOW=1062 RES=0x00 ACK URGP=0 

That specific host [1] is likely a web CDN node, and the fact that it's
an ACK coming from SPT 80 indicates that this is just a plain response
to a web request from an internal client. The question is: why didn't it
get connection-tracked?

Has anyone else noticed this in their logs? It's easy to find this by
just grepping for ACKs -- it makes up more than 50% of my logged
entries, it's almost completely traffic coming from port 80 and 443.

[1] 104.73.89.127 is a104-73-89-127.deploy.static.akamaitechnologies.com.
-- 
Christian Robottom Reis | [+55 16] 3376 0125   | http://async.com.br/~kiko
                        | [+55 16] 991 126 430 | http://launchpad.net/~kiko
