From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Connect to localhost bound port from outside?
Date: Tue, 6 Feb 2007 14:13:44 -0500 (EST)
Message-ID: <Pine.LNX.4.64.0702061413090.3777@darkstar.sysinfo.com>
References: <eppgne$mc1$1@sea.gmane.org> <45C06BE7.2080208@plouf.fr.eu.org>
	<45C0B772.2090201@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45C0B772.2090201@riverviewtech.net>
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
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wed, 31 Jan 2007, Grant Taylor wrote:

> Pascal Hambourg wrote:
>> Iptables will happily redirect anything you like to localhost, but the 
>> kernel IP routing prohibits communications with a loopback address on a non 
>> loopback interface and thus will drop the packets. This is similar to the 
>> problem in the above thread "port forwarding through localhost", and the 
>> same workaround is applicable.
>
> Does this apply if the reverse path filter is turned off?  Or is this a hard 
> coded filter in the kernel that can not be gotten around?
>
> Another thought to the OP would be to use the Dummy interface in lieu of the 
> Loop Back interface as I believe it does not have the same restrictions that 
> Loop Back does.  However I could be mistaken.
>
> I have often considered using lo for local only but using dummy as a spur 
> network to bind services to and then route traffic in to the spur network. 
> Thoughts / Opinions?
>


What's a "dummy" interface?

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

iD8DBQFFyNNrst+vzJSwZikRAsmSAJ9yEz0ES2p3uwqd2nI6rqQ1+zFXNgCeNi8Z
kcbjNi0RSrT0Q63CTUHlWxA=
=SGzJ
-----END PGP SIGNATURE-----

