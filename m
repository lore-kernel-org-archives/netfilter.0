From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: RE: diffrence between reject & drop ?
Date: Tue, 1 Feb 2005 12:37:04 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10502011231150.11068-100000@darkstar.sysinfo.com>
References: <20050201084800.4D4CE8EDCEB@smtp.sterenborg.info>
Mime-Version: 1.0
In-Reply-To: <20050201084800.4D4CE8EDCEB@smtp.sterenborg.info>
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: 'netfilter' <netfilter@lists.netfilter.org>

On Tue, 1 Feb 2005, Rob Sterenborg wrote:

> netfilter-bounces@lists.netfilter.org wrote:
> > What is the basic diffrence between rejecting a packet & droping a
> > packet ? 
> > 
> > both denies the packet right ?
> 
> Yes, but REJECT notifies the sender that the packet was not accepted,
> DROP silently discards the packet.
> 

To add a tad bit of clarity to a clear explination;

telnet to a system with a firewall that rejects telnets and the connection
gets dropped right away with a message in the window something like
prohibited connection or remote host closed connection

telnet to a host that has a firewal that drops packets and the telnet
session hangs the terminal window until the telnet attempt itself times
out and drops to the command prompt again.

Sometimes it pays to be nice, like when blocking 113 ident ports and
placing a reject rather then a drop so sendmails will not hang endlessly
waiting for the ident reply or the session timeout prior t attempting to
send the e-mail.

Sometimes ya want the bonehead to hang as long as they are willing to hang
the terminal, like wiith telnets not allowed or ftp not allowed as ssh/scp
are just plain nicer protocols to use, and that fewl on the other end has
been banging the ports endlessly trying to bruteforce yer
userbase/passwd's...

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


