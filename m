From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPSec - IPTables issues
Date: Wed, 5 May 2004 16:22:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405051622.26944.Antony@Soft-Solutions.co.uk>
References: <20040502155538.GD515@schottelius.org> <20040504211557.GA236@schottelius.org> <4098FE7A.8070707@pbl.ca>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4098FE7A.8070707@pbl.ca>
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

On Wednesday 05 May 2004 3:47 pm, Aleksandar Milivojevic wrote:

> Nico Schottelius wrote:
> > I'll compare what freeswan did with what Linux 2.6 does now:
> >
> > Freeswan has virtual devices (ipsec*), through which the unencrypted
> > packets come into the system. So you can add these firewall lines:
> >
> > - allow AH, ESP, UDP/500, deny rest on eth0
> > - allow IPs/networks, etc. on ipsec0
>
> Haven't worked much with IPSec (at least not over firewall).  Are you
> sure that IPSec packets will go through Netfilter twice (once encrypted,
> and than once again unencrypted)?

They do.   This makes it easy to filter the packet types you want to allow 
through the tunnel, rather than having a VPN which passes just everything.

> Anyhow, if I assume that what you wrote is correct (and it is how Linux
> kernel handles packets), I still don't see need for virtual devices.

That's the way FreeS/WAN does it.

Regards,

Antony.

-- 
"There has always been an underlying argument that we should open up our 
source code more broadly. The fact is that we are learning from open source 
and we are opening our code more broadly through Shared Source.

Is there value to providing source code? The answer is unequivocally yes."

 - Jason Matusow, head of Microsoft's Shared Source Program, in response to 
recent leaks of Windows source code on the Internet.

                                                     Please reply to the list;
                                                           please don't CC me.


