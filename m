From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: ssh
Date: Mon, 24 Jun 2002 09:56:30 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020624135630.GC26150@cannon.eng.us.uu.net>
References: <200206241331.OAA15709@slate.rockstone.co.uk> <Pine.LNX.4.21.0206241544220.11832-100000@dns.toxicfilms.tv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0206241544220.11832-100000@dns.toxicfilms.tv>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Cc: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

On Mon, Jun 24, 2002 at 03:47:49PM +0200, Maciej Soltysiak wrote:

> > 1. You can't.   Netfilter / IPtables works by port number, not by content, so 
> > you can only filter by port number.
> Hmm, maybe you could...
> Look:
> 1. look for a openingpacket with ssh connection characteristics, say a
>    version string and mark packets, use recent module, put them to a
>    seperate chain. something like that.

Yes. Very expensive though and not full-proof in case of fragments.

Ramin

> 2. filter by port number.
> 
> What do you think?
> 
> Maciej
> 

