From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: iptables and DNS
Date: Tue, 4 Jun 2002 14:48:22 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020604184822.GX29214@cannon.eng.us.uu.net>
References: <scfca615.000@pzsj-office.pzs.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <scfca615.000@pzsj-office.pzs.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Ugie <bugie@pzs.com>
Cc: ramin@cannon.eng.us.uu.net, nickd@funkyjesus.org, netfilter@lists.samba.org

On Tue, Jun 04, 2002 at 11:35:39AM -0700, Brian Ugie wrote:

> Actually iptables-save will resolve to ip when it saves regardless of
> weather you created the chain with IPs or hostnames. I guess you would
> never know which way I did it but I assure you that I am entering the
> IPs when I create the chains.
> 
>   I feel that you are all missing what the problem is. Let me see if I
> can explain it better.
> 
> The example server is NS2.pzs.com and has an ip address of 10.1.1.13
> 
> The DNS record for NS2.pzs.com is 66.126.189.37
> 
> A firewall appliance sits in front of the server and mapps the public
> address to the private address. The firewall will only allow port 53
> /udp/tcp traffic in. 
> 
> Now, this works fine with no iptable rules but once I add, say
> 
> iptables -A INPUT -d 10.1.1.13 -p tcp --dport 53 -j ACCEPT
> iptables -A INPUT -d 10.1.1.13 -p udp --dport 53 -j ACCEPT
> iptables -P INPUT  DROP

Is NS2 the same as the firewall? In other words, the rule above
says: dns packets destined for 10.1.1.13 are allowed to enter
the firewall host. Is this what you want?

> DNS will nolonger respond on NS2. But if I go into NS1 and change the

What is NS1? What is your network topology?

> NS2 record so that is resolves to 10.1.1.13, the above rules will work.

I believe that you need to revisit your rule set. But a general "iptables"
rule is that when you're writing rules, do not use dns/host names for the
"-d" and "-s" switches.

Ramin

> --Brian

