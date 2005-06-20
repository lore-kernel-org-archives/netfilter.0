From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: RE: ip + mac filtering
Date: Mon, 20 Jun 2005 17:27:45 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0506201727360.28917@yvahk01.tjqt.qr>
References: <201E6F5AC48C274996A5AD8304FAEF869B37@p001ex03.porta.local>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <201E6F5AC48C274996A5AD8304FAEF869B37@p001ex03.porta.local>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Baake, Matthias" <m.baake@porta.de>
Cc: "Netfilter (E-Mail)" <netfilter@lists.netfilter.org>


>You can filter by mac addresses with the module mac
>
>a sample could be
>
>iptables -A FORWARD -m mac --mac-source ff:ff:ff:ff:ff:ff -j DROP

For true MAC filtering you need ebtables.


Jan Engelhardt                                                               
--                                                                            
| Gesellschaft fuer Wissenschaftliche Datenverarbeitung Goettingen,
| Am Fassberg, 37077 Goettingen, www.gwdg.de

