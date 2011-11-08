From: zhen xue <zhenxue@yahoo.com>
Subject: HELP! problem using netfilter_queue to nat packets in user space
Date: Tue, 8 Nov 2011 14:34:29 -0800 (PST)
Message-ID: <1320791669.60416.YahooMailNeo@web31811.mail.mud.yahoo.com>
Reply-To: zhen xue <zhenxue@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1320791669; bh=HPnmD8vbGoTFuJD2kYL2dV/6/RE6Ro7iTab3a63o4vA=; h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=VFPMGR2URPQrYKaKN//wLJQQlyUgovOYZ8uCJjDWz5nbzlt0ScmbZ65vHWvocnWkpYsd+D07OsQ4kV3isEcSn27j2VZkf87C1Le9xAcT0LbsrLOqN7FI4MGt4+T2RqvMJVRIWjYB6iluIm6NN58NvhBO1RBZfl/XrmPp0T5k8l0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I am working on a proxy agent that will be running on
client=E2=80=99s local machine, all connections to internet servers wil=
l be first sent
to the local proxy, then the local proxy will make connections to the i=
nternet
server and send data back to local client application.
=C2=A0
Client
machine=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0inter=
net
server
Web browser< -> proxy =C2=A0=C2=A0=C2=A0=C2=A0<-
-------------=C3=A0 server
=C2=A0
The proxy is running as localhost:proxy_port
=C2=A0
I use netfilter_queue to act as the proxy. I have these
rules to direct traffic to user space:
iptables -t raw -A OUTPUT -p tcp -j NFQUEUE --queue-num 0
iptables -t raw -A PREROUTING -p tcp -j NFQUEUE --queue-num
0
(also tried filter table with INPUT and OUTPUT chains, it is
having the same problem below)
=C2=A0
Then the user space program will nat traffic:
If out-going packet
client:client_port->server:server_port
DNAT the packet
client:client_port->localhost:proxy_port
User raw socket to send natted
packet to local proxy (I also tried set_verdict NF_ACCEPT, but it did n=
ot work)=20
If incoming packet from proxy
localhost:proxy_port->client:client:port
=C2=A0=C2=A0 SNAT the packet server:server_port ->
client:client_port=20
=C2=A0=C2=A0=C2=A0Set verdict NF_STOP to pass on the packet
to stack (also tried NF_ACCEPT, but it did not work)
=C2=A0
Thing are basically working until the server closes the
connection.
Server sends FIN to local proxy, local proxy pass on the FIN
to client application, localhost:proxy_port->client:client_port(FIN), t=
hen
this FIN is SNATed to local client to look like a FIN from server,
server:server_port->client:client_port, after setting verdict NF_STOP a=
nd
realeasing the FIN to stack, I expect to get back an ACK for the FIN wh=
ich
looks like client:client_port->server:server_port, HOWEVER, the stack i=
s
sending an ACK like client:client_port->localhost:server_port. I don=E2=
=80=99t know
what I am missing here!!
=C2=A0
Basically after I natted the packet in netfilter_queue user
space program, I don=E2=80=99t know how to pass/reinject it to the stac=
k.
=C2=A0
Any help will be highly appreciated!!!
