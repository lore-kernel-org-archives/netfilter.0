From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: my system is under syn-flood attack
Date: Mon, 23 Sep 2002 11:31:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209231031.g8NAVmv24191@vulcan.rissington.net>
References: <002201c262ae$36db04b0$9801010a@redhat73> <1203.202.64.212.174.1032761028.squirrel@pat.i989.net> <3D8ECEAF.5030202@fugmann.dhs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D8ECEAF.5030202@fugmann.dhs.org>
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

On Monday 23 September 2002 9:19 am, Anders Fugmann wrote:

> Please do not do as the above link [deleted to avoid repeating bad advice]
> suggests.
> The above link suggests putting DoS attack detection in the nat table,
> which IMHO is a very bad idea.

Seconded.   nat tables are *not* for filtering.   Mass confusion and broken 
firewalls result when people start doing that.

> The nat table should be used to changes soruce and destination of
> packets - no more.
>
> The mangle table should be used to change packets only, e.g TOS settings.
>
> The filter tables shoyld be used to accept and drop packets (filter
> packets). This tables is the one must people should use.

This is a good message to be repeated whenever someone suggests misusing the 
tables - there's no good reason for it that I've come across yet, and it does 
cause significant problems.

> As for the flood attack, What do you mean by "it's no use"? (I do
> understand that you think it does not work, but could you elaborate on
> that). Are no packets dropped because of it?

Bear in mind that the original poster had a default ACCEPT policy on his 
INPUT and FORWARD chains.   I don't think that would be helping him...

Antony.

-- 

90% of network problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

