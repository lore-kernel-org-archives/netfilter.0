From: "Venkatesh. K" <venkatesh@cbayscribe.com>
Subject: Re: transparent squid with iptables masq
Date: Sun, 19 Oct 2003 07:11:29 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <015201c395e2$2495f220$2800a8c0@karu>
References: <20031018051051.49925.qmail@web14309.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
Cc: Subramanian Thenralmani <sthenral@yahoo.com>

----- Original Message ----- 
From: "Subramanian Thenralmani" <sthenral@yahoo.com>
To: <netfilter@lists.netfilter.org>
Sent: Saturday, October 18, 2003 10:40 AM
Subject: transparent squid with iptables masq


> Hi,
>
> I have configured transparent squid on my Linux
> firewall and masqueraded only ftp ports (20 and 21).
> My problem is i wanted to block yahoo messenger
> through squid but after squid rejects yahoo messanger
> is masquerading with ftp ports and going out and
> without masquerading anything yahoo messanger is not
> working. How can I block yahoo messanger with the
> above situation.

Consider using ftp proxy like frox (http://frox.sourceforge.net).
Frox allows you to transparently proxy/cache ftp and it can even use squid
for anonymous ftp requests. This will allow you transparently proxy/cache
ftp. Once you have a proxy for ftp, you can simply remove the masquerading.

Unfortunately, the above solutions works for you only for ftp. Consider
using L7 classifier for application level firewalling.

Venkatesh K
KAEVEE Consulting Services
Banglaore

>
>
> Thanx & Regards
> Mani
>
> =====
> Subramanian ThenralMani
> Manager - Technical
> Yukthi Systems Pvt. Ltd.
> #178, 5th Main, J.P.Nagar 3rd Phase,
> Bangalore-560 074
> Phone #:6582923
> Reach me at:9845211913
>
> __________________________________
> Do you Yahoo!?
> The New Yahoo! Shopping - with improved product search
> http://shopping.yahoo.com
>
>


