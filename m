From: Jason Opperisano <opie@817west.com>
Subject: Re: SNAT will only take the servers IP
Date: Sat, 04 Sep 2004 13:41:02 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094319661.1745.14.camel@wolfpack.ljm.dom>
References: <4138DD78.9070107@mail.bloomfield.k12.mo.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4138DD78.9070107@mail.bloomfield.k12.mo.us>
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

On Fri, 2004-09-03 at 17:09, Scott Mayo wrote:
> I have my IPTABLES set up and was going to SNAT to multiple IP's on my 
> network (IE.  IPTABLES -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 
> xxx.xxx.xxx.10-xxx.xxx.xxx.50)  The only way I can get it to work though 
> is to SNAT --to-source xxx.xxx.xxx.215 which is the IP address of my 
> server.  How come I cannot use anymore of my Class C network like I want to?
> 
> Does translating to multiple IPs instead of just 1 help with speed any?
> Thanks for any information.

it's because your firewall doesn't answer arp requests for any IP
address other than 215.  it SNATs the packet, but the upstream router
cannot find a MAC address to send the reply packets to.  the easiest
fix, would be to add IP aliases to your firewall on that interface as
part of your iptables script:

        i=10
        while [ $i -le 50 ]; do
          ip address add xxx.xxx.xxx.${i} dev $interface
          let "i = $i + 1"
        done

i am unaware of any "speed" advantage of using multiple IP's for SNAT. 
there is a speed advantage in using SNAT over MASQUERADE.  using
multiple SNAT addresses would normally be for scalability (>65000
simultaneous NAT connections), or for functionality purposes.

HTH...

-j
        
-- 
Jason Opperisano <opie@817west.com>


