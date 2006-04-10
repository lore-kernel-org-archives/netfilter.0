From: "Mailings'AT'netzwerk.cc" <mailings@netzwerk.cc>
Subject: iptables match bits per second
Date: Mon, 10 Apr 2006 10:57:20 +0200
Message-ID: <443A1DF0.70704@netzwerk.cc>
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

Hi list,

I am searching for an iptables target/match to account/measure the bits 
per second on two different lines.

I've got 2 WAN connections with traffic shaping. Now I need to 
differentiate how much the network load is on line a, so i can switch to 
line b if it is above xx/mbit/s.

I've got kernel 2.6.14.4 with iptables 1.2.11.

I found "iptables connbyte", but it is only for 2.4 kernels.
I found "iptables connrate", which is exactly what I need, but it is 
only designed for kernel <= 2.6.5? (I got rejects in 
ip_conntrack_standalone.c). It seems like the code in kernel 2.6.14 and 
in the diff is on an absolutly different base.

Does anybody have got an idea how I could measure the bytes ?

Thanks

