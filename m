From: "B. McAninch" <bmcaninch@penson.com>
Subject: Re: Redundant netfilter gateway
Date: Thu, 17 Jun 2004 16:02:57 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087506177.30435.27.camel@wslinux-fractal.penson.com>
References: <810BC538117E9F4E9BB152E0C100DF1F0F46C5@farmer.vikus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <810BC538117E9F4E9BB152E0C100DF1F0F46C5@farmer.vikus.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Patrick Ahler <patrick@vikus.com>
Cc: netfilter@lists.netfilter.org

Check out KeepAliveD (keepalived.sourceforge.net)- it uses VRRP for
failover. It does not, however, provide /stateful/ firewall failover. 
IIRC, work is (was) being done for Netfilter's own state syncing.

On Thu, 2004-06-17 at 15:52, Patrick Ahler wrote:
> I am looking for info on creating a redundant gateway/firewall. I
> currently have my network setup with 1 working iptables gateway/firewall
> and 1 backup gateway. If the first gateway goes down, I change the IP's
> and spoof the MAC addresses (I change the external MAC address because
> my internal network is masqueraded through the gateway and just
> switching the external IP messes with the arp tables on the router...
> That's a whole other issue though) on the backup gateway and it takes
> over. This is not redundancy and is dirty. Does anyone have any
> suggestions on how to do this better?
> 
> Patrick Ahler
> Systems Administrator
> Vikus Corporation 

-- 
Bryan McAninch
Network Security Engineer
Penson Financial Services, Inc.

