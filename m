From: Rob Carlson <rcarlson@kitchenandassociates.com>
Subject: Re: IPset ports question.
Date: Tue, 19 Jul 2005 15:13:40 -0400
Message-ID: <42DD50E4.9090800@kitchenandassociates.com>
References: <42DBF833.9020505@kitchenandassociates.com>
	<Pine.LNX.4.58.0507191037060.22686@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0507191037060.22686@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Netfilter User Mailing List <netfilter@lists.netfilter.org>


Jozsef,

Somehow I'm still blocking all traffic from the 
iphash entries afrer binding the hash to the port 
(port 80, for instance).  For background purposes, 
this is how I am blocking traffic with the iphash:

iptables -A testset -m set --set testset src -j 
LTREJECT
iptables -I FORWARD 2 -i eth1 -j testset
iptables -I INPUT 2 -i eth1 -j testset

This works fine for blocking all traffic.  However 
since I now want specifically to only drop port 22 
and port 25 entries (that is most of the nuisance 
traffic) and allow port 80 for example,  I did the 
following:

ipset -N ports portmap --from 1 --to 1024
ipset -A ports 22
ipset -A ports 25
ipset -B testset :default: -b ports

Now, if I run "ipset -n -L testset", I get the 
following

Name: testset
Type: iphash
References: 1
Default binding: ports
Header: hashsize: 1024 probes: 8 resize: 50
Members:
<List of Entries>
Bindings:

In order to test what I have, I added to the hash 
an address of an external machine (that I can 
always reach) to see if I could access the web 
page, but _not_ the ssh port.  However, when the 
address is in the hash, _all_ ports still seem to 
be blocked-- i.e. no web access OR ssh.  Removing 
the address from the hash fixes this.

In order to see if something was cached and 
blocking the address I tried removing the iptables 
entry for testset  and re-added it.  The result is 
the same.  Is there something in the order of what 
I am doing that causes the LTREJECT to affect 
traffic to all ports, and not just the ports that 
I bound to the iphash?

Thanks,

Rob

.
Jozsef Kadlecsik wrote:
> Hi Rob,
> 
> On Mon, 18 Jul 2005, Rob Carlson wrote:
> 
> 
>>Is there a way to bind an IPSet hash to a port,
>>and if so, what is the syntax?
> 
> 
> The syntax is the same in all cases:
> 
> ipset -B <setname> <elem> -b <name of set to bind elem from setname>
> 
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary
> 
> 

-- 
Rob Carlson, Systems and Network Administrator
Kitchen & Associates Architectural Services, PA
Architecture - Planning - Interior Design
856.854.1880






