From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Access from Internet ??
Date: Fri, 6 Sep 2002 09:42:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020906084229.IKIK1968.mta05-svc.ntlworld.com@there>
References: <000201c25535$5dab24c0$6b01a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000201c25535$5dab24c0$6b01a8c0@s3ac>
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

On Friday 06 September 2002 12:38 am, Rowan Reid wrote:

> Open SSH - Secure Shell Login
>
> A quick question: what tools are available to be able to access the
> Iptables/Netfilter box securely from the Internet in order to remotely
> manage iptables. I know of ssh, is there any other(s)?

SSH is almost certainly your best bet.   It gives you a command-line login, 
which is just what you need for iptables.   You can also tunnel other things 
through it if you decide you need some other connection as well.

Alternatives might be:

https if you have some way to manage iptables through a browser (!?)
IPsec if you want to have a secure connection to your box for all protocols

Both of these are probably more trouble than they're worth to set up, 
compared to SSH, though.

Antony.

-- 

It is also possible that putting the birds in a laboratory setting
inadvertently renders them relatively incompetent.

 - Daniel C Dennett

