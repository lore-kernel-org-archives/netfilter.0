From: Joshua Jackson <iptables@vortech.net>
Subject: Re: PPTP NAT module
Date: Fri, 19 Dec 2003 23:14:50 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312192314.50149.iptables@vortech.net>
References: <200312091803.55451.jjackson@vortech.net> <9115313499.20031211185755@internetplustravel.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <9115313499.20031211185755@internetplustravel.ru>
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
To: Oleg Savostyanov <savostyanov@internetplustravel.ru>, netfilter@lists.netfilter.org

On Thursday 11 December 2003 10:57, Oleg Savostyanov wrote:
> Hello Joshua,
> I successfully installed on a 2.4.23 kernel with ip_nat_pptp module
> I tested 3 vpn NATed connections to the SAME! server in the outside world
> see below my kernel's .config
>
<snip>

It would appear that the PPTP NAT connection tracking code only works if it is 
built directly into the kernel. With it loaded as a module, I can not get a 
single PPTP connection through the firewall. With it built in, the connection 
tracking works as it should.

I would like to have it available as a module to give people the option of 
loading it only if they need it... but for now, at least it is working.

--
Joshua Jackson
Vortech Consulting
http://www.vortech.net


