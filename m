From: "lartc@manchotnetworks.net" <lartc@manchotnetworks.net>
Subject: Re: new nat target extension --jump rt_lookup
Date: 27 Jul 2003 21:54:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059335645.1447.6.camel@drs0.manchotnetworks.net>
References: <1059223007.1604.11.camel@drs0.manchotnetworks.net> 
	<20030727004019.GB2152@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030727004019.GB2152@cannon.eng.us.uu.net>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter <netfilter@lists.netfilter.org>

Hi Ramin,

On Sun, 2003-07-27 at 02:40, Ramin Dousti wrote:

> > can anyone comment on potential problems/dangers/issues from such a
> > --jump?
> 
> An infinite loop, maybe? Also, OUTPUT is before routing anyway...
Actually it is not [1], and thusly, the source of many of my problems. I
am very curious though, about your thought of a loop -- could you give a
bit more detail? i *thought* that a lookup would have been independant
from netfilter -- that is -- that the packet would be checked with its
fwmark, src ip, dst, ip, etc, and an interface determined (and perhaps a
new src ip) ...

many thanks for your thoughts

charles

[1] http://www.docum.org/stef.coene/qos/kptd/


