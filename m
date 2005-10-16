From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: removing duplicate rules
Date: Sun, 16 Oct 2005 03:58:55 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0510160358290.23213@darkstar.sysinfo.com>
References: <6.2.1.2.0.20051016030004.030e32a0@147.202.41.46>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6.2.1.2.0.20051016030004.030e32a0@147.202.41.46>
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
To: amit pasari <amit@xsinfoways.com>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Sun, 16 Oct 2005, amit pasari wrote:

>
>
> hello,
> i have been using iptables for quite sometime , Now my problem is , if by 
> make i add multiple type of same rule in iptables it accepts N number of 
> entries . So can any body tell me how to aviod that or can i check the same 
> rule exists before Appending it into the table.
> Eg : iptables -A INPUT -d 192.168.0.2/32 -i eth1 -j DROP
> i have add the above rules 10 times 20 times but the system never says the 
> above rule exist . Can anybody tell me how can i check or aviod .
>

grep?


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

iD8DBQFDUghCst+vzJSwZikRAsIpAKCbK+H2iM4OrnX/YGDmmN/SpphHOACfRXbc
lA4Ca2xTnrUro05Omj7ATR0=
=GSPW
-----END PGP SIGNATURE-----

