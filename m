From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Checksumming Issues
Date: Fri, 21 Nov 2003 20:27:21 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311212027.hALKRQj29614@agate.rockstone.co.uk>
References: <Pine.SOL.4.20.0311211514050.16319-100000@csa.bu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.SOL.4.20.0311211514050.16319-100000@csa.bu.edu>
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

On Friday 21 November 2003 8:15 pm, Leonid Veytser wrote:

> A general question about checksumming. If I change the destination address
> in the IP header, then of course I need to recalculate the IP header
> checksum.

"You" the user (or system administrator) do not need to recalculate any 
checksums - the SNAT or DNAT code does this for you.

> But do I have to recalculate the checksum of the next protocol
> header (ie TCP, UDP, etc)?

No.   Everything is handled for you in the background.   Anyway, if you only 
change the IP address (source and/or destination), the TCP or UDP checksum 
remains valid.

Antony.

-- 

Feeling bad at breakfast because you don't have a hangover is evidence of a 
complex emotional life it can take many years to perfect.

 - Pete McCarthy, The Road to McCarthy
                                                     Please reply to the list;
                                                           please don't CC me.

