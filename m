From: "Daniel F. Chief Security Engineer -" <danielf@supportteam.net>
Subject: Interesting request. block x.x.0.0
Date: Thu, 23 Jan 2003 12:43:06 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301220116.18451.danielf@supportteam.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter <netfilter@lists.netfilter.org>

Anybody know of a way to block this traffic. Notice it's comming from just the 
0.0 addresses obviously spoofed. But can you block x.x.0.0 with out blocking 
every thing else in the range with out a rule per IP. 

This is s snippit of a dDoS we seen recently. 

01:19:57.644845 45.208.0.0.1669 > x.x.x.x.53: S 1685323776:1685323776(0) 
01:19:57.651441 45.210.0.0.1434 > x.x.x.x.53: S 1296957440:1296957440(0)
01:19:57.659812 46.79.0.0.1738 > x.x.x.x.53: S 1536360448:1536360448(0)
01:19:57.668782 46.82.0.0.1099 > x.x.x.x.53: S 867631104:867631104(0)
01:19:57.693367 46.216.0.0.1627 > x.x.x.x.53: S 1775828992:1775828992(0) 
01:19:57.699377 47.86.0.0.1712 > x.x.x.x.53: S 543227904:543227904(0) 
01:19:57.717765 47.222.0.0.1109 > x.x.x.x.53: S 1708457984:1708457984(0) 
01:19:57.733676 48.93.0.0.1669 > x.x.x.x.53: S 169934848:169934848(0) 

I ended up just blocking tcp tp port 53 and allowed UDP through which allowed 
our name servers to work fine. TCP is rarely used on the IPs that were being 
attacked. 

Thanks

--
Daniel Fairchild - Chief Security Engineer | danielf@supportteam.net

