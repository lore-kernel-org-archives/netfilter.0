From: Geert van der Ploeg <netfilter@geert.triple-it.nl>
Subject: Re: iptables-restore: commit not at end of table
Date: Fri, 11 Mar 2005 14:45:10 +0100
Message-ID: <4231A0E6.7050800@geert.triple-it.nl>
References: <422EE146.1070808@geert.triple-it.nl>
	<422EFDF0.7000302@eurodev.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <422EFDF0.7000302@eurodev.net>
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
To: Pablo Neira <pablo@eurodev.net>, netfilter@lists.netfilter.org

Pablo Neira wrote:
> Geert van der Ploeg wrote:
>> After updating a firewall from iptables 1.2.7a to a later version, my
>> ruleset doesn't work anymore.
>> It fails on COMMIT-lines that are not at the end of a table definition.
<snip>
>>
>> Having looked at the source-code, I discovered that it is caused by some
>> extra checks on 'in_table' (in iptables-restore.c), which got inserted
>> between 1.2.7a and 1.2.8. The changelog doesn't say why.
> 
> 
> 
> Could you try to reproduce such error with lastest iptables 1.3.1? If
> so, please post the complaining section of rules, it could be useful for
> debugging.

Thanks for your reaction, Pablo.

I've tried it with iptables 1.3.1 on kernel 2.6.1: same results.

No COMMIT possible when followed by more rules within the same table.

~~~~~~~~~~~~~

[10:03=root@nomad /tmp/iptables-1.3.1]# ./iptables-restore < config
iptables-restore: line 31 failed

[10:03=root@nomad /tmp/iptables-1.3.1]# cat -n config
.....
    24
    25  ## Everything from localhost
    26  -A INPUT -i lo -j ACCEPT
    27
    28
    29  COMMIT
    30
    31  -A INPUT -m tcp -p tcp --dport 21 -j ACCEPT
    32  -A INPUT -m tcp -p tcp --dport 22 -j ACCEPT
.....
~~~~~~~~~~~~~

And yes: I'm absolutely sure it's not line 31 which contains an error:
if I remove the COMMIT on line 29, no errors occur at all..

I can give you the whole config if needed...


Regards,

Geert van der Ploeg

