From: "Sven Bolt" <sven_bolt@fastmail.fm>
Subject: Some webpages inaccessible through IPTables
Date: Fri, 07 Feb 2003 10:40:27 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030207184027.346DC232BA@www.fastmail.fm>
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
To: netfilter@lists.netfilter.org

Hello,
I saw the problem already on the list, but ther was no solution to it:
I use an iptables-gateway 1.2.6a on debian with kernel 2.4.18 with just 

echo 1 > /proc/.../ip_forward
and iptables --table at -A POSTROUTING -j MASQUERADE

I can access through this gateway most webpages, but for example
www.ebay.com among several others I can't access.
What could the problem be?

Thanks for any help

Sven Bolt
-- 
  Sven Bolt
  sven_bolt@fastmail.fm

-- 
http://fastmail.fm - The professional email service

