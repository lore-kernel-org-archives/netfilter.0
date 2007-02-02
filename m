From: franck <joncourt_franck@yahoo.co.uk>
Subject: Re: SSHBrute Force: False Postives
Date: Fri, 02 Feb 2007 21:39:28 +0100
Message-ID: <45C3A180.2020700@yahoo.co.uk>
References: <20070201120648.GA19604@animx.eu.org>	<20070201131319.71585.qmail@web25512.mail.ukl.yahoo.com>	<20070201231733.GA21833@animx.eu.org>	<20070202143815.GA30820@minastirith>
	<20070202172654.GA24236@animx.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070202172654.GA24236@animx.eu.org>
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

Wakko Warner wrote:
> Michael Rash wrote:
>>> franck joncourt wrote:
>>>> In order to prevent such attacks, you can write iptables rules to set up port knocking. This is the way, I do.
>>> I thought about doing this, but I ultimately decided against it.  The
>>> problems of doing the knocking outweighted the benefits.  I prefer to let
>>> them try a few times before my current rules ban them.
>> If someone finds a remote exploit in sshd, then just allowing
>> connections at all can potentially expose you to compromise.  As far as
> 
> True.
> 
>> port knocking is concerned, I agree, there are a ton of problems.  There
>> is a better alternative called Single Packet Authorization:
>>
>> http://www.cipherdyne.org/fwknop/docs/SPA.html
>>
>> Fwknop is an implementation that is based around iptables:
>>
>> http://www.cipherdyne.org/fwknop/
> 
> This still means that all authorized users have to do this which is not what
> I want to do.  What if I'm at someone's house and decide I want in to my
> system and they don't have any way of performing the port knocking or the
> fwknop.
> 

According to me, the only way to safely use ssh without having any
sequence to perform, is the use of private/public key with passphrase.

I have already heard about encrypted knocks, and this one seems great. I
will give it a try.

- --
Franck Joncourt
http://www.debian.org
http://smhteam.info/wiki/
GPG server : pgpkeys.mit.edu
Fingerprint : C10E D1D0 EF70 0A2A CACF  9A3C C490 534E 75C0 89FE
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFFw6GAxJBTTnXAif4RAvVCAKDPqJCbdfkwUY/BBqB5wbsVLWJqlwCgq3/3
jv30ZCnHgUxBAy25ekdnmBw=
=x2og
-----END PGP SIGNATURE-----

		
___________________________________________________________ 
Inbox full of spam? Get leading spam protection and 1GB storage with All New Yahoo! Mail. http://uk.docs.yahoo.com/nowyoucan.html


