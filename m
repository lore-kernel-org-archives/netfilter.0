From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: how to change ip source address of incoming packets
Date: Wed, 15 Nov 2006 10:35:57 +0100
Message-ID: <455ADF7D.1000309@freemail.hu>
References: <20768C3A-7F88-4816-8B52-2DE7A6910C64@borea.si>
	<455ACC13.2070801@freemail.hu>
	<30B51F1D-F230-4F45-BDB6-050DBB82AC3E@borea.si>
	<455ADE80.8080003@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <455ADE80.8080003@freemail.hu>
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
To: Matevz Langus <matevz.langus@borea.si>
Cc: netfilter@lists.netfilter.org

Sorry...
Not mark... connmark...

iptables -t mangle -A PREROUTING -j CONNMARK -i eth0.10 -s 192.168.1.1 
-d $firewal_virtual_ip_on_10 --set-mark 1
iptables -t mangle -A PREROUTING -j CONNMARK -i eth0.11 -s 192.168.1.1 
-d $firewal_virtual_ip_on_11 --set-mark 2
...
iptables -t nat -A PREROUTING -j DNAT -m connmark --mark 1 
--to-destination $firewal_real_ip_on_10
iptables -t nat -A PREROUTING -j DNAT -m connmark --mark 2 
--to-destination $firewal_real_ip_on_11
...

iptables -t mangle -A OUTPUT -j CONNMARK -d 192.168.10.1 --set-mark 1
iptables -t mangle -A OUTPUT -j CONNMARK -d 192.168.11.1 --set-mark 2
...

iptables -t nat -A OUTPUT -j DNAT -m connmark ! --mark 0 
--to-destination 192.168.1.1

iptables -t mangle -A POSTROUTING -j ROUTE -m connmark --mark 1 --oif  
eth0.10
iptables -t mangle -A POSTROUTING -j ROUTE -m connmark --mark 2 --oif  
eth0.11
...
iptables -t nat -A POSTROUTING -j SNAT -m connmark --mark 1 --to-source 
$firewal_virtual_ip_on_10
iptables -t nat -A POSTROUTING -j SNAT -m connmark --mark 2 --to-source 
$firewal_virtual_ip_on_12
...


