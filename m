From: "Ed Street" <blacknet@simplyaquatics.com>
Subject: RE: Most stable firewall distro
Date: Wed, 3 Jul 2002 21:06:51 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <004d01c222f7$14b57ce0$0a01a8c0@ed>
References: <200FAA488DE0D41194F10010B597610D2BA213@JUPITER>
Reply-To: <blacknet@simplyaquatics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200FAA488DE0D41194F10010B597610D2BA213@JUPITER>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Cc: netfilter@lists.samba.org

Hello,

If your worried about the box getting hacked then use Selinux or
grsecurity.  You can literally give out root access and the user can't
do squat.  You can exploit services and only that service will be
harmed.  A simple reboot or service restart will fix the issue (until it
happens again)

Ed

-----Original Message-----
From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org] On Behalf Of George Vieira
Sent: Wednesday, July 03, 2002 8:59 PM
To: 'leolistas@solucoesip.net'
Cc: netfilter@lists.samba.org
Subject: RE: Most stable firewall distro

There is a good reason they made the floppy distros..

1. If it's hacked for any reason, they can't write to it and if they do
then
a reboot clears it.
2. It's redundant to some extend, move the floppy to a new machine and
turn
it on. Bang, new firewall..
3. There ARE logs, they are in a virtual ram drive..
4. You can load the IDE drivers on boot and store /var and whatever you
like
there.. but this opens up hackable write problem  and only IF it gets
compromised...

So it's not all that bad after all.. I've had 2 crashes in the past on
my
firewalls. One being HDD failure and second was CPU over cook and in
both
cases they stuff my data and needed a new rebuild..

Lesson Learnt: floppy drive setup would've been an easy recovery....

This of course probably won't suit many people but alot easier some
others
for their own solutions...

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: leolistas@solucoesip.net [mailto:leolistas@solucoesip.net]
Sent: Thursday, 04 July 2002 10:56 AM
To: netfilter@lists.samba.org
Subject: RE: Most stable firewall distro




   Altough I know floppy distro works absolutely well, in general i dont

like to use them. As you mentioned, they are 100% limited and nothing
can 
be done, specially if you need disk writings. I just cant imagine a 
firewall with no logging at all !!! Using a squid proxy would save about

15% on your www bandwidth ( depends on each case, but 10-15% is
generally 
ok ).

   And, the most important, IDE disks are as cheap as they are fast
.....

   So, if you need a firewall for your home ( connect 2-3 machines
through 
adsl ), I'd recommend a floppy firewall. For ANY other firewall machine
i 
would strongly recommend a full firewall installation based on the
distro 
you're used to work. I personally would recommend redhat, as I told in 
last message. But if you're used to SuSe, GREAT, use it ! Slack ? Use it
! 
Debian ? Use it ! No matter which distro you'll use if you really know 
what you're doing.

   Sincerily,
   Leonardo Rodrigues


Citando George Vieira <GeorgeV@citadelcomputer.com.au>:

> Works wonders but 1.68MB is very limited especially if you want IPSEC
> then
> it's very hard to get it to fit. I just got 1-3KB left on the floppy
> after
> removing alot of stuff..


