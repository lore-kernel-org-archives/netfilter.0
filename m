From: "testmail" <testmail@peterpaul.com.ph>
Subject: Re: Iptables Problems
Date: Fri, 3 Dec 2004 14:38:34 +0800
Message-ID: <002801c4d902$b6ad7700$0200a8c0@etpi>
References: <OF60ADB785.65F94CAE-ONC1256F5E.002BF2C6-C1256F5E.002C019B@promon.cz>
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
Content-Type: text/plain; charset="us-ascii"
To: a.ledvinka@promon.cz
Cc: Netfilter <netfilter@lists.netfilter.org>

What does -P represent from your iptable command  >>>>> iptables -t
filter -P INPUT DROP ?
And thank you for the docu.link
http://www.netfilter.org/documentation/HOWTO/packet-filtering-HOWTO-6.html

I will try to understand first all the suggestion that you posted.

Thanks,
Milo
----- Original Message -----
From: <a.ledvinka@promon.cz>
To: "testmail" <testmail@peterpaul.com.ph>
Cc: "Netfilter" <netfilter@lists.netfilter.org>
Sent: Thursday, December 02, 2004 04:00 PM
Subject: Re: Iptables Problems


> > # Set the default policy
> > iptables -t filter -A INPUT  -j DROP
> iptables -t filter -P INPUT DROP



