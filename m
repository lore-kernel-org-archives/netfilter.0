From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Check whether an IPSET already exists?
Date: Wed, 19 Nov 2008 09:40:08 +0100 (CET)
Message-ID: <alpine.DEB.2.00.0811190909010.22082@blackhole.kfki.hu>
References: <7259d7020811182012u544a1c53w719736aa74bdbc28@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7259d7020811182012u544a1c53w719736aa74bdbc28@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: JC Janos <jcjanos245@gmail.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Tue, 18 Nov 2008, JC Janos wrote:

> I'm writing a script to manage a number of ipsets.
> 
> How can I script (bash/perl) a check to see if:
> 
>   an IPSET exists
>   an existing IPSET is EMPTY or not

There are multiple ways to do it, even in bash ;-)

# Check that a set exists in bash:
ipset -L foo >/dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "Set foo does not exist."
fi

# Check that an existing set is empty:
if [ -z "`ipset -L foo 2>/dev/null | \
	  awk '{ if (FNR == 7) print $0 }'| \
	  grep Bindings:`" ]; then
	echo "Set foo is empty."
fi

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
