From: "Ken Kilgore" <kkilgore@wt.net>
Subject: RE: iptables grep problems
Date: Mon, 3 Feb 2003 08:51:42 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GNECIOACDBCPDCMNJLJJEEMHCBAA.kkilgore@wt.net>
References: <1044279746.9027.55.camel@juna.cypherworld.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1044279746.9027.55.camel@juna.cypherworld.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@lists.netfilter.org>

This is what I am doing.  I have dhcp for my external ip address assignment.

EXTIP=`/sbin/ifconfig "$EXTIF" | grep inet | cut -d":" -f 2 | cut -d" " -f
1`
INTIP=`/sbin/ifconfig "$INTIF" | grep inet | cut -d":" -f 2 | cut -d" " -f
1`

Ken Kilgore

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of saint
Sent: Monday, February 03, 2003 7:42 AM
To: Netfilter Mailing List
Subject: RE: iptables grep problems


Hi Khanh,

I already have #!/bin/bash.  My firewall script works. When
I first learnt how to build one everyone was saying use eth0.
But I have now learnt to dynamically configure eth0.
I know how to print out the info from the command line but
when I include the same command in my script all hell breaks lose.
And the { print $2 } bit -> you should see what it does.

Santos

On Tue, 2003-02-04 at 00:34, Khanh Tran wrote:
> Are you trying to assign your external interface's IP to a variable for
> something?  What does $2 look like?  Chances are you are trying to do
> something with $2 as an IP, but really the value is probably set for
> "addr:1.2.3.4".  You may also want to add a #!/bin/bash, or whatever your
> shell is to the top of the script if you are getting the right variable
> assignment.
>
> Khanh Tran
> Network Operations
> Sarah Lawrence College
>
> -----Original Message-----
> From: saint [mailto:nagajuna@optushome.com.au]
> Sent: Monday, February 03, 2003 8:14 AM
> To: Netfilter Mailing List
> Subject: iptables grep problems
>
>
> Hi all,
>
> It seems I'm in a bit of a bother.  Here's my problem:
> I have a semi-permanent IP address provided by my ISP
> and I can't do one of two things:
> 1. use eth0, and
> 2. use a combination of grep, awk, & ifconfig.
>
> Normally, if I issue this from the bash shell:
>
> $ifconfig eth0 | grep 'inet addr' | awk '{print $2}'
>
> I get the intended result i.e the external interface's IP address.
> So why can't I get anything when I put this in the firewall script?
> Actually, I do get something: ERRORS!
>
> If someone would kindly help me with this problem
> and relieve my suffering it'll be very much appreciated.
>
> Thanks.
>
> Santos.
> Still learning.
>
>
>



