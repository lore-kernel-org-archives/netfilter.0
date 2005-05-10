From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Help: iptables NAT broken with pppoe
Date: Mon, 9 May 2005 23:00:37 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0505092258520.21981@darkstar.sysinfo.com>
References: <1115397393l.3864l.0l@antares.localdomain>
	<427C5C41.3010407@riverviewtech.net>
	<1115496014l.3549l.0l@antares.localdomain>
	<427EFB7D.8010503@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <427EFB7D.8010503@riverviewtech.net>
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
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Mon, 9 May 2005, Taylor, Grant wrote:


 	[SNIP]

>
> *nod*
>
>> The modules ipt_MASQUERADE and iptable_nat *are* loaded, btw.
>> 
>>> Also, what is your "echo 2 > /proc/sys/net/ipv4/ip_dynaddr" doing for 
>>> you?
>> 
>> I don't see any messages in /var/log messages or in dmesg, if you mean 
>> that. Or did I miss your point here? I found some howto where they stated 
>> this would be necessary...


ip_dynaddr
- ----------

Enable dynamic  socket  address rewriting on interface address change. 
This is useful for dialup interface with changing IP addresses.


located under the kernel tree is the doc on pro/sys  sysctl;

/usr/src/linux-<kern ver>/Documentation/filesystems/proc.txt


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

iD8DBQFCgCPYst+vzJSwZikRAlC3AKCr3sM3oO7fz3V7uutaLlKCnmsbkQCgyLjq
bgu2VI/ftJQ4II5auBy6CTY=
=BiR3
-----END PGP SIGNATURE-----

