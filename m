From: Paulo Andre <pandre@darkstar.nom.za>
Subject: NAT+FORWARD
Date: Wed, 5 May 2004 12:09:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405051209.55454.pandre@darkstar.nom.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

I just need some clarification please.

Take for example the following two rules:

iptables -t nat -A PREROUTING -i $ext_card -s $client_IP -d $my_ext_ip -p tcp 
--dport 80 -j DNAT --to $int_web_IP:80
iptables -A FORWARD -i $ext_card -d $int_web-IP -p tcp --dport 80 -j ACCEPT

According to my thinking the above rule would be unsafe as the source was not 
specified on the FORWARD rule. As the would allow anyone using the firewall 
as a gateway to have access to $int_web_IP on port 80. Is that correct?

Paulo

