From: bernard <bernard@gers.net>
Subject: Re: hostname forwarding
Date: Thu, 12 Dec 2002 13:20:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <p04330100ba1e2c781c57@[62.147.36.224]>
References: <Pine.LNX.4.33.0212111606240.17876-100000@www.csbenter.at>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0212111606240.17876-100000@www.csbenter.at>
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
To: netfilter@lists.netfilter.org

Thank again for your valuable help.

So apache can take http requests to do that but what's about the 
other protocols ?

It seems that squid can do a transparent proxy for some of them.

Do I need to use a specific solutions for each different protocol I 
want to set and what solution to use for the most common (telnet, 
pop, imap, ftp, ...) ?

Bernard

>this is not possible using ipotables
>
>Apache however can very well handle this ..
>
>
>On Wed, 11 Dec 2002, bernard wrote:
>
>>  I'm using iptables to redirect external requests depending on their
>>  port/protocol like this :
>>
>>	hostname A:80 -> public ip -> iptables -> 192.168.1.1:80
>>	hostname B:80 -> public ip -> iptables -> 192.168.1.1:80
>>
>>  It works pretty well, thanks to iptables :-)
>>
>>  Now I want to redirect on a hostname basis on different private ip's
>>  like this :
>>
>>	hostname A:80 -> public ip -> iptables -> 192.168.1.1:80
>>	hostname B:80 -> public ip -> iptables -> 192.168.1.2:80
>>
>>  Does anyone know a solution ?
>>
>>  Thanks for your help.
>>
>>  Bernard
>>
>
>--
>---
>Kind Regards
>Patrick Maartense (using Pine on a Text Console)


