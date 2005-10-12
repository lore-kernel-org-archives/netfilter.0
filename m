From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: IP Vs DNS
Date: Tue, 11 Oct 2005 20:38:33 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0510112019370.13393@darkstar.sysinfo.com>
References: <434C28FB.3000805@ttienterprises.org>
	<20051011231030.GA18418@salty>
	<434C520F.4050308@ttienterprises.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <434C520F.4050308@ttienterprises.org>
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
To: Barry Fawthrop <barry@ttienterprises.org>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tue, 11 Oct 2005, Barry Fawthrop wrote:

>
> Jim Laurino wrote:
>
>>> Greetings all
>>> 
>>> with an IPTABLES ruleset you can specify an IP address to be 
>>> allowed/blocked
>>> iptables INPUT -s 12.12.12.12 -j ALLOW
>>> 
>>> But can this be done with a DNS name
>>> iptables INPUT -s www.name.com -j ALLOW
>> 
>> 
>> IPTABLES accepts DNS names, but the DNS lookup is performed
>> when the rule is placed in the kernel,
>> not when the rule is evaluated against a packet.
>> The kernel (netfilter) rules use ip address only.
>> 
>> To achieve what you want, I think you would have to
>> update the rule whenever the DNS mapping changed.
>> 
> How can this be done on a per packet basis, where the IP is checked regularly
> or can the table be flushed and reloaded every hour.
> What would be the negative of doing a reload each hour??


During the reload, depending upon how long the rules take to be 
implimented, unless one is careful about things like turning off 
forwarding and such, there is the exposure window of the network behind 
the firewall.  Now if one has a nice, tight and short ruleset, the 
exposure window might be all iof two seconds or so, but if one has one of 
them fancy 20,000 rulsets, this exposure window might be a bit broader.

Proper placement of the 'echo "0" > /proc/sys/net/ipv4/ip_forward' and 
'echo "1" > /proc/sys/net/ipv4/ip_forward' commands within the rulesets is 
then all important when recycling the FW.  Another way around this 
might be to down all interfaces during the FW recycle, bringing them up 
after it;s complete.  Yet the thing is that DNS changes to sites like 
those mentioned above rarely takes place in any hourly let alone daily or 
weekly windows.  Now the real question is, can one control another sites 
load balancing and DNS features with funky crafting of iptables rules? 
I'm guessing in some cases it works, and in other cases yer hosing lots 
of attempts to reach a site that is not single hosted, depending upon the 
load balancing scheme<s> in place by the site owners.


Then again, what is the real goal of considering limiting to a particular 
machine for a multi-hosted site?  Is one more trustworthy then another?

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

iD8DBQFDTFsNst+vzJSwZikRAoh2AJ9zSnReJPnHL/EUEflacEeeQbRJ0gCeOD7+
wTlVaDm81UWVE+j1J/Iqm4w=
=dBeq
-----END PGP SIGNATURE-----

