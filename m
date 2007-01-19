From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Filtering in PREROUTING
Date: Fri, 19 Jan 2007 17:34:13 +0000 (UTC)
Message-ID: <Pine.LNX.4.64.0701191727470.21488@darkstar.sysinfo.com>
References: <1169069905.10134.18.camel@len.t-t-l.co.uk>
	<web-4020726@bk3.webmaillogin.com>
	<45AED516.30800@riverviewtech.net> <45AF330A.6080701@zoomnet.ro>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45AF330A.6080701@zoomnet.ro>
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
To: Alexandru Dragoi <alex@zoomnet.ro>
Cc: Mail List - Netfilter <netfilter@lists.netfilter.org>, Grant Taylor <gtaylor@riverviewtech.net>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Thu, 18 Jan 2007, Alexandru Dragoi wrote:

>> 
>> Grant. . . .
>> 
> This works in an ideal world. But we are in internet, linux routers has to 
> deal with many compromised clients that send all sort of traffic, including 
> DDOS and so on. Filtering in mangle PREROUTING is the best. Otherwise, the 
> bulk traffic will traverse several other chains and the routing table, wich 
> consumes a lot of CPU, and many times your linux router will just get a 
> bigger load instead of crashing (yea, compromised hosts behind you can make 
> your machine crash, every time). If you use conntrack, it is even best to do 
> the filtering in raw table in PREROUTING, this way your conntrack table is 
> saved from being filled.
>

Actually, in earlier days, there was a fine way to deal with these 
matters, by *not* using a single choke point in the data stream off the 
internet connection, or for those blessed in earlier layouts and lables, a 
screening router, which was pretty much just that a small router that 
pre-filtered everything prior to it hitting the more "savvy"  and often 
complicated device labled back then "the firewall".  Course, these days, 
the lazy and cheap prefer to have the 
router-firewall-ids/ips-proxy-fax-printer-voip-kitchensink device that is 
tuned and prepped with a PHP interface with some ugly code off the 
internet shelves that will hit the security lists bi-weekly with issues in 
it's "well rounded" design forever....

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
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFFsQEYst+vzJSwZikRAh5xAKDTU/qhcSq+H/yldZaszOtspNqhdwCfU9Z8
O9YXs0IqpCxryU8Tj5wnbGU=
=5LRB
-----END PGP SIGNATURE-----

