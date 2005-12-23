From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Spammer are using port 80 on my firewall to send spam
Date: Fri, 23 Dec 2005 06:18:45 -0500 (EST)
Message-ID: <Pine.LNX.4.60.0512230438370.3771@darkstar.sysinfo.com>
References: <BAY7-F2612B87A52F804BFFDF04487330@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY7-F2612B87A52F804BFFDF04487330@phx.gbl>
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
To: Jacques Beaudoin <jacques-beaudoin@hotmail.com>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Fri, 23 Dec 2005, Jacques Beaudoin wrote:

> Greetings,
>
> Im getting hit by spammer on port 80 on my firewall thats is also running 
> squid.
>
> If i open port 80 to my mail server via prerouting,  spammer wiill use
> my firewall to send spam.
>
> Port 80 is now block and i can see on my internet interface all
> ip address trying to use my firewall as a spam proxy.
>
> My squid rules looks ok.


But it sounds like the websewrver<s> is/are running a script/form/app that 
is vulneralble, start the fix there, correct the problem that the "attacker" 
is exploiting.  Your squid and webserver logs should point at clues to 
what's borked.

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

iD8DBQFDq90Yst+vzJSwZikRAmdVAJ9Vk3Gbsq4BHVUqAsar6R49VgAnWQCffiHi
R/RxTi9XBe+TbdDkTKRPCBM=
=XQfd
-----END PGP SIGNATURE-----

