From: Esteban Ribicic <eribicic@UolSinectis.com>
Subject: masquerade over multiple gw
Date: 23 Feb 2003 08:37:03 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046000223.3276.9.camel@debian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

hi,
im trying to masquerade my internal network to internet over two gw.
it seems imposible to specify more than one -o interface right? 
now im using this: 
iptables -t nat -A POSTROUTING -o eth2 -j MASQUERADE
but i still have ppp0 wich also is conected to the internet..
any idea?
thanks 




