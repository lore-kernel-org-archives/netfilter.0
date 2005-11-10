From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Help on port forwarding + Origin and Destination IP rewriting...
Date: Thu, 10 Nov 2005 08:45:50 -0600
Message-ID: <200511100845.51110.rob0@gmx.co.uk>
References: <20051110141458.87269.qmail@web60024.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051110141458.87269.qmail@web60024.mail.yahoo.com>
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

On Thursday 2005-November-10 08:14, luisccmail-netfilter@yahoo.com.br 
wrote:
>   iptables -t nat -A PREROUTING -p tcp \
>            -d box-a.local --destination-port 2200 \
>            --jump DNAT --to-destination box-b.local:2222
>
>   # This should re-write outgoing connections after routing,
>   # so they appear to originate from the Box-A host.
>   iptables -t nat -A POSTROUTING -p tcp \
>            -d box-b.local --destination-port 2222 \
>            --jump SNAT --to-source box-a.local
>   # EOF #############################
>
>   Oh, well, now begin my problem: this doesn't work, and I don't have

iptables won't resolve names in --to-(source|destination) arguments. 
Hint: when the man page says "ipaddr" for an argument it means you must 
use numeric dotted quad IP addresses, not gethostbyname() or DNS names.

If you want to retain control of name-to-address mapping, use a bit of 
shell code in `` backticks to extract your IP address. Yours would be a 
grep(1) and cut(1)[1] job. Or if you use DNS names, dig(1):
    `dig +short name.fqdn`
That will return just the IP if there is a single "A" record for 
"name.fqdn".



[1] /bin/cut is easy, but it invokes another process. If you're using 
bash(1) there are numerous ways to slice and dice the output of your 
grep(1) command all within the presently running shell. I'm a bit hazy 
on the details and it's off topic here anyway. :) Use whichever is 
easiest for you; just be aware that the bash way is a tiny bit better.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

