From: "Anthony Sadler" <anthonys@faredge.com.au>
Subject: RE: IP Vs DNS
Date: Wed, 12 Oct 2005 10:48:33 +1000
Message-ID: <46196.0852881477$1129361969@news.gmane.org>
References: <Pine.LNX.4.60.0510112019370.13393@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.60.0510112019370.13393@darkstar.sysinfo.com>
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
To: "'R. DuFresne'" <dufresne@sysinfo.com>, 'Barry Fawthrop' <barry@ttienterprises.org>
Cc: netfilter@lists.netfilter.org

Prehaps instead of reload the whole table, why not just reload the =
particular rule?=20
Eg:

1. Ping www.name.com, dump IP into 1st file. Grep should help you here.=20
2. Pick up IP from 1st file and use it to write rule.=20

3. Ping www.name.com, dump IP into 2nd file.
4. Pick up IP from 2nd file and insert new rules.
5. Using 1st file, delete rules that correspond to 2nd IP.

6. Ping www.name.com, dump IP into 1st file. =20
7. Pick up IP from 1st file and use it to write rule.=20
8. Using 2nd file, delete rules that correspond to 2nd IP.

You should be able to kick off steps 1,2 yourself, then have scripts do =
steps 3-5 and 6-8. That way you should limit your downtime and processer =
usage.

Anthony Sadler
Far Edge Technology
w: (02) 8425 1400
=20
-----Original Message-----
From: netfilter-bounces@lists.netfilter.org =
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of R. DuFresne
Sent: Wednesday, 12 October 2005 10:39=20
To: Barry Fawthrop
Cc: netfilter@lists.netfilter.org
Subject: Re: IP Vs DNS=20

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tue, 11 Oct 2005, Barry Fawthrop wrote:

>
> Jim Laurino wrote:
>
>>> Greetings all
>>>=20
>>> with an IPTABLES ruleset you can specify an IP address to be=20
>>> allowed/blocked
>>> iptables INPUT -s 12.12.12.12 -j ALLOW
>>>=20
>>> But can this be done with a DNS name
>>> iptables INPUT -s www.name.com -j ALLOW
>>=20
>>=20
>> IPTABLES accepts DNS names, but the DNS lookup is performed
>> when the rule is placed in the kernel,
>> not when the rule is evaluated against a packet.
>> The kernel (netfilter) rules use ip address only.
>>=20
>> To achieve what you want, I think you would have to
>> update the rule whenever the DNS mapping changed.
>>=20
> How can this be done on a per packet basis, where the IP is checked =
regularly
> or can the table be flushed and reloaded every hour.
> What would be the negative of doing a reload each hour??


During the reload, depending upon how long the rules take to be=20
implimented, unless one is careful about things like turning off=20
forwarding and such, there is the exposure window of the network behind=20
the firewall.  Now if one has a nice, tight and short ruleset, the=20
exposure window might be all iof two seconds or so, but if one has one =
of=20
them fancy 20,000 rulsets, this exposure window might be a bit broader.

Proper placement of the 'echo "0" > /proc/sys/net/ipv4/ip_forward' and=20
'echo "1" > /proc/sys/net/ipv4/ip_forward' commands within the rulesets =
is=20
then all important when recycling the FW.  Another way around this=20
might be to down all interfaces during the FW recycle, bringing them up=20
after it;s complete.  Yet the thing is that DNS changes to sites like=20
those mentioned above rarely takes place in any hourly let alone daily =
or=20
weekly windows.  Now the real question is, can one control another sites =

load balancing and DNS features with funky crafting of iptables rules?=20
I'm guessing in some cases it works, and in other cases yer hosing lots=20
of attempts to reach a site that is not single hosted, depending upon =
the=20
load balancing scheme<s> in place by the site owners.


Then again, what is the real goal of considering limiting to a =
particular=20
machine for a multi-hosted site?  Is one more trustworthy then another?

Thanks,

Ron DuFresne
- --=20
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint =3D 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFDTFsNst+vzJSwZikRAoh2AJ9zSnReJPnHL/EUEflacEeeQbRJ0gCeOD7+
wTlVaDm81UWVE+j1J/Iqm4w=3D
=3DdBeq
-----END PGP SIGNATURE-----



