From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: OS Fingerprint
Date: 18 Nov 2003 09:29:05 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069165744.1078.4.camel@valhalla>
References: <Law14-F6682qhpp8eur0000b7c9@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Law14-F6682qhpp8eur0000b7c9@hotmail.com>
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
To: Rodre Ghorashi-Zadeh <rodrico7@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2003-11-18 at 05:05, Rodre Ghorashi-Zadeh wrote:
>
> Does anybody on this list have a rule that I can use to change the OS 
> fingerprint of all packets leaving my DMZ? Thanks in advance.

Os passive fingerprinting is typically done with ICMP type 8's as well
as TCP SYN packets. Its possible to do it with SYN/ACKs, but its not
easy.

You could use iptables to rewrite the TTL. That usually the first value
people key in on to do OS detection. That, and its something you could
do to "all packets" as you require. It will not fool everyone, but any
other changes will only be applicable to certain packets.

HTH,
C





