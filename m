From: Elver Loho <kernelpenguin@hot.ee>
Subject: Matching misc TCP header fields
Date: Thu, 14 Aug 2003 08:27:11 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308140827.11478.kernelpenguin@hot.ee>
References: <20030814182810.GA2123@linux.local>
Reply-To: kernelpenguin@hot.ee
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030814182810.GA2123@linux.local>
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

Any quick hints on how to match misc TCP header fields such as the window 
size? This new "worm" out there that sends portscans from spoofed IP 
addresses setting window size to 55808 is pretty interesting. I've captured 
some interesting traffic with that window size using tcpdump. How to do the 
same using netfilter? Quick search on the manpage didn't reveal anything 
related. Same result with a quick google query.


Elver

