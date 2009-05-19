From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: iptables to add same rule
Date: Tue, 19 May 2009 21:12:53 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0905192108340.8786@blackhole.kfki.hu>
References: <de72ca4e0905182329qe701121ud7377177687be7f3@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <de72ca4e0905182329qe701121ud7377177687be7f3@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudarshan Soma <sudarshan12s@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, 19 May 2009, Sudarshan Soma wrote:

> I am trying to present WUI for iptables with simple functionality such
> as add/delete rule. For adding rule, can i avoid adding the same rule
> again.
> Suppose, if the user tries to block ftp from outside. I will add
> iptable rule as below:
> iptables -A INPUT -p tcp --dport 21 -j DROP
> 
> If the user tries to add the same rule again, can i somehow determine
> through iptables , if the rule is already added.

IMHO this is just a wrong approach.

You have to get (list) all the rules from the kernel anyway to present the 
user with the exact ruleset. So why don't you simply generate the new 
tables in iptables-restore format after the user added/deleted whatever 
rules, and push it back to the kernel in one step?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
