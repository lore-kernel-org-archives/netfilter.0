From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: drop all out going SMTP connection bar two
Date: Wed, 02 Aug 2006 14:02:24 +0200
Message-ID: <44D09450.8060606@freemail.hu>
References: <44CFDAC2.6010601@simonloewen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44CFDAC2.6010601@simonloewen.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>

Simon Loewen :
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA512
>
>
>
> Hi,
>
> I would like to drop all out going SMTP connections through our router
> except smtp1.internal and smtp2.internal on all of the outbound
> interfaces.  I would like to filter on the destination port 25.
>
> Would this be easy to do?
>
> Thanks for any advise,
> S.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.4 (GNU/Linux)
>
> iD8DBQFEz9rCkcP1ZXUvpGURCrZ7AJ4haVmH4Hypjq6LjgBFRNFav6EQ1QCgkMkk
> m4I4NLc3u12NXg2cOwdrCxE=
> =kQ8+
> -----END PGP SIGNATURE-----
>
Try this:

iptables -t filter -A FORWARD -j ACCEPT -p tcp -d ip.of.smtp1 --dport 25
iptables -t filter -A FORWARD -j ACCEPT -p tcp -d ip.of.smtp2 --dport 25
iptables -t filter -A FORWARD -j DROP -p tcp --dport 25

In our network I have redirected all smtp traffic to our internal SMTP 
server and then allowed that server to send e-mails... :)


