From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: Block/Accept by MAC Address
Date: Tue, 01 Oct 2002 08:34:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D99420E.1080103@fugmann.dhs.org>
References: <003a01c268ea$d98408a0$e951ea43@W2RZ8L4S02>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jim Gifford <maillist@jg555.com>
Cc: netfilter@lists.netfilter.org

Jim Gifford wrote:
> Is it possible to block or accept information from specific MAC Addresses.
> 
> Here is what I would like to do. Is to create a exempt and complete block
> policy by mac address. I have a guy who keeps hacking my machine and his IP
> address is always changing and so does his hostname. The only thing that was
> common was his MAC address.
> 
> Thank you in advance for your help.
> 
> 
If this person is hacking you from the internet, you cannot use the mac 
address for filtering. The MAC addres on a packet is changed each time 
the packet packet traverses through a router, and this you will always 
see the same mac address on packets comming through your ISP.

If he is hacking you from withing you lan, I suggest cutting his wire.
(Alternativly use: iptables -t mangle -T PREROUTING -m mac --mac-source 
XX:XX:XX:XX:XX:XX -j DROP)

Regards
Anders Fugmann
-- 
Neo: 'Can you fly that thing?'
Trinity: 'Not yet'.
$ apt-get install pilot-prg-v212helicopter.


