From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Multiple Source Addresses
Date: Tue, 15 Apr 2003 19:27:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E9C410D.4080809@rtij.nl>
References: <22FCCF057850DB48B98178E1811374830DA6D9@slra07.slb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <22FCCF057850DB48B98178E1811374830DA6D9@slra07.slb.de>
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
To: Keller Nicolas <nicolas.keller@slb.de>
Cc: netfilter@lists.netfilter.org

Keller Nicolas wrote:

>Hi!
>
>I want to log every packet that *doesn't* come from IP1 and IP2 (because
>these two hosts should be the only one that communicate with the
>Firewall). Up to now I couldn't figure out a way to do this, as it is
>NOT possible to include multiple source addresses in one line, like
>this:
>
>iptables -A INPUT -s !192.168.43.1 !192.168.43.2 -j LOG
>
>Anyone can show me a way to get this to work?
>  
>

Simple.

iptables -N LOGSOME
iptables -A INPUT -j LOGSOME
iptables -A LOGSOME -s 192.168.43.1 -j RETURN
iptables -A LOGSOME -s 192.168.43.2 -j RETURN
iptables -A LOGSOME -j LOG

HTH,
M4



