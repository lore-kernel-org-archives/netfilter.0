From: Nils Juergens <ju@isf.rwth-aachen.de>
Subject: Re: Port forward to public IP's behind firewall
Date: Fri, 05 Sep 2003 09:04:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030905070458.GA31348@koala7>
References: <9AD675D1C5325D4F87D79F3EB7E539F3ABE5@postmanpat.netcall.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <9AD675D1C5325D4F87D79F3EB7E539F3ABE5@postmanpat.netcall.com>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Thu, 04.09.03, Gareth Hastings <Gareth.Hastings@netcall.com> wrote:

> firewall have public addresses. Now I would like to add a port forward rule
> that sends all incoming mail to another IP address. I am not sure what I'd
> need to do. I didn't think SNAT or DNAT were needed here as no NAT is
> happening. Anyone have any ideas? Do I need to mangle the destination
> address?

If you send packets to another IP address why exactly is that not DNAT?

Try:

iptables -t nat -A PREROUTING -p tcp -d $fw_ip --dport 25 -j DNAT --to $target:25

cya,

Nils


