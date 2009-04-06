From: Pranav Desai <pranavadesai@gmail.com>
Subject: Need some suggestions for doing l7 routing
Date: Sun, 5 Apr 2009 19:07:37 -0700
Message-ID: <cc64e8ce0904051907k5c29bb34kb101f4e2f8d9ae3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=+PgbL5UgSvlAu10LE110r4SN4Z0oqaZInNjd80vABAA=;
        b=amcP/t/vvS5X8IYRVPoiJb7Xo4+vsKaJO2jbao3VXpBatVXxAHiH6rK5NBJQlv/JoJ
         +T6wYYm/MHbgVs3AsUbu9Yh35T2ZIAuGCLwzRphAapmucdVyBbi1n/1utxgyyYYl4dJc
         0voN6UBJNMsw1DJt5ffWrmRsm+YBjjPkXMfpo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hello All,

I have a squid proxy running in transparent mode so the destination of
the pkts is the origin server. I dont want squid to handle all the
traffic coming to the machine, so I am trying to do some layer 7
routing of HTTP flows based on the GET request to either the local
stack or forward it as is for the origin server.

I am thinking that I can use an iptables/kernel netfilter module like
string match to capture the flows I am interested in and route it up
the stack. The problem I see is that the connection is already
established by the time I see the GET request, either to the origin
server (in case I forward the pkts) or to the local stack (in case
squid handles it) but I want that decision to be made based on the GET
request, so does that mean I have to save the connection packets and
replay them to either the origin server or the local stack ?

The other options I can think of is to accept the connection from the
client and establish another connection to the origin server, so make
the kernel like a TCP proxy and handle it that way without involving
the application layer.

Is this feasible ?
Are there a better way of doing this ?

I understand that it can be done fairly easily in the application
itself, but I want to avoid the uncessary load on the application for
traffic that it doesnt need to handle. Also I think it can be done
much faster in the kernel itself especially when both the options,
forwarding and redirect (iptables -j REDIRECT) are available
independently, but the problem is that they need to be applied based
on some pkts which come in after the connection is established.

Sorry for the long email and thank you for your time. Please let me
know if I can provide any more information that might be useful.

-- Pranav
