From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: again problem with alias / virtual interface
Date: Mon, 19 Jul 2004 20:14:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407192014.33758.Antony@Soft-Solutions.co.uk>
References: <d3caf706513e42bc4d4a4a08209f5cd9@62.98.80.108>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <d3caf706513e42bc4d4a4a08209f5cd9@62.98.80.108>
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

On Monday 19 July 2004 7:55 pm, Batstru wrote:

> Hi all!
> I wrote days ago: I have a problem with virutal interface and iptables:
> my pc has 2 network interface, one with a private network address and the
> other one with
> public network addresses:
> eth0 --> 192.168.1.254 / 255.255.255.0
> eth1 --> 82.186.92.90 / 255.255.255.248
> eth1:1 --> 82.186.92.91 / 255.255.255.248
> eth1:2 --> 82.186.92.92 / 255.255.255.248
> eth1:3 --> 82.186.92.93 / 255.255.255.248
> eth1:4 --> 82.186.92.93 / 255.255.255.248

Same address twice??

> -A INPUT -p tcp -m tcp -m state -i eth1:1 -d 82.186.92.91 --dport 25
> --state NEW -j ACCEPT

You can't use ":" in netfilter interface names.   Simply use "eth1" like all 
your other rules.

I suggest you test these additional addresses with something like this:

iptables -A INPUT -p icmp -i eth1 -d 82.186.92.90 -j ACCEPT
iptables -A INPUT -p icmp -i eth1 -d 82.186.92.93 -j ACCEPT
iptables -A INPUT -p icmp -i eth1 -j ACCEPT

Then ping 82.186.92.90 from a machine connected to eth1; then ping 
82.186.92.93 from a machine connected to eth1; then use "iptables -L INPUT 
-nvx" to check the packet / byte counts for the above three rules.

You should get non-zero packet counts for the first two rules; hopefully zero 
packets for the third rule.

Also check from a machine directly connected on eth1 that you get the same MAC 
address for both the above addresses in response to an "arp -an".

Regards,

Antony.

-- 
There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.

                                                     Please reply to the list;
                                                           please don't CC me.


