From: David Cannings <lists@edeca.net>
Subject: Re: martians and portforwarding to 127.0.0.1
Date: Tue, 20 Apr 2004 17:43:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404201743.13848.lists@edeca.net>
References: <20040420163326.32095.qmail@web40706.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040420163326.32095.qmail@web40706.mail.yahoo.com>
Content-Disposition: inline
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

On Tuesday 20 April 2004 17:33, udo wrote:
> $path_iptables -t nat -A PREROUTING -p tcp -i $ext_if
> -s 0/0 -d $ext_ip --dport 222 -j DNAT --to
> 127.0.0.1:22
> How can I make the sshd (attached to loopback) work
> without `martian destination` messages for packets
> destined for port 22?

Please see my lengthly post about this from last month.  Due to the way 
the martian checking code in the kernel is written, I do not think this 
is possible.

http://lists.netfilter.org/pipermail/netfilter/2004-March/051615.html

Hopefully somebody can prove this wrong, I hope that post helps you.

David

