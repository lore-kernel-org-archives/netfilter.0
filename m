From: GMail Isaac Gonzalez <isaak.gonzalez@gmail.com>
Subject: POSTROUTING SNAT only reply packets
Date: Mon, 17 Jan 2011 11:16:48 +0100
Message-ID: <4D341710.60509@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :subject:content-type:content-transfer-encoding;
        bh=QkmbOpMTpTfehQnBb9QLRT6sDn5O9x3gmmCgiXqAFug=;
        b=OPTIyS9+Qdt3529ZAsROIRq6lDhUF7bJcEagWzBoyiFRWfMQ+knLCZKzh8QaXp3VNA
         67F96LJFhFOurgdG+Hz61TXHag28lpkLXYPjQxk6587BglHP7VnyI0KCuEJYh0bl4fJz
         GK+N70SoRtwzmvmrGwwOT+9N7U6CbhY6qgeIQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I need to modify the reply packets of one web server to allow the=20
connections between a webserver and client using a load balancer.

The client connections goes to a load balancer, the load balancer=20
forwards the connection to a one web server changing the destination ip=
,=20
the web server anwser the client with it's own ip address without=20
passing again for the load balancer. In order to stablish the=20
connection, the client needs to receive the web server answer with the=20
correct ip address (in this case, the load balancer VIP address), in=20
other case it receives ACK that it doesn't know about it and the=20
connections is not ESTABLISHED.

I've doing some testing and seems that iptables only do SNAT on NEW=20
connections, and I need to change the ip address of replied packets.=20
Anybody know some workaround? If anobody do not know some workaround ca=
n=20
you confirm that it's not posible to do this with iptables?

I've tried the next ip tables rules and only work when I do NEW=20
connections from the web server.

-A POSTROUTING -o br0 -s WE_SERVER_ADDR -p tcp -m tcp --sport 80 --dpor=
t=20
1024:65535 -j SNAT --to-source LOAD_BALANCER_ADDR

Thanks in advance.

Isaac Gonz=E1lez
