From: Paulo Andre <PAndre@autopage.altech.co.za>
Subject: iptables
Date: Mon, 10 Jun 2002 16:06:39 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <CC845BB8BC74D6119934000347DD23E87C0BA5@jhbmail.autopage.co.za>
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

I have a Exchange server that needs to send mail out, the firewall
(iptables) is set up as follows:

iptables -A FORWARD -s (mail srv) -p tcp --dport 25 -j ACCEPT

The mail server comes back with a "Host unreachable" error, and nslookup and
traceroute takes me to the destination fine. Anyone have any ideas...???




