From: David Cannings <lists@edeca.net>
Subject: Re: Redirect ports on localhost
Date: Thu, 25 Mar 2004 20:03:09 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403252003.09492.lists@edeca.net>
References: <20040325193403.19216.70237.Mailman@vishnu.netfilter.org> <40633766.3050005@personalsoft.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40633766.3050005@personalsoft.com.br>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Thursday 25 March 2004 19:47, Fabiano Bonin wrote:
> >From: Ben Yerushalmi <beny@pd.verio.net>
> >Looks like changing the OUTPUT chain did actually work in redirecting
> >localhost traffic. On the Linux 2.4 kernel you will need to enable the
> >"NF_NAT_LOCAL" kernel option.
> Could you provide a complete example of how to do all this?
> I think it will solve some of my problems.

You'll need to enable the option CONFIG_IP_NF_NAT_LOCAL.  Using `make 
menuconfig`, the relevant options are found:

In 2.4:

Under "Networking options -> IP: Netfilter Configuration -> NAT of local 
connections"

In 2.6:

Under "Device Drivers  -> Networking Support -> Networking Options -> 
Network packet filtering (replaces ipchains) -> IP Netfilter 
Configuration"

In both you will also have to enable "Full NAT" and "iptables support".  
This will let you use NAT with connections that originate locally, ie 
from processes on your iptables machine.  The help for the option says 
there should be more on the netfilter site, http://www.netfilter.org.

David

