From: madhav bhasin <madhavbhasin@yahoo.com>
Subject: DNAT NOT WORKING
Date: Wed, 24 Dec 2003 02:24:04 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031224102405.67307.qmail@web10105.mail.yahoo.com>
References: <20031224052809.18657.42710.Mailman@netfilter-sponsored-by.noris.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031224052809.18657.42710.Mailman@netfilter-sponsored-by.noris.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hi,

	I installed latest vesion of iptables and pom from
www.netfilter.org . They were installed and kernel was
compiled sucessfully. all modules are loading
properly. I just added three rules in nat table
prerouting chain .and i am getting same error
iptables: Invalid argument 3 times. 
rules are as follows

$IT -t nat -A PREROUTING -p TCP -i $INET_IFACE -d
&INET_HTTP  --dport 80 -j DNAT --to $DMZ_HTTP 

$IT -t nat -A PREROUTING -p TCP -i $INET_IFACE -d
&INET_DNS  --dport 53 -j DNAT --to-destinaion $DMZ_DNS
$IT -t nat -A PREROUTING -p UDP -i $INET_IFACE -d
&INET_DNS  --dport 53 -j DNAT --to-destinaion $DMZ_DNS

KERNELVERSION -> 2.4.20-8
IPTABLES -> 1.2.9 "I DOWNLOADED BUT AFTER COMPILING IT
SHOWS IPTABLES-1.2.7a"
PATCH-O-MATIC ->20030912

Please try to help me. I'll be really thank full to
you
Madhav


__________________________________
Do you Yahoo!?
New Yahoo! Photos - easier uploading and sharing.
http://photos.yahoo.com/

