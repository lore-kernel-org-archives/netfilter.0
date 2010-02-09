From: paddy joesoap <paddyjoesoap@gmail.com>
Subject: How do you correctly interpret the FORWARD chain interface options?
Date: Tue, 9 Feb 2010 13:17:49 +0000
Message-ID: <ac5c74141002090517o5463ed02i3b8c52b553bb462d@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=dGRfr+bpI5NBb75FhL3PnFQbKEUXgJSN1CZ1VJgbjPE=;
        b=l+FvcloZmN86KBqtNuwVHaNVTKOEyv2SP3/exIQv/sPTshUY05QR5BeWFiL9eE3AiZ
         71nYXtgv9BpVN6qoxQW7zuTm2qlp3LX6smQz1MSsjEdtkY2Crq8lFPTA17NhPCeQfFyT
         xnDFR4pkDpWhMl0hrBfc6HDwzLOkZyBieiEzM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi All,

How should one interpret the inbound ("-i") and outbound ("-o") of the
FORWARD chain.

Suppose I have a firewall that protects a Web server and bearing in
mind the default deny policy is applied to the FORWARD chain which of
the following is correct?

External Firewall interface = eth0
Internal Firewall interface = eth1

(1)

iptables -A FORWARD -i eth0 -p tcp -d webServIP -j ACCEPT
iptables -A FORWARD -o eth1 -p tcp -s webServIP -j ACCEPT

where the "-i" is taken to mean inbound no matter what interface the
packet is sourced from and "-o" means outbound.

In that, Netfilter will see "-i" as coming from outside the network
and thereby will not expect to see "-o" rules for the same eth0
interface. Similarly, Netfilter knows that eth1 does not need to
specify -i rules and eth1 will be used for OUTBOUND traffic control.

(2)

iptables -A FORWARD -i eth0 -p tcp -d webServIP -j ACCEPT # only uses
inbound option
iptables -A FORWARD -i eth1 -p tcp -s webServIP -j ACCEPT # only used
inbound option !!!

where the second rule examines OUTBOUND traffic on the way in "-i" to
eth1. If this is ok, then its ok to be forwarded to the external
interface.


(3)

iptables -A FORWARD -i eth0 -p tcp -d webServIP -j ACCEPT # same interface
iptables -A FORWARD -o eth0 -p tcp -s webServIP -j ACCEPT # same interface

where the second rule examines OUTBOUND traffic on the same interface
used to look at inbound traffic.

(4)

iptables -A FORWARD -i eth0 -p tcp -d webServIP -j ACCEPT # inbound filtering
iptables -A FORWARD -i eth1 -p tcp -s webServIP -j ACCEPT # inbound
filtering of original outbound traffic
iptables -A FORWARD -o eth0 -p tcp -d webServIP -j ACCEPT # outbound
filtering of original inbound traffic
iptables -A FORWARD -o eth1 -p tcp -s webServIP -j ACCEPT # outbound filtering

where we must inspect traffic inbound on an interface and outbound on
the same interface.

Presumably, if traffic is inbound from the Internet towards the Web
server, it must be checked with the "-i" option on eth0. If it is
allowed then it will hit the internal interface before being handed to
the Web server. Does eth0 need to explicitly define an incoing and/or
outgoing rule for this inbound traffic so that the default FORWARD
policy does not reject the traffic?

regards,
Paddie.
