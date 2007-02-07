From: Ken A <ka@pacific.net>
Subject: Re: a whitelist for outgoing syn port 80, 443 traffic for hosting
Date: Wed, 07 Feb 2007 11:09:04 -0800
Message-ID: <45CA23D0.5050702@pacific.net>
References: <45CA0B2A.7010704@pacific.net> <45CA1D0E.2040603@yahoo.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45CA1D0E.2040603@yahoo.co.uk>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>



franck wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Ken A wrote:
>> Hello,
>>
> 
> Hi,
> 
>> Is anyone aware of a whitelist of hostnames of port 80,443 OUTGOING
>> traffic that should be considered 'normal' in a hosting environment?
>> ie: SYN traffic to ups.com, authorize.net, technorati, for ecommerce,
>> blogging, etc..
>>
>> Categorizing traffic as good/bad is useful in this day of many php
>> remote file include bugs.
>>
>> Thanks,
> 
> Maybe this is what you are looking for :
> 
> http://someonewhocares.org/hosts/zero/

Thanks, but I'm looking for a whitelist for a fairly wide range of web 
applications, not a blacklist. There are plenty of good blacklists out 
there. surbl.org, uribl.com , etc. :-)
Ken


> 
> - --
> Franck Joncourt
> http://www.debian.org
> http://smhteam.info/wiki/
> GPG server : pgpkeys.mit.edu
> Fingerprint : C10E D1D0 EF70 0A2A CACF  9A3C C490 534E 75C0 89FE
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.6 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
> 
> iD8DBQFFyh0NxJBTTnXAif4RAoThAKDXxecdEq5gWmncfj7TmOcb5EAdbgCfZrnx
> S/QzndrwWbq1CPhal5eQy8k=
> =mf7k
> -----END PGP SIGNATURE-----
> 
> 		
> ___________________________________________________________ 
> The all-new Yahoo! Mail goes wherever you go - free your email address from your Internet provider. http://uk.docs.yahoo.com/nowyoucan.html
> 
> 

