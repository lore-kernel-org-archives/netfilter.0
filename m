From: "Frank Bulk" <frnkblk@iname.com>
Subject: RE: Explicit source port mapping
Date: Wed, 1 Nov 2006 10:02:51 -0600
Message-ID: <!&!AAAAAAAAAAAuAAAAAAAAAKTyXRN5/+lGvU59a+P7CFMBAN6gY+ZG84BMpVQcAbDh1IQAAAATbSgAABAAAAAIEUEyyGMsSKuBQu3vL2y0AQAAAAA=@iname.com>
References: <200611011624.21822.andreas.micklei@ivistar.de>
Reply-To: frnkblk@iname.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200611011624.21822.andreas.micklei@ivistar.de>
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
To: 'Andreas Micklei' <andreas.micklei@ivistar.de>, netfilter@lists.netfilter.org

Sure, that can be done.  Look at this:
http://www.netfilter.org/documentation/HOWTO/NAT-HOWTO-6.html#ss6.1 
in detail.  Specifically, the :1-1023 at the end of the POSTROUTING command.

Regards,

Frank

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Andreas Micklei
Sent: Wednesday, November 01, 2006 9:24 AM
To: netfilter@lists.netfilter.org
Subject: Explicit source port mapping

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




