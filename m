From: "Andrew Cant" <acant@logisense.com>
Subject: RE: logging port 25
Date: Wed, 19 Oct 2005 09:40:12 -0400
Message-ID: <36097.8712830276$1129729414@news.gmane.org>
References: <200510182332.55144.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510182332.55144.rob0@gmx.co.uk>
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

> Further I would suggest limiting it, either or both "--syn" 
> or "-m state --state NEW". You only need one packet logged 
> per connection attempt.

Wouldn't putting the rules in the nat table instead of the filter table,
achieve that same thing and avoid evaluating the rules for every packet?

Andrew

-----------------------------------
Andrew Cant
Developer
LogiSense Corporation
"IP Billing and Traffic Management"
  
e: acant@logisense.com
p: 1-519-249-0508 x4108
w: www.logisense.com
weblog: http://blog.logisense.com
forum: https://ssl.logisense.com/support/forum  



