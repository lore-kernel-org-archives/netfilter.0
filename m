From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: Packets Counting
Date: Wed, 16 Mar 2005 12:54:37 -0500
Message-ID: <423872DD.8020009@SCampbell.net>
References: <4238655B@webmail.wichita.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <4238655B@webmail.wichita.edu>
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
To: iptables <netfilter@lists.netfilter.org>

M. A. Imam wrote:

>Hi,
>
>How can i count the number of packets on an interface evry 2 or 5 seconds. and 
>i want to count only specific packets like only arriving packets from port 
>5001
>
>Any ideas...
>
>Muhammad 
>
>
>  
>
iptables -L -v will show packet counts and byte counts on rules so, 
using your specific example and assuming you meant tcp port 5001

First create a matching rule that has no target
#  iptables -I INPUT 1 -p tcp --dport 5001

Then, every x seconds run
iptables -L -v -n
and parse out the counter of interest.

Hope that helps,
SCampbell





