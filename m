From: Joel Newkirk <firewalldude@newkirk.us>
Subject: Re: NAT problem
Date: Mon, 06 Oct 2003 16:38:50 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065472730.12495.194.camel@alpha.newkirk.us>
References: <000001c38c05$923fb680$0f01a8c0@raul02>
Reply-To: firewalldude@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c38c05$923fb680$0f01a8c0@raul02>
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
To: Jose Pascual <jose.pascual@optivamedia.com>
Cc: netfilter@lists.netfilter.org

Your SNAT rule should be matching dport, not sport.

Do you have a rule in FORWARD table on 192.168.1.2 that ACCEPTs this
traffic?  And is 192.168.1.2 configured to even allow forwarding?

j

On Mon, 2003-10-06 at 08:30, Jose Pascual wrote:
> Hi all,
> I am new using iptables and surelly  this wil be an easy and stupid question
> but perhaps you can help me. I want to understand NAT so I am trying to do
> the following:
> 
> I have three computers in my LAN (192.168.1.1; 192.168.1.2 and 192.168.1.3).
> 192.168.1.1 has a web server and I would like to access it through
> 192.168.1.2 with NAT. For example openning my browser in 192.168.1.3 and
> connecting to 192.168.1.2   I  should see the same as if I connected to
> 192.168.1.1 web server directly, so I have done the following in
> 192.168.1.2:
> 
>  iptables -t nat -A PREROUTING -p tcp --dport 80 -j
> DNAT --to-destination 192.168.1.1
> 
> 
>  iptables -t nat -A POSTROUTING -p tcp --sport 80 -j SNAT
> --to-source 192.168.1.2
> 
> However it doesn't work. Anyone can help me?
> 
> Thanks
> 
> Regards
> Jose Pascual
> 



