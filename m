From: a.ledvinka@promon.cz
Subject: RE: How to block only MX query made to DNS server
Date: Tue, 30 Nov 2004 13:35:26 +0100
Message-ID: <OF30199721.8414EE0C-ONC1256F5C.0044AB24-C1256F5C.00452974@promon.cz>
References: <20041130085324.87578.qmail@web12308.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041130085324.87578.qmail@web12308.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pravin rane <pgr_80@yahoo.com>
Cc: netfilter@lists.netfilter.org

> # iptables -t filter -A INPUT -p udp --dport 53 -m
> string --string "MX" -j DROP
This will not work.

see http://www.faqs.org/rfcs/rfc1035.html chapter 4.1.3 (for complete 
understanding see at whole 4.x) and for MX type number see 
http://www.iana.org/assignments/dns-parameters


