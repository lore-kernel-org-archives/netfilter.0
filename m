From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables routing help
Date: Sun, 25 Jan 2004 09:18:30 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401250918.30773.Antony@Soft-Solutions.co.uk>
References: <CD650C0C-4EB3-11D8-8BD0-000A9577164C@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <CD650C0C-4EB3-11D8-8BD0-000A9577164C@hotmail.com>
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

On Saturday 24 January 2004 9:25 pm, William Knop wrote:

> Hello,
> My dsl provider has my house on several subnets (ips obtained via dhcp,
> along with a netmask of 255.255.255.0), so I have had to screw around
> with each machine to make sure local traffic doesn't flood the dsl
> modem.

An alternative solution to this would be to set up a nice simple internal 
network for whatever machines you want to run, doing your own DHCP etc, and 
then hide all these behind a single firewall talking to the DSL modem on a 
single external IP address.

Unless you actually have a need for multilple external addresses, this is 
probably your best solution, as it means you remain in control of your 
internal network addressing, not your ISP.

Regards,

Antony.

-- 
There's no such thing as bad weather - only the wrong clothes.

 - Billy Connolly

                                                     Please reply to the list;
                                                           please don't CC me.


