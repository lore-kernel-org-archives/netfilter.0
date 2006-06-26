From: tyche <tyche@ica.net>
Subject: Re: repeated failed logons and ignoring them
Date: Mon, 26 Jun 2006 15:44:09 -0400
Message-ID: <200606261544.09465.tyche@ica.net>
References: <200606260702.57739.tyche@ica.net>
	<56122.193.173.147.3.1151323907.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <56122.193.173.147.3.1151323907.squirrel@webmail.sterenborg.info>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Monday 26 June 2006 08:11, Rob Sterenborg wrote:
> On Mon, June 26, 2006 13:02, tyche wrote:
> > over the last few days, my server has been attacked. i
> > would like to limit remote logon attempts by address so
> > that if someone tries to logon from an ip address and
> > fails 3 times, my computer will ignore repeated attempts
> > from that ip address. any idea how to make a rule for
> > this?
>
> What type of logon? SSH, telnet, ...?

sorry, what comes from typing email when your still asleep. 
most seem to be hitting my sshd, tho the username/password 
combo leads me to believe that the person is using a database 
to try to overload the server.

killed some pids that where owned by sshd and they kept 
cropping up faster than i could kill them.

>
> There is a Netfilter authentication project called NuFW.
> You can find it at: http://www.nufw.org/index.php3?lang=en.
> Maybe it can help you accomplish what you need.

thank you will look into that.

tyche


>
>
> Gr,
> Rob

-- 
Win9x

A 32 bit extention
to a 16 bit patch
for a 8 bit operating system
on a 4 bit machine
by a 2 bit company
that cant stand 1 bit of competition
 
-----------------------------------------------------------------------------
    This Email is powered by ICA Canada OnLine
         http://www.icacanadaonline.com


