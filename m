From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Fwd: Re: IP Tables slows network response times
Date: Mon, 15 Aug 2005 17:35:50 +0200
Message-ID: <4300B656.40704@mnemon.de>
References: <200508152332.15400.michael@networkstuff.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508152332.15400.michael@networkstuff.co.nz>
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

Oohps, forgot to send to the list :(

Michael Hallager schrieb:
[SNIP]

> *filter
> :INPUT DROP [0:0]
> :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [24885:3543903]
> -A INPUT -i lo -j ACCEPT
> -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A INPUT -d 202.150.101.225 -p tcp -m tcp --dport 22 -j ACCEPT
> -A INPUT -d 202.150.101.225 -p tcp -m layer7 --l7proto smtp -m tcp --dport 25 
> -j ACCEPT
> -A INPUT -d 202.150.101.225 -p tcp -m layer7 --l7proto dns -m tcp --dport 53 
> -j ACCEPT
> -A INPUT -d 202.150.101.225 -p udp -m layer7 --l7proto dns -m udp --dport 53 
> -j ACCEPT
> -A INPUT -d 202.150.101.235 -p tcp -m layer7 --l7proto dns -m tcp --dport 53 
> -j ACCEPT
> -A INPUT -d 202.150.101.235 -p udp -m layer7 --l7proto dns -m udp --dport 53 
> -j ACCEPT
> -A INPUT -d 202.150.101.225 -p tcp -m layer7 --l7proto http -m tcp --dport 80 
> -j ACCEPT
> -A INPUT -d 202.150.101.225 -p tcp -m tcp --dport 110 -j ACCEPT
> -A INPUT -d 202.150.101.226 -p tcp -m tcp --dport 443 -j ACCEPT
> -A INPUT -d 202.150.101.227 -p tcp -m tcp --dport 443 -j ACCEPT
> -A INPUT -s 129.223.123.249 -d 202.150.101.225 -p tcp -m tcp --dport 9050 -j 
> ACCEPT
> -A OUTPUT -o lo -j ACCEPT
> COMMIT
> # Completed on Mon Aug 15 23:29:05 2005
> root@202-150-101-225:/home/michael#     

Ok, I see. I think your problem is related to L7, 'cause you cannot have
a policy of DROP with L7. The following is likely to happen:

1.) You get e.g. an SMTP request == SYN bit set.
2.) As none of your rules match the packet hits the policy,
    which is DROP.
3.) L7 is never able to recognize the SMTP protocol.

So I don't think that the network speed is slowed down, I think there is
no SMTP, DNS and HTTP connection at all. You have no problem with POP3
and HTTPS, right ?

I would recommend the following:

1.) Move your L7 rules to mangle/PREROUTING *and* mangle/POSTROUTING.
    This is because you don't forward the packets. As Eric said,
    some protocols are recognized in OUTPUT and some in INPUT.
2.) Omit the port with L7. L7 is designed for detecting protocols,
    even on non standard ports (well, that's one point :)) You
    may omit -p too.
3.) Don't rely on L7 in terms of security (you read the HOWTO ?) !!
4.) Filter in filter table. If you really want to filter with L7,
    I think it's best, to mark the packets in PREROUTING and
    and then filter based on the marks in filter table. Only my 2C.

If you don't have the need of recognizing protocols (means: using L7 for
convenience), do standard filtering like port matches and so on using
connection tracking (so, compile nat into the kernel).

HTH and have a nice time,

Joerg



