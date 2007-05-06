From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: Fw: conntrack and SIP
Date: Sun, 6 May 2007 11:54:26 -0300
Message-ID: <20070506115426.79246333@babalu.inexo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Hello

I posted this a few days ago and got no answers. Can anyone point me some
directions?

Regards

Ethy

Begin forwarded message:

Date: Thu, 3 May 2007 15:45:20 -0300
From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
To: netfilter@lists.netfilter.org
Subject: conntrack and SIP



Hello

I have these two SIP clients behind two linux NAT. they both connect to
the same server.

On client 1 I have:

udp      17 174 src=192.168.0.201 dst=X.X.X.X sport=5060 dport=5060
src=X.X.X.X dst=Y.Y.Y.Y sport=5060 dport=5060 [ASSURED] use=1 

Note that the sport and dport were not changed from in and out.

But on client 2:

udp      17 171 src=10.172.40.118 dst=X.X.X.X sport=5060 dport=5060
src=X.X.X.X dst=Z.Z.Z.Z sport=5060 dport=1024 [ASSURED] use=1 

What could cause the change in dport?? I have no SNAT or DNAT rules in any
of them.

Is that a way to copy the client 1 behavior to client 2?

Client 1 is iptables version 1.3.3 and kernel 2.4.33

Client 2 is iptables version 1.3.5 and kernel 2.4.33.3

-- 

Ethy H. Brito         /"\
InterNexo Ltda.       \ /  CAMPANHA DA FITA ASCII - CONTRA MAIL HTML
+55 (12) 3797-6860     X   ASCII RIBBON CAMPAIGN - AGAINST HTML MAIL
S.J.Campos - Brasil   / \ 



-- 

Ethy H. Brito         /"\
InterNexo Ltda.       \ /  CAMPANHA DA FITA ASCII - CONTRA MAIL HTML
+55 (12) 3797-6860     X   ASCII RIBBON CAMPAIGN - AGAINST HTML MAIL
S.J.Campos - Brasil   / \ 

