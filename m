From: Bob Miller <bob@computerisms.ca>
Subject: Re: xtables-addons ACCOUNT
Date: Mon, 18 Oct 2010 09:18:23 -0700
Message-ID: <1287418703.13167.231.camel@laplaplian>
References: <201010181712.03160.maarten@ba.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201010181712.03160.maarten@ba.be>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Maarten Vanraes <maarten@ba.be>
Cc: netfilter@vger.kernel.org

I have this installed on Debian.  I am running squeeze, kernel=2.6.32.
My first time trying the ACCOUNT module was before there was a debian
package, and I remember one of the problems I had then was that the
kernel was too old.  I can't remember what version it was then,  but I
suspect it was around 2.6.25 or so.
Once you have downloaded the packages, this command should get you
started:
$(m-a a-i -t xtables-addons-source)
One thing I had to do this time with the debian package was make a
symlink from /usr/lib/libxt_ACCOUNT_cl.so.0
to /usr/lib/libxt_ACCOUNT_cl.so.0.0.0
in order to get the module to load.  then a $(modprobe xt_ACCOUNT)
should work.  If I recall, I have also had it happen in the past that
all the libxt stuff was in the wrong location, and I had to symlink a
full directory to get it working, but I think that was before it came
out as a .deb. 
If I recall, another road block was that I needed the iptables-dev
package installed.
Once the module was loaded, I created the following rules for my
networks:

gatelian:/usr/lib# iptables-save | grep tname
-A POSTROUTING -j ACCOUNT --addr 0.0.0.0/0 --tname wan
-A POSTROUTING -j ACCOUNT --addr 192.168.25.0/24 --tname computerisms
-A POSTROUTING -j ACCOUNT --addr 192.168.24.0/24 --tname
computerisms-public

I believe the rules for the two non-routable subnets will not count
accurately to the outside, the count these rules give should be higher
than what bandwidth is used to the net at large.

if it loads successfully, then $(iptaccount -a) should show you
something like:

Found table: wan
Found table: computerisms
Found table: computerisms-public

I remember this ACCOUNT thing did not go smoothly for me, the hardest
part has always been in getting the module to load.  But if you post
more specific error messages, I am pretty sure I can help you get it in
there...

On Mon, 2010-10-18 at 17:12 +0200, Maarten Vanraes wrote:
> Hello,
> 
> I can't get it working myself:
>  * kernel: 2.6.26-2-amd64 (debian lenny)
>  * iptables: 1.4.8
>  * xtables-addons: 1.26
> 
> 
> - man pages tell us to use CIDR notation; however syslog shows in the error 
> messages "network/netmask" notation (255.255.255.0)
> - removing the rule with iptables -D removes the rule, but it seems not the 
> account table.
> - iptaccount -h doesn't remove it either
> - modprobe -r xt_ACCOUNT doesn't either
> - i always get 0 rules or something
> - adding the rule after it's been deleted doesn't work, i get error messages 
> about wrong parameters
> - adding a diff addr with same name succeeds, but gives error messages in 
> syslog
> 
> 
> Do i do something wrong; or is there a bug in here?
> 
> Kind Regards,
> 
> Maarten Vanraes
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Bob Miller
334-7117/660-5315
http://computerisms.ca
bob@computerisms.ca
Network, Internet, Server,
and Open Source Solutions

