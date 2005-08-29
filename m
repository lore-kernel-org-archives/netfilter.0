From: Lars Nielsen <lars@mit-web.dk>
Subject: allow DCC through iptables nat box
Date: Mon, 29 Aug 2005 18:21:23 +0200
Message-ID: <43133603.3010005@mit-web.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hey

I have the following setup:

LAN      192.168.1.0/24
   Linux box with iptables
       eth0   192.168.1.1
       eth1   ext_ip
internet

I use the following to allow internal clients to access the internet.
iptables  -t nat -A POSTROUTING -o eth1 -s 192.168.1.0/24 -d 0/0 -j 
MASQUERADE

Which rules should i use to allow DCC to and from an internal Mirc 
client on ip 192.168.1.2

I hope you can help me! ;o)

Best regards Lars Nielsen


