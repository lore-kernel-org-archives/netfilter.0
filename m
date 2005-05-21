From: Jason Opperisano <opie@817west.com>
Subject: Re: Load Balancing / Merging speed
Date: Sat, 21 May 2005 19:06:22 -0400
Message-ID: <20050521230622.GA3256@bender.817west.com>
References: <1116658510.2529.130.camel@debianbox>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1116658510.2529.130.camel@debianbox>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sat, May 21, 2005 at 09:55:10AM +0300, Sadus . wrote:
> Hello,
> If i want to search for HOWTOs that can enable me to merge the
> connection speed of multiple providers (inboud/outbound), what should i
> search for?
> 
> what i mean by merging is, lets say my connection is shaped at 100K and
> the other is also shaped at 100K, i want to be able using the 2 ISPs to
> have 200K (in/out),
> 
> Does anyone have a HOWTO or Article about that Matter?

read the help file for the nth patch from PoM.  keep in mind, you can
only do "per-connection" load-balancing if you are doing NAT and/or have
non-provider-independent address space; so any single connection will
only ever get 100K.

-j

--
"Stewie: I'll wait until you're finished. Are you done? Because
 I thought this show was called "Kids Say the Darndest Things," not
 "Old Black Comedians Who Never Shut The Hell Up.""
        --Family Guy

