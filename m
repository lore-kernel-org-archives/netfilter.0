From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: how do you specify an entire domain like *.mydomain.com
Date: Thu, 22 Jan 2004 11:41:40 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401221141.40220.Antony@Soft-Solutions.co.uk>
References: <34198.66.65.52.125.1074770755.squirrel@sojourn.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <34198.66.65.52.125.1074770755.squirrel@sojourn.dyndns.org>
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

On Thursday 22 January 2004 11:25 am, Technical wrote:

> -A RH-Firewall-1-INPUT -s *.*.myvwz.com -m state --state NEW -m tcp -p tcp
> --dport 110 -j ACCEPT

Netfilter does not operate by hostnames / network domains - it operates by IP 
addresses and network ranges.

Therefore if myvwz.com own a Class C range (or some other readily specified 
subnet), you can specify -s $RANGE/24 etc, but you can't do it by DNS domain.

Note that you *can* specify a hostname in an iptables rule, but it will get 
resolved as soon as the rule is entered, and then the IP address will be what 
netfilter actually uses internally - it won't get resolved again.

Regards,

Antony.

-- 
If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

                                                     Please reply to the list;
                                                           please don't CC me.


