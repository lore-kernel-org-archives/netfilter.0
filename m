From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: limit speed of file transfer
Date: Sat, 22 Jan 2005 02:28:52 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10501220221210.6831-100000@darkstar.sysinfo.com>
References: <001001c5001e$d80df760$0201a8c0@micah>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001001c5001e$d80df760$0201a8c0@micah>
ReSent-To: netfilter@lists.netfilter.org
ReSent-Message-ID: <Pine.LNX.4.05.10501220229280.6831@darkstar.sysinfo.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Micah Wedemeyer <fanmail@micah-wedemeyer.net>

On Fri, 21 Jan 2005, Micah Wedemeyer wrote:

> Hi,
> 
> My system consistently locks up on file transfers across the LAN.  When
> transferring a file to it using scp, it dies after less than 5 seconds.
> However, if I use it to download a file from the Internet (using wget),
> it does just fine.


Are you saying that only scp/ftp transfers on the local net are hanging?
they work fine across your 'internet' nic?

> 
> I have heard that my motherboard (a Via Epia MII) has DMA problems and
> that high Ethernet traffic is known to lock them up.  My theory is that
> the Internet connection is slow enough to not hit whatever magic
> threshold causes the crash.  So, I was hoping to find a way to limit the
> speed of transfers with scp and ftp so that they also don't lock up the
> machine.
> 
> I asked on a few message boards, and they all mentioned iptables.  I've
> never used it before, and am a total noob when it comes to networking
> stuff.  So, I was hoping that the people on this list could point me in
> the right direction of where to start.
> 
> To sum up:  I need a way to limit the speed of incoming file transfers
> using ftp or scp.
> 

Perhaps you do, perhaps you do not.  I've seen issues with file transfers
due to a number of reasons, tcp-keepalives was not set properly for the
timeouts on firewalls that limit inactivity <yes these firewalls, most
often pixen, do not know that a ftp or scp is active>, ssh2/scp2 being
used inconjucntion with an older ssh1/ssh2/scp1/scp2 deamon/code <dropping
to ssh1/scp1 with really old deamon/code seems to fix the probs, a 10/100
nic is not auto-negociating it's connection speed properly, and this can
often be due to a router in the connection stream being set half/full
opposed to the nic's setting on this <hard coding the duplex and spped of
the connection stream in the nic and/or the router so they match resolves
this issue.



Thanks,

Ron DuFresne
-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        admin & senior security consultant:  sysinfo.com
                        http://sysinfo.com

...Love is the ultimate outlaw.  It just won't adhere to rules.
The most any of us can do is sign on as it's accomplice.  Instead
of vowing to honor and obey, maybe we should swear to aid and abet.
That would mean that security is out of the question.  The words
"make" and "stay" become inappropriate.  My love for you has no
strings attached.  I love you for free...
                        -Tom Robins <Still Life With Woodpecker>



