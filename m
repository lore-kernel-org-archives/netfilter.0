From: "Neil Aggarwal" <neil@JAMMConsulting.com>
Subject: RE: Port forwarding not working
Date: Sun, 29 Apr 2007 21:11:29 -0500
Message-ID: <000001c78acc$ddb29be0$dededede@neilhp>
References: <1177857594l.3596l.2l@soapy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1177857594l.3596l.2l@soapy>
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

Jim:

That did it!  I guess the Linksys box was only going
to respond to local IP addresses.

I was able to use your example to set up the routing for
the gre protocol as well.

Thank you for your help.

	Neil

--
Neil Aggarwal, (832)245-7314, www.JAMMConsulting.com
FREE! Eliminate junk email and reclaim your inbox.
Visit http://www.spammilter.com for details.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Jim Laurino
Sent: Sunday, April 29, 2007 9:40 AM
To: netfilter@lists.netfilter.org
Subject: Re: Port forwarding not working

On 04/29/2007 09:06:44 AM, Neil Aggarwal - neil@JAMMConsulting.com wrote:
> Jim:
> 
> > Maybe you could use SNAT to make the packets appear
> > to come from the firewall, then they ought to come back. 
> 
> How do I set up the SNAT rule?
> 

This will make the packet look like it came from the firewall:

/sbin/iptables -t nat -I POSTROUTING -o eth1 -d $LINKSYS_VPN_IP \ 
  -p tcp --dport 1723 -j SNAT --to-source 192.168.1.1

(where 192.168.1.1 is the ip address of the firewall on eth1 side)

If postrouting still has a default drop policy etc.
then this rule must be found before the accept rule,
that is why it has -I, to put it first.

HTH
-- 
Jim Laurino
nfcan.x.jimlaur@dfgh.net
Please reply to the list.
Only mail from the listserver reaches this address.



