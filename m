From: Peteris Krumins <newsgroups@lf.lv>
Subject: Re[2]: transparent squid with iptables masq
Date: Wed, 22 Oct 2003 23:55:10 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <759610559.20031022235510@lf.lv>
References: <20031018051051.49925.qmail@web14309.mail.yahoo.com>
 <015201c395e2$2495f220$2800a8c0@karu>
Reply-To: Peteris Krumins <newsgroups@lf.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <015201c395e2$2495f220$2800a8c0@karu>
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
To: "Venkatesh. K" <venkatesh@cbayscribe.com>
Cc: netfilter@lists.netfilter.org

Sunday, October 19, 2003, 4:41:29 AM, you wrote:

VK> ----- Original Message ----- 
VK> From: "Subramanian Thenralmani" <sthenral@yahoo.com>
VK> To: <netfilter@lists.netfilter.org>
VK> Sent: Saturday, October 18, 2003 10:40 AM
VK> Subject: transparent squid with iptables masq


>> Hi,
>>
>> I have configured transparent squid on my Linux
>> firewall and masqueraded only ftp ports (20 and 21).
>> My problem is i wanted to block yahoo messenger
>> through squid but after squid rejects yahoo messanger
>> is masquerading with ftp ports and going out and
>> without masquerading anything yahoo messanger is not
>> working. How can I block yahoo messanger with the
>> above situation.

VK> Consider using ftp proxy like frox (http://frox.sourceforge.net).
VK> Frox allows you to transparently proxy/cache ftp and it can even use squid
VK> for anonymous ftp requests. This will allow you transparently proxy/cache
VK> ftp. Once you have a proxy for ftp, you can simply remove the masquerading.

VK> Unfortunately, the above solutions works for you only for ftp. Consider
VK> using L7 classifier for application level firewalling.

See 'ZORP'
http://www.balabit.com/products/zorp_gpl/

Zorp is a new generation proxy firewall suite and as such its core architecture
is built around today's security demands: it uses application level proxies, it
is modular and component based, it uses a script language to describe policy decisions,
it makes it possible to monitor encrypted traffic, it let's you override client actions,
it let's you protect your servers with its built in IDS capabilities... The list is
endless. It gives you all the power you need to implement your local security policy.


P.Krumins


