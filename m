From: James Cooke <lists@jcitc.com>
Subject: IP address ranges for USA and Europe
Date: Thu, 02 Jun 2005 19:20:02 +0100
Message-ID: <429F4DD2.6080600@jcitc.com>
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
To: netfilter@lists.netfilter.org

Hi all,

I'm running a VPN server to which IP tables limits connections to the IP 
addresses of the client offices. However, now the client wants roaming 
access to the VPN via laptops - they will be moving around Europe and 
the USA. There are two layers of password security, but I'm still 
nervous about opening the server to the entire world...

Therefore, is there a nice way to open the firewall for connections just 
from Europe and USA?

I've found lots of IP address ranges, but even those don't seem to be 
complete - AOL IPs don't fit in to the list I've compiled so far for 
example. So I'm thinking there's got to be something better than writing 
out a full list of ranges and allowing them connections...

The SSH brute force thread was very interesting with the recent/tarpit 
trap for our less than welcome guests and I would like to implement this 
on the VPN ports in the future - but for now I'm just looking for a 
quick fix.

Thanks in advance for any input on this...

James

