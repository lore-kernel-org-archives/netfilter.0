From: "Deepak Seshadri" <dseshadri@broadbandmaritime.com>
Subject: RE: How to make the default gateway permanent after restart?
Date: Mon, 20 Sep 2004 11:52:42 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409201548.i8KFmPj2091300@jkcpub.iserver.net>
References: <1095693958.1898.54.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095693958.1898.54.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: 'Jason Opperisano' <opie@817west.com>, netfilter@lists.netfilter.org

Hello Jason,

Thank you very much.

Yes I meant via eth0.

Thank you,

Deepak Seshadri


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Jason Opperisano
Sent: Monday, September 20, 2004 11:26 AM
To: netfilter@lists.netfilter.org
Subject: Re: How to make the default gateway permanent after restart?

On Mon, 2004-09-20 at 11:17, Deepak Seshadri wrote:
> Hello everybody,
> 
>  
> 
> My Linux firewall (Fedora Core 2 & kernel 2.6.8.1) is configured the
> following way:
> 
> Eth0 - WAN
> 
> Eth1 - LAN
> 
> Eth2 - DMZ
> 
>  
> 
> With the above setup my default gateway is Eth0. For some reason, when the
> machine boots up it takes Eth1 for default gateway. This not only messes
up
> the Internet connection but also my firewall rules. I have to then
manually
> delete that entry and add Eth0 as the default gateway. Could someone
please
> let me know how to make Eth0 as the permanent default gateway?
> 
>  
> 
> Thank you,
> 
> Deepak Seshadri
> 
>  

<rant>
there's a list maintained for fedora core questions at:

        http://www.redhat.com/mailman/listinfo/fedora-list

i'm not trying to be a "mean guy" but this list has a tendency towards
being the dumping ground for all network-related linux questions, and
it's not.
</rant>

your default gateway is set by the variable GATEWAY in:

        /etc/sysconfig/network

the GATEWAY variable can also be set in your:

        /etc/sysconfig/network-scripts/ifcfg-eth?
        
files.

if you specify it both places, RH used to have a tendency to add it
twice, i don't know if they've fixed this (by using 'ip route replace'
instead of 'ip route add').

i also hope you mean your default gateway is "via eth0" not "is eth0"
because if it's the latter--you've have bigger problems than just a
variable setting.

-j

-- 
Jason Opperisano <opie@817west.com>




