From: <electrode@drbroyles.com>
Subject: Re: Is there something wrong with patch-o-matic?
Date: Sun, 24 Nov 2002 13:10:12 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <04e701c293e4$bc2bd150$4545450a@drbroyles.com>
References: <031e01c2930e$41097800$4545450a@drbroyles.com> <038e01c2937d$cece8030$4545450a@drbroyles.com> <04bb01c293df$79be2610$4545450a@drbroyles.com> <200211241245.24291.apapadop@cmu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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


----- Original Message -----
From: "Alexandros Papadopoulos" <apapadop@cmu.edu>
To: "Brandon Broyles" <netfilter@drbroyles.com>
Cc: <netfilter@lists.netfilter.org>
Sent: Sunday, November 24, 2002 12:45 PM
Subject: Re: Is there something wrong with patch-o-matic?


Hash: SHA1

On Sunday 24 November 2002 12:32, Brandon Broyles wrote:
<snip>
>> I think I may have a clue on where to start.  I was looking at the
>> 'isapplied' script that came with patch-o-matic.  In line 32 it
>> references a command that doesn't exist for me.  It reads as such...
>>
>> MISSING_FILES=`patch -R -s -f -p1 < $PATCH | grep "No file to patch"
>> | wc -l`
>>
>>
>> I have no 'patch' command and there isn't one anywhere under my
>> netfilter directory I got from CVS.  I'm not too keen with shell
>> scripting, so I'm not sure how the absence of a patch command will
>> effect the overall workings of the 'runme' script.
>
>No "patch" command on a linux system? It *should* be there, and it
>*should* be in your path.
>
>If the "which patch" command returns nothing, then this is the problem.
>Get and install "patch" somewhere in your path (/usr/bin on my system)
>and you should be set.

Thank you.  That was the missing piece of the problem.  I didn't have the patch
program on my system.  I guess that it isn't automatically come with the
installation that I choose and I haven't ever needed it yet.  I installed the
RPM for it and the (runme) script ran the way I would expect.

Thank you,
Brandon Broyles



