From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: 1:1 nat not working;
Date: Sat, 4 Jun 2005 18:19:34 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0506041808480.2474@darkstar.sysinfo.com>
References: <Pine.LNX.4.60.0506041550330.2474@darkstar.sysinfo.com>
	<20050604205959.GA20903@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050604205959.GA20903@bender.817west.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Sat, 4 Jun 2005, Jason Opperisano wrote:

> On Sat, Jun 04, 2005 at 04:04:18PM -0400, R. DuFresne wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>>
>> Okay, I need help getting this working, I've wasted too much time on it
>> and can't get it functional.
>>
>> address mappings in /etc/hosts ;
>>
>> # IP Block:  public-IP.16/28
>> # usable IPs are public-IP.18 - public-IP.30
>> # base subnet   public-IP.16
>> # broadcast address  public-IP.31
>> # subnet mask 255.255.255.240
>
> and you've added the IP's .18 - .30 as aliases on your external
> interface of your firewall machine with:
>
>  for i in `seq 18 30`; do
>    ip addr add x.y.z.${i} dev ${EXT_IF}
>  done
>
> right?

No I had not and that was the bit if majik I was missing, thank you sir 
for the spell casting!

>
> as an aside, you could reduce the number of rules you have by using
> NETMAP and a bit of auto-summarization:
>
>  x.y.z.18/31
>  x.y.z.20/30
>  x.y.z.24/30
>  x.y.z.28/31
>  x.y.z.30/32
>
>  iptables -t nat -A PREROUTING -d x.y.z.18/31 \
>    -j NETMAP --to 192.168.80.18/31
>  iptables -t nat -A POSTROUTING -s 192.168.80.18/31 \
>    -j NETMAP --to x.y.z.18/31
>


I'd thought about doing that, to reduce finger fatigue and rules, but, was 
not sure it was appropo to the situation since the router and the external 
interface are not matched up on the inside directly.  The router wihch has 
a x.y.z.17 address does not appear on the inside, and the ecternal 
interface does not either, so to play it safe I went rule happy.

One quick question, if I might ask now that this is functioning;

I had a nice working set of rules prior to this change over, some of which 
I've been using as input to the firewall directly.  Can I pretty much just 
pop in the whole ruleset now with these additions and pretty much expect 
it to work as it was?  Or will I have to specifically make change to 
systems that once were inside addresses and now are private inside 
adderesses?  such as;

ipt -t filter -A INPUT -p TCP -i $inside -m state --state NEW -s $quasar 
- -j LOG $LOGOPT --log-prefix "qu
asar internal syn to fw : "
$ipt -t filter -A INPUT -p TCP -i $inside -m state --state 
NEW,ESTABLISHED,RELATED -s $quasar --dport 113
  -j ACCEPT
$ipt -t filter -A INPUT -p TCP -i $inside -m state --state NEW -s $quasar 
- -j DROP


$quesar being the public address, or does it now change such that I make 
rules secifying the internal address in the rule;

ipt -t filter -A INPUT -p TCP -i $inside -m state --state NEW -s 
$quasarnet -j LOG $LOGOPT --log-prefix "quasar internal syn to fw : "
$ipt -t filter -A INPUT -p TCP -i $inside -m state --state 
NEW,ESTABLISHED,RELATED -s $quasarnet --dport 113
  -j ACCEPT
$ipt -t filter -A INPUT -p TCP -i $inside -m state --state NEW -s 
$quasarnet -j DROP


But I am as many other deeply indebted sir to your majik!

Thanks,

Ron DuFresne
- -- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFCoij5st+vzJSwZikRAi3bAKCma11Z5fEZeRgSJBzIcMBTCGt2TwCfTxjb
xsAqwEqkeSp0LdvyJ/4Ql4k=
=uaDi
-----END PGP SIGNATURE-----

