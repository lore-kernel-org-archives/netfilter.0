From: Jason Opperisano <opie@817west.com>
Subject: Re: iptables with multiport problem
Date: Tue, 05 Oct 2004 14:31:26 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097001085.4415.10.camel@wolfpack.ljm.dom>
References: <200410051250.i95CoY030305@securegate.mailserver.gajshield.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200410051250.i95CoY030305@securegate.mailserver.gajshield.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tue, 2004-10-05 at 08:47, bruce wrote:
> Hi all,
> 
> I am  working with linux firewall implementation
> 
> 
> I am using iptables version  v1.2.11 and  linux kernal 2.4.27.
> If multiport option comes with iptables(iptable rules are below), the 
> services are not working. But individual services are working properly. 
> The following filtering rules are not giving any syntatical errors.
> I checked logs no info..
> 
> #/sbin/iptables -A FORWARD -i eth0 -o eth1 -p tcp -s 192.168.2.0/24 -m 
> multiport --dport 24,80 -m multiport --sport 0:65535  -d 192.168.1.2  -j 
> ACCEPT

try:

  iptables -A FORWARD -i eth0 -o eth1 -p tcp -s 192.168.2.0/24 \
    -m multiport --dports 24,80 -d 192.168.1.2  -j ACCEPT
                        ^
                        |- multiport uses "--dports" with an 's'

and what on earth is TCP port 24?  should that be a 25, perhaps?

and "-m multiport" does not support byte ranges (21:23), use mport for
that, or a regular port match.

-j

-- 
Jason Opperisano <opie@817west.com>


