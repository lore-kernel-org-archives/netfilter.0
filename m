From: Michael Kearey <mutk@iprimus.com.au>
Subject: Re: string is not working, any help?
Date: Wed, 11 Jun 2003 11:16:32 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EE682F0.60800@iprimus.com.au>
References: <1055289564.829.3.camel@dejawu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1055289564.829.3.camel@dejawu>
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
To: IPtables Users <netfilter@lists.samba.org>

Esteban wrote:
<snip>
> root@dejawu:~# iptables -t mangle -A PREROUTING -p tcp -m --string
> "pepee" -j DROP
> iptables v1.2.7a: Couldn't load match
> `--string':/lib/iptables/libipt_--string.so: 

The clue is above. You don't have 'so' called libipt_--string, it's 
called libipt_string.so

>cannot open shared object
> file: No such file or directory
> 
> Try `iptables -h' or 'iptables --help' for more information.
> 
> why is not working --string match??
> im using pom version patch-o-matic-20030107 under 2.4.20 kernel.

The correct syntax is :

iptables -t mangle -A PREROUTING -p tcp -m string "pepee" -j DROP

Cheers,
Michael


