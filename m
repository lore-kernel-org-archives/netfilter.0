From: "Gabby James" <lizard0000092@hotmail.com>
Subject: Filter out broadcast messages
Date: Wed, 07 Jan 2004 14:44:42 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY10-F77TIFprhMOgR0003cd8a@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I would like to filter out all broadcast messages.  The packets could come 
from 255.255.255.255 or multiple other addresses of the form 10.*.*.255.  
What kind of syntax do I use to DROP these packets?  The line below will 
filter out packets from 255.255.255.255 but I'm not sure what syntax to use 
to DROP the other adresses.

iptables -A INPUT -d 255.255.255.255 -p udp -j DROP

Regards,
GJ

_________________________________________________________________
Worried about inbox overload? Get MSN Extra Storage now!  
http://join.msn.com/?PAGE=features/es


