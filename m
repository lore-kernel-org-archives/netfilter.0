From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: tcpdump and iptables ..
Date: Sat, 6 Mar 2004 18:12:31 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403061812.31256.Antony@Soft-Solutions.co.uk>
References: <FD1B6DC5FFF43C4888DCC155FE8C1FFE70CC74@7xch10ka.sevenspace.local> <1078589808.2066.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1078589808.2066.3.camel@localhost>
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

On Saturday 06 March 2004 4:16 pm, John A. Sullivan III wrote:

> On Sat, 2004-03-06 at 10:59, Mussie Gebregziabiher wrote:
> > Dear All,
> >
> > When I run tcpdump I seem to be getting data after it is being processed
> > by iptables.   Can someone tell me where 'tcpdump' resides in the order
> > of priority?  Have the packets I'm seeing been subjected to 'PREROUTING'
> > rules such as 'MANGLE' and 'NAT'?
>
> I'll relate my experiences trying to trace the interchange between
> iptables and openswan but it is only from observation.  If someone who
> knows the code responds, please take their word for it over mine.
>
> I believe you will see the packet on the inbound interface before it
> hits the PREROUTING chain of the mangle table.  You will see it on the
> outbound interface after it has passed through POSTROUTING (I don't
> recall off the top of my head if nat or mangle is last).

I agree with John here (with the same disclaimer - if someone who knows the 
code thinks otherwise - believe them, not me).

If you think about the information you can see with tcpdump (or other packet 
sniffers which work at the same level such as ethereal), there's a lot more 
low-level stuff than netfilter knows about - tcpdump sees ethernet frames, 
IPX and similar traffic which are not even IP based, as well as completely 
different media types such as 802.11b headers.   All this gets stripped off 
before reaching netfilter (with the exception of MAC addresses, but even 
there, netfilter can't tell whether a packet arrived by ethernet or 802.11).

Therefore tcpdump works at a much lower level, before netfilter on the input 
side, and after it on the output side.

Regards,

Antony.

-- 
"Reports that say that something hasn't happened are always interesting to me, 
because as we know, there are known knowns; there are things we know we know. 
We also know there are known unknowns; that is to say we know there are some 
things we do not know. But there are also unknown unknowns - the ones we 
don't know we don't know."

 - Donald Rumsfeld, US Secretary of Defence

                                                     Please reply to the list;
                                                           please don't CC me.


