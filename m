From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Are established connections interrupted when iptables is
	restarted?
Date: Wed, 22 Dec 2004 21:13:30 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10412222111230.18976-100000@darkstar.sysinfo.com>
References: <200412221506.iBMF6cDX082047@jkcpub.iserver.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200412221506.iBMF6cDX082047@jkcpub.iserver.net>
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
To: Deepak Seshadri <dseshadri@broadbandmaritime.com>
Cc: netfilter@lists.netfilter.org

On Wed, 22 Dec 2004, Deepak Seshadri wrote:

> Hello group,
> 
> I make changes in the /etc/sysconfig/iptables file and then do a "service
> iptables restart". Would this interrupt the established connections through
> the firewall?

It can.  with connection tracking and matching on NEW ! syn, with a -j
DROP it certainly will.

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


