From: Nick Taylor <nickt@lightlink.com>
Subject: Re: Problem with lipq
Date: Fri, 19 Mar 2004 13:45:11 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSU.4.58.0403191341470.28117@adore.lightlink.com>
References: <20040317203816.31110.qmail@web11302.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040317203816.31110.qmail@web11302.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Srinivas <nivas_4u@yahoo.com>
Cc: netfilter@lists.netfilter.org

Sounds like your you're not linking against the library.  Your ld error
is perhaps the most informative.  Once upon a time I also wrote a modules
to use libipq, and on one system I develop on, it was properly installed,
and 'gcc filter.c -o filter -lipq' worked perfectly, but on the other,
libipq was not installed, so I got libipq.c, built it in the project
directory, and did 'gcc filter.c libipq.a -o filter' and that works like a
champ.  Hope this is helpful.

On Wed, 17 Mar 2004, Srinivas wrote:

> Date: Wed, 17 Mar 2004 12:38:16 -0800 (PST)
> From: Srinivas <nivas_4u@yahoo.com>
> To: netfilter@lists.netfilter.org
> Subject: Problem with lipq
>
> Hi,
>
> while browsing for help finall I found your talks
> about libipq. So, I wish you could help me...
> my problem is that....
>
> When I compile my code like
> gcc <filename>
>
> I am getting following error :
>
> /tmp/ccb2U3Gs.o(.text+0x20b): In function
> `strip_packet':
> : undefined reference to `ipq_set_verdict'
> /tmp/ccb2U3Gs.o(.text+0x252): In function
> `strip_packet':
> : undefined reference to `ipq_set_verdict'
> /tmp/ccb2U3Gs.o(.text+0xb9d): In function `run':
> : undefined reference to `ipq_create_handle'
> /tmp/ccb2U3Gs.o(.text+0xbda): In function `run':
> : undefined reference to `ipq_set_mode'
>
> and when I compile with option,
> gcc <filename> -lipq
>
> it says
> /usr/bin/ld : cannot find -lipq
>
> I am using libipq.h library.. Please help me...
>
> Thanks in advance.
>
> Srinivas
>
> __________________________________
> Do you Yahoo!?
> Yahoo! Mail - More reliable, more storage, less spam
> http://mail.yahoo.com
>

