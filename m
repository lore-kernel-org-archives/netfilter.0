From: Victor Julien <victor@nk.nl>
Subject: Re: Blocking IP
Date: Thu, 29 Jul 2004 14:10:24 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407291410.24531.victor@nk.nl>
References: <5.1.0.14.2.20040602145807.00b74bf8@pop3.netcologne.de> <001601c47565$8e0ba110$858310ac@suarapembaruan.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001601c47565$8e0ba110$858310ac@suarapembaruan.com>
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
Cc: david <david@suarapembaruan.co.id>

Try #iptables -I INPUT 1 -s 202.145.10.146 -j DROP

It will insert the rule on the top of the ruleset, so it matches first.

Regards,
Victor

On Thursday 29 July 2004 14:14, david wrote:
> Dear all,
>
> My mail server received so many virus mails from ip 202.145.10.147 and
> after i look at gateway (linux) and i using iptraf i see so many traffic
> from 202.145.10.147.
> After that i try to block all traffic from 202.145.10.147 with command :
> #iptables -A INPUT -s 202.145.10.146 -j DROP
>
> but i still receiveall traffic from 202.145.10.146......
> Can anybody help me ........... that ip send virus in to mail server more
> then 20 mails per minute.......
>
>
> Regards,
> David Kandou
>
> Help me ... iam so confused
>
> FYI :
> Iam using RedHat 9
> eth0 --> ippublic
> eth1 --> local ip
> mail server --> local ip

