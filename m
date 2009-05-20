From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Ebtables ruleset isn't working, any ideas?
Date: Wed, 20 May 2009 09:24:32 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0905200920120.10018@blackhole.kfki.hu>
References: <557700.63037.qm@web44807.mail.sp1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <557700.63037.qm@web44807.mail.sp1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miguel Ghobangieno <mikeeusa@yahoo.com>
Cc: netfilter@vger.kernel.org

On Tue, 19 May 2009, Miguel Ghobangieno wrote:

> Ok I broke the rules up, and I used the hex value for the protocals 
> rather than the ascii "IP" etc; it workes now. This is a debian stable 
> box, I guess the ebtables that comes in apt is too ancient. I would like 
> to log everyone who attepts to access port 22 tcp on eth2 though (allow 
> them through but log). 

If `ebtables -h log` does not produce the help text of the log watcher, 
then you have to install ebtables manually, to get the required logging 
functionality.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
