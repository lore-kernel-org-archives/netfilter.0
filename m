From: Pekka Savola <pekkas@netcore.fi>
Subject: netfilter6: REJECT target? (fwd)
Date: Thu, 14 Aug 2003 12:58:53 +0300 (EEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0308141258330.22834-100000@netcore.fi>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

DaveM asked me to ask on a netfilter list :-)

-- 
Pekka Savola                 "You each name yourselves king, yet the
Netcore Oy                    kingdom bleeds."
Systems. Networks. Security. -- George R.R. Martin: A Clash of Kings
---------- Forwarded message ----------
Date: Wed, 13 Aug 2003 23:30:49 +0300 (EEST)
From: Pekka Savola <pekkas@netcore.fi>
To: netdev@oss.sgi.com
Subject: netfilter6: REJECT target?

Hi,

Is there some reason the IPv6 Netfilter REJECT target hasn't been merged 
during the last 2 years it has existed in Netfilter's patch-o-matic.

(it hasn't been pushed for merging, sure, ...)

Just wondering why we are keeping Netfilter6 crippled like this.  Unless 
we can properly use it to reject packets with ICMPv6/TCP-RST, it's pretty 
close to useless :-(

-- 
Pekka Savola                 "You each name yourselves king, yet the
Netcore Oy                    kingdom bleeds."
Systems. Networks. Security. -- George R.R. Martin: A Clash of Kings



