From: "black@arbbs.net" <black@arbbs.net>
Subject: Destination Nat
Date: Fri, 28 May 2004 07:46:39 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40b742bf.c1.3d5a.1536727437@arbbs.net>
Reply-To: black@arbbs.net
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Im running at red hat 9 and iptables 1.2.7

im trying to direct web traffic to the web server on the
inside.  
is [ iptables -t nat -A PREROUTING -p tcp --dport 80 -i eth0
 -j DNAT --to 5.6.7.8:8080 ] right?

thanks
john

