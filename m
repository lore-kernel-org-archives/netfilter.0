From: John Lister <john.lister@kickstone.com>
Subject: Re: Round Robin or Random Source NATing
Date: Tue, 22 Feb 2011 23:50:52 +0000
Message-ID: <4D644BDC.1020107@kickstone.com>
References: <4D642A6B.4050806@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D642A6B.4050806@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kirk Hoganson <kirkhoganson@gmail.com>
Cc: netfilter@vger.kernel.org

On 22/02/2011 21:28, Kirk Hoganson wrote:
> I am attempting to create a series of rules that source nat web 
> traffic amongst a pool of IP addresses.  I have used the nth mode to 
> cycle through the IP address in a round robin fashion.  I am using the 
> following rules:
>
> $IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
> multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 0 
> -j SNAT --to-source 1.104.126.216
Beware that the statistic module counts apply PER rule and not to some 
global counter as they used to in earlier versions - this caught me out 
before. So with your case, the first rule is matched every 24 packets, 
but the second one is matched every 24 packets NOT matched by the 
earlier rule, and so on. So any default in your case is much more likely 
to happen than you expect.
try doing something like:
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 0 
-j SNAT --to-source 1.104.126.x
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 23 --packet 0 
-j SNAT --to-source 1.104.126.x
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 22 --packet 0 
-j SNAT --to-source 1.104.126.x


The same applies with random, you need to reduce the probability based 
on the chance of it being hit, eg:
.25, .33, .50, 1
