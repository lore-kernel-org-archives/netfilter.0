From: Ted Kaczmarek <tedkaz@optonline.net>
Subject: POSTROUTING -d ! MASQUERADE question
Date: Mon, 08 Sep 2003 06:15:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063016144.7525.30.camel@tarkus>
Reply-To: tedkaz@optonline.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Been messing around with freeswan and their is a need to for excluding
from nat the ipsec tunnel traffic. Does anyone know of a good link that
shows multiple exclusions of IP addresses that should be excluded from
Nat in the POSTROUTING chain? 

This excludes the 10.123,123.0/30, but what if I want to also
exclude 192.168.123.0/29?
-A POSTROUTING -o eth0 -d ! 10.123,123.0/30 -j MASQUERADE

Any insight would be greatly appreciated.

Thanks,
Ted


