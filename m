From: Paulo Andre <PAndre@autopage.altech.co.za>
Subject: Iptables problem
Date: Tue, 25 Jun 2002 12:47:04 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <CC845BB8BC74D6119934000347DD23E87C0C0E@jhbmail.autopage.co.za>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "Netfilter (E-mail)" <netfilter@lists.samba.org>

I have the following setup.

<fw1>		<fw2>
   \		/
    \	     /
  <gateway_fw>
	  |
	  |
	<LAN>


My problem is this...
A request comes in on fw2 DNAT's to server on LAN. The gw_fw uses fw1 as a
gateway.
What would be the best way to fix this. Should I get a routing protocol with
iproute2...???
Should I add an extra network card to fw1 and then do away with fw2...???
Any suggestions / help..???


Paulo Andre




