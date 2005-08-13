From: Zaurus User <akiaki@bellsouth.net>
Subject: [fabricio@tc.df.gov.br: Blocking Google Earth]
Date: Fri, 12 Aug 2005 22:45:21 -0400
Message-ID: <20050813024521.GA26940@zaurus>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

----- Forwarded message from fabricio bianco abreu <fabricio@tc.df.gov.br> -----

Hi folks,

Is there a way to use iptables to deny access to Google Earth servers, without
blocking access to Google search engine (www.google.com)??

________________________________________________________________

----- End forwarded message -----
Don't know if iptables can do it, but a proxy server certainly would.  I use squid with excellent results.  Check out hhtp://www.squid-cache.org

