From: Payal Rathod <linux@rpayal.cjb.net>
Subject: firewall rules
Date: Mon, 14 Apr 2003 10:00:09 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030414140009.GA1942@localhost>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
I have made a few firewall rules, almost stolen from IP-Masquerading
HOWTO. Can you please check them and tell about any loopholes.
I have a lan of 15 computers and a central linux server. Users can
telnet, ping, http, ssh, pop3, smtp in this linux box if only they
belong to the lan.
Also, users of the lan have internet access to everything except www,
how do I mention it? Only ip 192.168.10.1, 192.168.10.3, 192.168.10.10
have www net access also. Rest no.

So as not to waste bandwidth I have put the rules on my site at
www.geocities.com/rpayal99/firewall-b1.txt Please have a look at them
and suggest changes. For security I have just made a small change to
external IP, but the rest of all the rules are kept as they are.

With warm regards,
-Payal



-- 
"Visit GNU/Linux Success Stories"
www.geocities.com/rpayal99
Guest-Book Section Updated.

