From: =?GB2312?B?xqTIy73c?= <pirenjie@gmail.com>
Subject: http redirect with mirror port
Date: Wed, 26 Jun 2013 11:16:01 +0800
Message-ID: <CAA5eC2Wyp5Beqr3NDy3uSAc3Y19nzfk8iy0xapd+y-9+zwMuhg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=1SQE7OpxdagypQS6zm8hfznsE4W61cTqBQnYUsWDatk=;
        b=BYvf2Jej3mCvqiJ4729zD/ejRZJYX0nTMOfp6CovMbgUTlBVCsjfTA35uJ51/Y5cCG
         iXLlIL6ezdrpGBQ1m1vKPzerA+JrZCcVpeDxFbHppZpxHOxsjZOd4HOaWC/cKA0yi2ij
         x3WNAgILnDC5M8DIVLPJOaWVqUpcgomBnCeqSqREyqaNO/SUl4l1xbAo/xpxs8uhJdD6
         U+87WktouqA80XHG+RX9AlBQg6apzgoeJqqgfIlYQC4v50rnIllaDRysdRrvykAE6gQO
         hiUklCSjLQ+3x8Ow/oI8m1yROFwnXbW4sHPL87UpzgkaUVLeYSglQI5cYJqY+CViSOyI
         +SBQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

     -----------
    (           )
   (   internet  )
    (            )
     -----------
         |
         |  +------------------------+
       e1|  |e3                      |eth1
    ----------- e0:mirroPort    ----------
   | ethSwitch |---------------| linuxBox |
    -----------            eth0 ----------
         |e2                        |eth2
         |                          |
    -----------                     |
   |    NAT    |                    |
    -----------                     |
         |                          |
         |                          |
    ------------                    |
   (  internal  )-------------------+
   (            )
    ------------


The 'ethSwitch' have 4 port: e0-e3. e1-e3 is normal port, e0 is
'mirrorPort' mirroring e2.
I run a proxyServer (Apache Traffic Server) in 'linuxBox' with
listening port 8080.
When host in 'internal' network access server in 'internet', I need
http traffic will
 be 'redirect' to the proxyServer in 'linuxBox', when proxyServer got
the httpRequest
 firstly, proxyServer will send back a httpRedirect with ip of 'eth2' via 'eth1'
 interface (because 'e0' is a mirrorPort, so 'linuxBox' must use
anothter interface 'eth1').
 After the host received the httpRequest response, it will start a new
request to 'eth2',
 so proxyServer can use it's cache to serve the request.

Now I don't know how to configure the 'ebtables' or/and 'iptables' in
the 'linuxBox' to implement it.
I am a newbie for the ebtables/iptables, please give me a help. Thanks.
