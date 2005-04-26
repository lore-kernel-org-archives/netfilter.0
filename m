From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: Accounting with iptables vs. snmp
Date: Tue, 26 Apr 2005 15:26:49 -0400
Message-ID: <426E95F9.9090402@SCampbell.net>
References: <200504261345.45177.S.Guenther@in-put.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200504261345.45177.S.Guenther@in-put.de>
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

Stefan-Michael. Guenther (in-put GbR) wrote:

>Hi,
>
>using iptables I have setup a traffic accounting on one of our client's 
>gateways:
>
>iptables -A INPUT -i $WAN -j LOG --log-level debug
>iptables -A OUTPUT -o $WAN -j LOG --log-level debug
>iptables -A FORWARD -j LOG --log-level debug
>
>  
>
SNMP will record arps and other traffic that hits the nic regardless of 
it being directed to that machine or not, iptables (above) will not.   
The numbers will likely always be different, I am surprised that 
iptables would ever report more data being processed than snmp would.


