From: "Giovanni Costagliola" <giovanni.costagliola@nexusat.it>
Subject: [semi-OT]: Transparent proxy: SQUID & IPTABLES
Date: Thu, 23 Sep 2004 09:36:48 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409230802.KAA09921@mail.nexusat.it>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello all,

            I'm attempting to configure a transparent proxy on my lan.

 

Default gateway and proxy reside on the same machine.

 

I issued the following iptables command:

 

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT
--to-ports 8080

 

where interface eth0 is the one that gateways internal clients.

 

I receive a stupid message by squid caused by incorrect URL syntax.

 

It seems that getting an URL such as:

 

http://www.google.it/search?sourceid=navclient
<http://www.google.it/search?sourceid=navclient&hl=it&ie=UTF-8&q=foobar>
&hl=it&ie=UTF-8&q=foobar

 

reach Squid layer as

 

/search?sourceid=navclient&hl=it&ie=UTF-8&q=foobar

 

Missing of the protocol and host part!

 

How is it possible?

 

cya

*g

  :\ Giovanni Costagliola
_______________________
The worst disease for a thinking male?
Deductio Precox
   -- *g

 

