From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: limit speed of file transfer
Date: Sun, 23 Jan 2005 19:05:47 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10501231904190.6831-100000@darkstar.sysinfo.com>
References: <41F5327F.3070803@wildcash.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41F5327F.3070803@wildcash.com>
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
To: Rudi Starcevic <tech@wildcash.com>
Cc: netfilter@lists.netfilter.org

On Mon, 24 Jan 2005, Rudi Starcevic wrote:

> Hi,
> 
> An option may be to use SSH with RSYNC instead of SCP.
> The Rsync command has a bandwidth limit option.
> 
> I use it like this:
> 
> rsync -avz --bwlimit 10 -e ssh remoteuser@remotehost:/remote/dir /this/dir/
> 
> Check the 'man' pages for more info on the 'bwlimit' option.


The main caveat here is that it requires that rsync be installed on both
ends.  Rsync is a great tool under ssh, but, still is not all that common.
Especially with main vendor *nix's

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


