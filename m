From: Rasmus Reinholdt Nielsen <rasmus@narani.dk>
Subject: Re: host/network '***.**.**.*' not found
Date: Fri, 29 Nov 2002 14:09:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.0.14.2.20021129140652.02f45888@of23sm3>
References: <20021129120550.48029.qmail@web9605.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021129120550.48029.qmail@web9605.mail.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: at@4ix.net, netfilter@lists.netfilter.org

Hi

This probably means that you have a rule that consists of a domain name og 
hos adresse www.foo.bar or whatever. That either 1) doen't exist og 2) you 
haven't stated to foward packets when this rule is executed so your dns 
can't look it up for you.


/Rasmus

At 12:05 29-11-2002 +0000, Taniform Asongwe wrote:
>I am starting iptables with the appropriate script but
>receive the following error:
>
>Starting Firewalling:
>
>iptables v1.2.6a: host/network '***.**.**.*' not found
>
>Could someone be of help.
>
>Taniform
>
>__________________________________________________
>Do You Yahoo!?
>Everything you'll ever need on one web page
>from News and Sport to Email and Music Charts
>http://uk.my.yahoo.com


