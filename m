From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: netfilter logiing
Date: Thu, 3 Feb 2005 13:22:09 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10502031318040.24964-100000@darkstar.sysinfo.com>
References: <42023802.5060403@linuon.com>
Mime-Version: 1.0
In-Reply-To: <42023802.5060403@linuon.com>
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
To: Junji Kanemaru <linux@linuon.com>
Cc: netfilter@lists.netfilter.org

On Thu, 3 Feb 2005, Junji Kanemaru wrote:

> Hi,
> 
> I have a quick question regarding netfilter logging. I'm working on
> some unified system logging interface and want to get netfilter
> log when some netfilter policy violation occurred.
> How I can get that kind of logs? Maybe I need to write ULog filter
> for that? I could be showing my ignorance though...

It would be hard for netfilter or any app to self police itself.  This
would be what an IDS would do, sit behind the netfilter firewall and sound
loud alarms and spew e-mails to all staff when somethig got past the
firewall and into terriroy it was not meant to hit.

You could log every rule or all drops and rejects, but, that tends to make
big logs and consume lots of time and be of little use unless you are
tracing a problem.  Most folks should pay more attention to logging what
has been alowed to pass the firewall then what has been blocked by it.
But a well tuned IDS can enhanced ones warm fuuzzies.  A poorly tuned IDS
will spew so many falsies that it will be ignored, so YMMV.

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


