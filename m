From: "Piszcz, Justin" <jpiszcz@servervault.com>
Subject: RE: Active and Passive FTP
Date: Tue, 17 May 2005 12:28:22 -0400
Message-ID: <F8B974E70BDE1745ABB27AF04788FA005641BD@mail1.dulles.sv.int>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Robert Becskei <brobiwbe@stcable.co.yu>, netfilter@lists.netfilter.org

The FTP connection tracker in the linux kernel can take care of active
FTP sessions.


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Robert
Becskei
Sent: Tuesday, May 17, 2005 12:27 PM
To: netfilter@lists.netfilter.org
Subject: Active and Passive FTP

Hello everyone ,

my clients access the internet like this

client --- proxy server --- eth0 firewall eth1 ----internet

in squid.conf I told squid to always direct allow ftp...

in iptables I've did the following modifications...

iptables -A INPUT -i eth1 -p tcp --sport 21 -m state --state ESTABLISHED
-j=20
ACCEPT
iptables -A INPUT -i eth1 -p tcp --sport 20 -m state --state=20
ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --sport 1024:65535 --dport 1024:65535
-m=20
state --state ESTABLISHED -j ACCEPT

iptables -A OUTPUT -o eth1 -p tcp --dport 21 -m state --state=20
NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth1 -p tcp --dport 20 -m state --state
ESTABLISHED -j=20
ACCEPT
iptables -A OUTPUT -o eth1 -p tcp --sport 1024:65535 --dport 1024:65535
-m=20
state ESTABLISHED,RELATED -j ACCEPT

passive ftp works... but I cannot get active to work I always get a

 200: SWITCHING TO ASCII MODE
 500: ILLEGAL PORT COMMAND
 500: Unknown COMMAND

what did I mess up ? is there a way to get active working as well...are
the=20
above rules correct ? eth1 is my outside interface...the proxy server=20
connects to eth0 directly

Sincerely
Robert B=20



