From: Rick Kennell <kennell@ecn.purdue.edu>
Subject: Re: port-based filtering of IPsec packets?
Date: 23 Jul 2003 16:23:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1058995435.6068.73.camel@insomnia.ecn.purdue.edu>
References: <1058988918.6068.29.camel@insomnia.ecn.purdue.edu>
	 <20030723204240.GE23652@cannon.eng.us.uu.net>
	 <000e01c3515e$f8320830$05001aac@breton1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000e01c3515e$f8320830$05001aac@breton1>
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
To: Garcia Ruiz <gar_ruiz@teleline.es>
Cc: Ramin Dousti <ramin@cannon.eng.us.uu.net>, netfilter@lists.netfilter.org


On Wed, 2003-07-23 at 16:11, Garcia Ruiz wrote:
> Couldn't be possible to filter taking into account the internal
> interface where it is suppose not to be encrypted?

I should clarify that I'm not using FreeS/WAN so there's no extra
network interface that gives me access to unencrypted packets.

On Wed, 2003-07-23 at 15:42, Ramin Dousti wrote: 
> Once the IPsec traffic has been terminated (decapsulated) you can
> filter it based on the services (tcp or udp ports) prior to that
> you only can filter based on the outer IP header...

OK.  Is there a way to decapsulate an ESP packet in iptables?

-- 
Rick Kennell <kennell@ecn.purdue.edu>
Purdue University Department of Electrical and Computer Engineering


