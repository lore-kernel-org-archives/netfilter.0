From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPTables error
Date: Thu, 15 Jan 2004 00:17:23 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401150017.23259.Antony@Soft-Solutions.co.uk>
References: <217D777D3789FC4591199BA41FB0617A0101EB@nemo.scriptthis.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <217D777D3789FC4591199BA41FB0617A0101EB@nemo.scriptthis.net>
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

On Thursday 15 January 2004 12:08 am, Jerry Rasmussen wrote:

> When I try to add a command with eth1:1 get this error 'iptables -t nat
> -A PREROUTING -p tcp -i $ex_dev -d 216.27.xxx.xx --dport 3389 -j DNAT
> --to 192.168.xx.xxx
> Warning: wierd character in interface `eth1:1' (No aliases, :, ! or *)."
>
> I have done a good bit of Googleing I am sure there is an easy answer
> that I am missing

You are correct.   The easy answer is: "leave out the :1 on the interface 
name".

Multiple IPs are still bound to one real interface (this is more obvious if 
you use the recommended ip addr command instead of ifconfig eth1:1), and your 
netfilter rules should simply refer to the real interface which the packets 
come in on.

Antony

-- 
This email was created using 100% recycled electrons.

                                                     Please reply to the list;
                                                           please don't CC me.


