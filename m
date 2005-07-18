From: Rob Carlson <rcarlson@kitchenandassociates.com>
Subject: IPset ports question.
Date: Mon, 18 Jul 2005 14:42:59 -0400
Message-ID: <42DBF833.9020505@kitchenandassociates.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter User Mailing List <netfilter@lists.netfilter.org>

Is there a way to bind an IPSet hash to a port, 
and if so, what is the syntax?

I had a rule for a CIDR block that I bound to a 
port set and then was able to reject incoming 
traffic from that CIDR block addressed to specific 
ports and that worked very well.  Now I would like 
to be able to take an iphash and a nethash 
(currently blocking all traffic) and reject 
traffic from the hashed addresses going 
specifically to port 22 and 25 only.

Thanks for any help.
-- 
Rob Carlson, Systems and Network Administrator
Kitchen & Associates Architectural Services, PA
Architecture - Planning - Interior Design
856.854.1880





