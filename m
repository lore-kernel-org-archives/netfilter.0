From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IP masquerading and second ISP line questions
Date: Sun, 16 May 2004 10:12:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405161012.07517.Antony@Soft-Solutions.co.uk>
References: <E1BPGOi-0008CF-T2@vishnu.netfilter.org>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E1BPGOi-0008CF-T2@vishnu.netfilter.org>
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

On Sunday 16 May 2004 8:49 am, Ryan Hatch wrote:

> Hello all,
>
> I am running iptables on my fedora box to do ip masquerading for my
> internal network as well as 1 to 1 NAT for two windows terminal servers. 
>
> #1, I am using a Checkpoint SecureClient to log into my VPN at my office
> (not on one of the two terminal servers).  Since I switched to iptables to

Switched from what?   (Just out of interest, I don't think it matters to this 
question.)

> handle my ip masquerading, it has periodically booted me out of my network
> forcing me to re-authenticate.  I had heard that there were more than one
> ways to do IP sharing/masquerading.  Is the -A POSTROUTING -o eth0 -j
> MASQUERADE the preferred method to do this? 

It's generally recommended that if you have a static IP address (which you 
appear to have), then you use SNAT instead of MASQUERADE, however this is 
purely for a (very modest) performance improvement; it doesn't change the 
functionality in any way.

If you actually have a dynamic IP address on your external interface, then you 
have to use MASQUERADE, but this fact would also be the cause of you losing 
authentication on the SecureClient as well, because it would suddenly find 
itself talking to a new address from time to time.

> #2, I hope this is feasible--it is kind of a tricky one.  I have a third
> interface on my iptables box (not indicated on my diagram) that is
> connected to a cable modem (as a backup).  Since it is just sitting there
> all day long not doing anything, I would love to use it from a few of my
> boxes to handle my bittorrent/ftp traffic.  Is it possible to do a similar
> thing to what I am doing with my squid proxy to automatically route
> bittorrent or ftp traffic through eth2 instead of the default eth0?  Could
> somebody shed some light on that one for me?

Yes.   Set up another route using the iproute2 tools available from 
http://lartc.org - for what you want, the best solution is probably to MARK 
the packets you want to go up the cable modem in netfilter, and then route 
the marked packets with the appropriate iproute2 tables.

Regards,

Antony.

-- 
Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

                                                     Please reply to the list;
                                                           please don't CC me.


