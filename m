From: franck <joncourt_franck@yahoo.co.uk>
Subject: Re: Drop random 20% of packets on port?
Date: Fri, 09 Feb 2007 00:40:27 +0100
Message-ID: <45CBB4EB.3040407@yahoo.co.uk>
References: <20070208181407.78f630a8.mba2000@ioplex.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070208181407.78f630a8.mba2000@ioplex.com>
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
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Michael B Allen wrote:
> I have several network protocol handlers that I would like to test. Can
> someone recommend a method to deliberatedly drop a certain percentage
> of packets destined for a particular port and in a random way using
> netfilter or something else?
> 
> Mike
> 
> 

Have a look at this :

http://www.netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO-3.html#ss3.14

I have never used it before, so I cannot help you more.

- --
Franck Joncourt
http://www.debian.org
http://smhteam.info/wiki/
GPG server : pgpkeys.mit.edu
Fingerprint : C10E D1D0 EF70 0A2A CACF  9A3C C490 534E 75C0 89FE
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFFy7TrxJBTTnXAif4RAsLtAKDG/XfSypU/Fp5O2/m/bBV3/xnWvgCfUc8R
yzpvpPWZOrB0DPcxZsocDfQ=
=bEUR
-----END PGP SIGNATURE-----

		
___________________________________________________________ 
Copy addresses and emails from any email account to Yahoo! Mail - quick, easy and free. http://uk.docs.yahoo.com/trueswitch2.html


