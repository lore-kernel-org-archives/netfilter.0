From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: port translation
Date: Sun, 11 Jan 2004 11:37:14 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401111137.14623.Antony@Soft-Solutions.co.uk>
References: <4001239D.7010904@yahoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4001239D.7010904@yahoo.fr>
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

On Sunday 11 January 2004 10:21 am, Romain Moyne wrote:

> Hello,
>
> I'm French and my english is bad ;)
>
> I have a http server (debian 3.0) behind a router (debian 3.0). I have a
> problem when I want to log the visitor's IP of my website with PHP or
> Perl or all language. I have always the IP of my router ! Somebody tell
> me that I must do port translation but I have searched and I haven't
> fand anything.
> Can you help me ?
> This is the rules of my router :
>
> iptables -t nat -A PREROUTING -d MyIP -p tcp --dport 80 -j DNAT
> --to-destination 192.168.0.3:80

Do you have another rule, in your POSTROUTING chain, for allowing packets out 
of your network?   Something such as:

iptables -A POSTROUTING -t nat -j MASQUERADE

or maybe

iptables -A POSTROUTING -t nat -j SNAT --to MyIP

If you do, then simply change this rule to specify the external interface of 
your firewall, so that it doesn't do SNAT on packets coming in towards your 
webserver.   For example:

iptables -A POSTROUTING -t nat -o eth0 -j MASQUERADE
or
iptables -A POSTROUTING -t nat -o eth0 -j SNAT --to MyIP

assuming that eth0 is your external interface.

Antony.

-- 
My New Year's resolution is not to make any resolutions I can't keep.

I'm wondering whether I've failed already.

                                                     Please reply to the list;
                                                           please don't CC me.


