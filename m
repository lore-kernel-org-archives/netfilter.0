From: Paulo Andre <pandre@darkstar.nom.za>
Subject: Two IP add
Date: Thu, 5 Jun 2003 11:56:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306051156.45624.pandre@darkstar.nom.za>
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

I would like to do the following:

Stop MASQUESRADING to two servers say. 10.10.10.5 and 10.10.10.8, how would i 
do this with a rule.

iptables -t nat -A POSTROUTING -s x.x.x.x -d ! 'servers ip' -j MASQUERADE 
now how would i put in two ip address's ?



