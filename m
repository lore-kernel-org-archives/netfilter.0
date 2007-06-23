From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: filter by application name
Date: Sat, 23 Jun 2007 17:06:38 +0200
Message-ID: <467D36FE.4040606@lopsch.com>
References: <467C452A.1050303@gmail.com> <467C467D.8060002@shorewall.net>
	<Pine.LNX.4.64.0706230215230.10809@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.64.0706230215230.10809@darkstar.sysinfo.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "R. DuFresne" <dufresne@sysinfo.com>
Cc: Deb ian <debian70@gmail.com>, netfilter@lists.netfilter.org, Tom Eastep <teastep@shorewall.net>

R. DuFresne schrieb:

> Interesting.  I get the impression tuxguardian is not quite a deep 
> inspection FW nor an real application proxy, but has hooks to permit and 
> eny on command hashes?  I'd like to see more of their docs, not alot 
> online that I saw.  Might have to go through their code if more info is 
> not available...
> 
> 
> Thanks,
> 
> Ron DuFresne

Hi,

they seem to use the LSM framework (like apparmor). This are the hooks, 
they can use to allow or deny socket opening for example, I guess.

greetings

Daniel


