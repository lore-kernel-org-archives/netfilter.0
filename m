From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Block outbound host to specific port using Masq./NAT?
Date: Tue, 4 Jan 2005 13:10:14 +0000
Message-ID: <200501041310.14979.gdh@acentral.co.uk>
References: <6e5e6e1050103134562ae614d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6e5e6e1050103134562ae614d@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Monday 03 January 2005 21:45, Jerry A. Applebaum wrote:

> And I thought I could do something like this:
> iptables -A OUTPUT -s 10.1.1.10 -p tcp -m tcp --dport 5190 -j DROP
> iptables -A FORWARD -d 10.1.1.10 -p tcp -m tcp --dport 5190 -j DROP
> ....but it has no effect.

You almost got it :)

Try

iptables -A FORWARD -s 10.1.1.10 -p tcp -m tcp --dport 5190 -j DROP

because the OUTPUT chain only refers to connections originating from the 
firewall machine, although I can see how this is confusing since it's the 
firewall machine doing the MASQ :)

Also, I would not be at all surprised if ICQ/AIM also tries to contact 
login.icq.com on port 80 if 5190 fails, in the same way that MSN Messenger 
does

Cheers,
Gavin.

