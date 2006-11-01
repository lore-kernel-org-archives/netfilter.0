From: Andreas Micklei <andreas.micklei@ivistar.de>
Subject: Explicit source port mapping
Date: Wed, 1 Nov 2006 16:24:21 +0100
Message-ID: <200611011624.21822.andreas.micklei@ivistar.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Greetings,

I have an unusual (maybe?) request. I have several private IPs (192.168.x.x) 
behind a Linux gateway. All are NATed to the Internet. Now I want to 
explicitely map each private IP to a fixed source port range on the WAN 
interface of the gateway.

Example:

Connections from 192.168.42.1 are mapped to source ports 1024 - 1279
Connections from 192.168.42.2 are mapped to source ports 1280 - 1343
Connections from 192.168.42.3 are mapped to source ports 1344 - 1408
...

Quetions 1: Can netfilter do this for me?
Question 2: If not, would it be easy to implement, and can someone give a 
suggestion where I should start? - Or even better: Has someone already 
implemented this?

Sorry if my question sounds stupid. In the HOWTOs I could only find implicit 
source port mapping. Also I did not find a search interface for the 
mailinglist. So if this question is already answered, pointers are 
appreciated.

regards,
Andreas Micklei


