From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPSec - IPTables issues
Date: Wed, 5 May 2004 18:29:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405051829.14783.Antony@Soft-Solutions.co.uk>
References: <20040502155538.GD515@schottelius.org> <200405051622.26944.Antony@Soft-Solutions.co.uk> <40991270.5030803@pbl.ca>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40991270.5030803@pbl.ca>
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

On Wednesday 05 May 2004 5:12 pm, Aleksandar Milivojevic wrote:

> Antony Stone wrote:
> > That's the way FreeS/WAN does it.
>
> Yes, I know that's the way FreeS/WAN implements it.  But it doesn't mean
>  it is the only way it can be implemented.

Well that is certainly true, but if you are using FreeS/WAN then this is the 
system you have to work with.

> Actually, I like better Linux 2.6 implementation that doesn't use virtual
> devices.

Yes, it seems like a better design; now if only we could work out how to 
filter the unencrypted traffic before it all just disappears down the tunnel, 
it might turn out to be a good idea.

Regards,

Antony.

-- 
Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

                                                     Please reply to the list;
                                                           please don't CC me.


