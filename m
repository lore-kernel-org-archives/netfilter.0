From: Kevin McConnell <kevymac@yahoo.com>
Subject: Re: H.323 Modules and 2.4.20?
Date: Sun, 22 Dec 2002 08:53:44 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021222165344.89571.qmail@web40303.mail.yahoo.com>
References: <3E03D76D.3090805@palaver.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E03D76D.3090805@palaver.net>
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
Content-Transfer-Encoding: 7bit
To: Brian Capouch <brianc@palaver.net>, netfilter@lists.netfilter.org


--- Brian Capouch <brianc@palaver.net> wrote:
> I patch-o-matic'ed the H.323 conntrack and nat
> modules, and load them 
> up, but the result is identical to what I get
> without them: the port 
> 1720 TCP call setup traffic goes just fine, but then
> the resulting RTP 
> stream is one-way only, from the public network in
> to my client.

I know it works with this kernel version...

> 
> I have googled myself silly and find references
> hither and yon to the 
> code being broken, my needing to mark packets to use
> it, to use 
> different modules because of NEWNAT kernel code,
> etc., etc., but so far 
> nothing that looks like it's going to help me.

At least you tried to make the effort. See below

> 
> Is there somewhere I can go find out about all of
> this, definitively?

There was a posting to this list last month IIRC, that
details the procedures to get this working properly.
For the most part, it's probably in the other ports
that you have to allow that you've forgotten to add.

> Thanks in advance.

You're welcome in advance.



=====
Kevin C. McConnell --RHCE-- <Red Hat Certified Engineer>

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com

