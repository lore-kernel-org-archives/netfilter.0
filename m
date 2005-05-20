From: traef06@ebasedsecurity.com
Subject: iptables, squid and snort
Date: Fri, 20 May 2005 05:59:55 -0700
Message-ID: <54f57934192f4d889e54ba50bf6b3077@ebasedsecurity.com>
Reply-To: traef06@ebasedsecurity.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

I am trying to put together a system with Debian 2.6 kernel, iptables 1.3.1=
, squid and snort all on one box.=0D=0A(it's for a very small network 8 - 1=
0 PCs)=0D=0A=0D=0AMy question is this, if I put this into my iptables rules=
;=0D=0A=0D=0Aiptables -t nat -A PREROUTING -i eth0 -s 192.168.0.1 -p tcp --=
dport 80 -j ACCEPT=0D=0Aiptables -t nat -A PREROUTING -i eth0 -p tcp --dpor=
t 80 -j DNAT --to 192.168.0.1:3128=0D=0A=0D=0Awill this traffic then pass t=
hrough the OUTPUT chain before it leaves the firewall so then I can put:=0D=
=0A=0D=0Aiptables -A OUTPUT -p tcp --dport 80 -j QUEUE=0D=0A=0D=0Aafter the=
 above so that snort-inline will monitor all outgoing port 80 traffic after=
 it's been "squidded"?=0D=0A=0D=0APlease help with any other suggestions on=
 how to do this better.=0D=0A=0D=0AThank you in advance.=0D=0A=0D=0A=0D=0AT=
homas J. Raef=0D=0Ae-Based Security, Inc.=0D=0A"You're either hardened, or =
you're hacked!" 




