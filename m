From: Jason Opperisano <opie@817west.com>
Subject: Re: round robin SNAT, multiple "to IP" setup, AIM issue?
Date: Thu, 09 Sep 2004 00:10:31 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094703031.1739.84.camel@wolfpack.ljm.dom>
References: <1094682791.413f88a75fabc@www.gotdoofed.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094682791.413f88a75fabc@www.gotdoofed.com>
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

On Wed, 2004-09-08 at 18:33, Joe Drago wrote:
> To make a long story short (TOO LATE!), I need to figure out a way to have the
> Linux box use the same IP for both connections to the AIM servers. My first idea
> was to potentially route all traffic destined for port 5190 across one of the
> ten WAN IPs, but then I wondered if there was a way to have the linux router
> "prefer" to use the same WAN IP as much as possible without resorting to a
> 1-to-1 setup. There are more than 10 clients, so that really isn't an option.

i (personally) would go the keep-it-simple route; and just SNAT all port
5190 traffic to the same IP and move on with my life; i.e:

  iptables -t nat -A POSTROUTING -o eth0 -p tcp --dport 5190 \
    -j SNAT --to 5.5.5.69
  iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 5.5.5.60-5.5.5.69

if you're just dying to go "hog wild" with netfilter extensions--there's
probably some crazy combination of random/recent/marking that could be
used to split your tcp 5190 traffic into 10 "sticky" pools, each with
their own SNAT...

if that gives you a headache--you could also split up your /22
semi-evenly over the 10 public IP's manually, like:

  iptables -t nat -A POSTROUTING -o eth0 -p tcp --dport 5190 \
    -s 10.176.60.0/25 -j SNAT --to 5.5.5.60
  iptables -t nat -A POSTROUTING -o eth0 -p tcp --dport 5190 \
    -s 10.176.60.128/25 -j SNAT --to 5.5.5.61
  iptables -t nat -A POSTROUTING -o eth0 -p tcp --dport 5190 \
    -s 10.176.61.0/25 -j SNAT --to 5.5.5.62
  iptables -t nat -A POSTROUTING -o eth0 -p tcp --dport 5190 \
    -s 10.176.61.128/25 -j SNAT --to 5.5.5.63
  iptables -t nat -A POSTROUTING -o eth0 -p tcp --dport 5190 \
    -s 10.176.62.0/25 -j SNAT --to 5.5.5.64
  iptables -t nat -A POSTROUTING -o eth0 -p tcp --dport 5190 \
    -s 10.176.62.128/25 -j SNAT --to 5.5.5.65
  iptables -t nat -A POSTROUTING -o eth0 -p tcp --dport 5190 \
    -s 10.176.63.0/25 -j SNAT --to 5.5.5.66
  iptables -t nat -A POSTROUTING -o eth0 -p tcp --dport 5190 \
    -s 10.176.63.128/25 -j SNAT --to 5.5.5.67

  iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 5.5.5.60-5.5.5.69

-j

-- 
Jason Opperisano <opie@817west.com>


