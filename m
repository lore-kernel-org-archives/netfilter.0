From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Why is networking enabled at kernel level?
Date: Tue, 6 Apr 2004 19:23:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404061923.28101.Antony@Soft-Solutions.co.uk>
References: <1081274356.2983.2.camel@kenneth.intracol.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1081274356.2983.2.camel@kenneth.intracol.net>
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
To: netfilter@lists.netfilter.org

On Tuesday 06 April 2004 6:59 pm, Kenneth Andresen wrote:

> Hello all,
>
> I have been searching for information related with why networking is
> part of the Linux kernel itself, but have found nothing at either
> kernel.org or with any of my Google searches.
>
> I can see multiple pro's and con's but am looking for a more extensive
> discussion about this. Anyone who can provide me with some good links?

I can't think of specific links, but I would respond to this comment with the 
question: "where would you like to see the software which interfaces to your 
networking hardware, and how would you control its actions?"

Linux uses what is often called an Onion Model of security, and device drivers 
are buried in the middle of the kernel, interfacing to the hardware, and user 
applications have to go through all sorts of system calls and protected / 
trusted interfaces in order to send/get data to/from it.

If you bore a hole through the onion and allow just any code to get directly 
at the hardware (NICs, Hard Drives, Memory...) you pretty soon don't have a 
security model.   That's the way M$-DOS worked, and it's one of the reasons 
why Win9x OSes are so bad at security - because they inherited a lot of the 
design problems.   WinNT/2k/XP is based on a different model, and at least 
allows for decent segregation of privileged / unprivileged processes

Regards,

Antony.

-- 
Success is a lousy teacher.  It seduces smart people into thinking they can't 
lose.

 - William H Gates III

                                                     Please reply to the list;
                                                           please don't CC me.


