From: Ola Nilsson <ola@fam-nilsson.org>
Subject: Re: IPSec through my firewall
Date: Wed, 16 Feb 2005 13:46:10 +0100
Message-ID: <87r7jgwu3x.fsf@helmut.nilsson.homedns.org>
References: <200502151715.j1FHFtfO029324@pepsi.fishpuppy.com>
	<200502160129.26423.rowdy@com> <4213200C.9060108@hotpop.com>
Mime-Version: 1.0
In-Reply-To: <4213200C.9060108@hotpop.com> (Georgi Alexandrov's message of
	"Wed, 16 Feb 2005 12:27:24 +0200")
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
Content-Transfer-Encoding: 7bit
To: Georgi Alexandrov <tehlists@hotpop.com>
Cc: netfilter@lists.netfilter.org

Georgi Alexandrov <tehlists@hotpop.com> writes:

> rowdy wrote:
>> I added rules like the following (but to user chains that I then
>> added to the input, output and forward chains) to solve my hassles
>> (clipped from the freeswan link above):
>> # allow IPsec
>>#
>># IKE negotiations
>>iptables -I INPUT  -p udp --sport 500 --dport 500 -j ACCEPT
>>iptables -I OUTPUT -p udp --sport 500 --dport 500 -j ACCEPT
>># ESP encryption and authentication
>>iptables -I INPUT  -p 50 -j ACCEPT
>>iptables -I OUTPUT -p 50 -j ACCEPT
>>
..snip
> that's more than pointless as he has INPUT, OUTPUT and FORWARD
> policies set to ACCEPT and no other rules.

Even so, I'm thankfull for any suggestions. 

So, going back to my initial question; How can I go about finding out
where my packets are droped? Since it's most likelly not because of
any netfilter rule entry, who else can decide that a packet can not be
NATed?

-- 
/Ola Nilsson


