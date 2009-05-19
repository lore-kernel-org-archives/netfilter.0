From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Ebtables ruleset isn't working, any ideas?
Date: Tue, 19 May 2009 21:08:09 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0905192100250.8786@blackhole.kfki.hu>
References: <740443.89728.qm@web44813.mail.sp1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <740443.89728.qm@web44813.mail.sp1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miguel Ghobangieno <mikeeusa@yahoo.com>
Cc: netfilter@vger.kernel.org

On Tue, 19 May 2009, Miguel Ghobangieno wrote:

> I'm trying to make a bridge firewall that allows ssh in, and allows 
> http/https out, but nothing else... ebtable ruleset isn't working Sad
> 
> This is what I have so far. When I set the default policy to allow 
> everything gets through, when deny nothing gets through:
[...]

Why don't you add log watchers to every of your rules as the last "match"? 
Thus you could see at least which rules match. Your rules seem to be OK 
but with logging enabled that'd be definitely answered. Without more 
information, nobody could help you.

[And don't spam mailing lists like openssl-users which has nothing to do 
with ebtables, even if you are desperate.]

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
