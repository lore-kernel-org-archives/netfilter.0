From: Jason Opperisano <opie@817west.com>
Subject: Re: server in DMZ
Date: Wed, 01 Sep 2004 23:04:56 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094094296.1824.96.camel@wolfpack.ljm.dom>
References: <20040902025038.GA10835@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040902025038.GA10835@tranquility.scriptkitchen.com>
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

On Wed, 2004-09-01 at 22:50, Payal Rathod wrote:
> Hi,
> I have a small webserver in DMZ at 10.10.10.3 where we load our designs.
> I want to allow access to its port 80 only from local LAN (via. a squid 
> proxy on the gateway machine) and my client's office at 1.2.3.4. 

i assume the squid proxy can already fetch content from the web server
in the DMZ for your LAN--if this is not the case; please post your
current rules:

  iptables -vnL && iptables -t nat -vnL && iptables -t mangle -vnL

allowing access from the outside:

iptables -A FORWARD -i $extIf -o $dmzIf -p tcp --syn \
  -s 1.2.3.4 --sport 1024:65535 -d 10.10.10.3 --dport 80 \
  -j ACCEPT

> Right now I can see it from all over the world, but I do want to restrict 
> the access. Remember that as now I want to continue accessing the DMZ machine 
> using its public IP and not just 10.10.10.3 IP even from inside the LAN.
> What do I do in such case?

looks like the topic of the week is split-dns...

-j

-- 
Jason Opperisano <opie@817west.com>


