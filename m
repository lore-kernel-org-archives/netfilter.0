From: Rommy Taslim <rommyt@transportservices.com.au>
Subject: Forward UDP broadcast
Date: 03 Jun 2003 15:28:46 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054618126.22988.36.camel@hyperno.canodesc.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

Anyone knows how to forward UDP broadcast using iptables ?
I need to do something like ipportfw does:
ipportfw -A -u 192.168.4.255/699 -R 192.168.2.255/699

which forward all the broadcast on network 4 for port 699 to network 2.

I have something like this for iptables:

iptables -t nat -A PREROUTING -p udp \
        -d 192.168.4.255 --dport 699 \
        --to-destination 192.168.2.255:699

But it didn't work.

Anyone can give me some pointers ??

Thanks in advance.

Rommy

