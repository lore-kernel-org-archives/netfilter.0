From: Gavin Hamill <gdh@acentral.co.uk>
Subject: [SOLVED] Re: Temporary forwarding proxy?
Date: Thu, 25 Sep 2003 10:14:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309251014.11462.gdh@acentral.co.uk>
References: <200309241035.04343.gdh@acentral.co.uk> <1064475439.1906.528.camel@alpha.newkirk.us> <200309250926.36492.gdh@acentral.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309250926.36492.gdh@acentral.co.uk>
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

Ignore my previous reply... I managed to choose a test IP address that had 
port 80 blocked by our upstream provider :)

I can confirm that the solution works wonderfull just using the two PRE and 
POSTROUTING lines.

A thousand thanks,
Gavin.

