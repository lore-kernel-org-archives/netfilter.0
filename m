From: "hard__ware" <hard__ware@hotmail.com>
Subject: Nat OUTPUT chain
Date: Sun, 16 Jun 2002 09:57:35 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <OE35qimrMh0R1hY55Zo00015235@hotmail.com>
Reply-To: "hard__ware" <hard__ware@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

this question is a bit old

but ive seen it asked many other places .. :D


the  -t nat OUTPUT  table seems to work fine for me

i have set up DNAT aswell as ACCEPT Rules

(as i have a Default Policy of DROP,  IPTABLES -P -t  nat OUTPUT DROP  )

and the packets Traverse Through the chain correctly .. :-)

i use two differnet versions of IPTables (i have 2 Firewall Boxes .. :-)

IPTables 1.2.5mdk-1
&
IPTables 1.2.6a

if your having problems with this chain try an upgrade if your not already
at these versions .. :-)

