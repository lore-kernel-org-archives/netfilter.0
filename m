From: "David Theobald" <davidtheo@gmail.com>
Subject: IPTABLES and passwords
Date: Sun, 21 May 2006 15:58:45 +1200
Message-ID: <2ddb22030605202058p7e6d27e8j68b69e6dd98bf0f9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Let me ask this Question in a different way as you did not understand

I have a sever at home that has a firewall on it that I have writen
myself what I what to do is this

I have one wireless computer on my network and a computer on a
ethernet both connected to the internet thourgh a firewall using
IPTABLES what Rules do I use to make the wireless computer use
user-based authenentication on the proxy to access http and ftp I am
using squid web Caching also.

would what I have below do it.
$IPTABLES -t nat -A PREROUTING -i INPUT -p tcp --dport 80 -j REDIRECT
--to-port 3128

$IPTABLES -t nat -A POSTROUTING -o OUTPUT -p tcp --dport 80 -j
REDIRECT --to-port 3128



Thanks for any help you can give

