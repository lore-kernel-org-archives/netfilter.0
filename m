From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: can someone check this simple firewall?
Date: Wed, 13 Aug 2003 19:58:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030813185827.GA11666@acentral.co.uk>
References: <20030814182810.GA2123@linux.local>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Resent-Message-ID: <20030813185847.12149.qmail@eddie.acentral.co.uk>
Content-Disposition: inline
In-Reply-To: <20030814182810.GA2123@linux.local>
Resent-To: netfilter@lists.netfilter.org
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
Content-Transfer-Encoding: 7bit
To: netfilter@acentral.co.uk

On Thu, Aug 14, 2003 at 11:58:10PM +0530, Payal Rathod wrote:
> Hi,
> I have designed a simple firewall ruleset. Can someone please check
> them? 
> It is kept at http://payal.staticky.com/firewall-1.txt

Just a couple of points...

You might want to include the interfaces in your rules... e.g.

$IPTABLES -A INPUT -p tcp -i eth0 --dport 21 -j ACCEPT

Also, -s 0/0 is the default, and does not need to be specified...

Finally, the udp INPUT rules serve no purpose for FTP, SSH or HTTP :)

Cheers,
Gavin.


