From: Jason Opperisano <opie@817west.com>
Subject: Re: Bizarre rule requirement
Date: Fri, 31 Dec 2004 17:51:38 -0500
Message-ID: <20041231225138.GA8193@bender.817west.com>
References: <41D5A87C.4040508@starnetworks.us>
	<20041231195406.GA7578@bender.817west.com>
	<41D5B11C.9060303@starnetworks.us>
	<20041231204004.GA7810@bender.817west.com>
	<41D5D62D.5060906@starnetworks.us>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <41D5D62D.5060906@starnetworks.us>
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

On Fri, Dec 31, 2004 at 03:43:57PM -0700, Kevin P. Fleming wrote:
> 1) You are forwarding all inbound UDP traffic to a single device. My 
> example was simplified; the final application for this technique could 
> have tens of phones behind the NAT, each needing to work this way. 
> That's why I phrased my original request the way I did; it was 
> predicated on learning the outbound port number and other bits related 
> to a specific "connection" (even though this is UDP) and basing the 
> inbound rules on those details.
> 
> 2) You assume that the port number assigned when the phone sends out its 
> first UDP packet (from port 4000) by the NAT will also be 4000... it 
> very well may not be, if that port is already in use on the public side 
> of the NAT for another user. In that case, the FORWARD rule can't work, 
> because it doesn't know what port number the conntrack code assigned for 
> this specific connection (and it could be different for the next 
> connection).

i didn't assume anything, i proposed a broad-sword-hack-work-around
that met the requirements of the simplified scenario you presented.
say what you mean and mean you say.

now that we know the real situation/requirements--maybe someone else can
be of more use; as i have no experience with netfilter+VoIP--just
commercial firewalls (which magically work as a side-effect of their
hefty price tags).

l8er.

-j

