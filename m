From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: RE: open port to specific ip address
Date: 10 Nov 2003 08:08:49 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068469729.1530.15.camel@valhalla>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAHvCSmpkyA0+lP5YKpr7djsKAAAAQAAAAX5TmzymhnkKWYhlmn/VLAwEAAAAA@petzetakis-africa.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAHvCSmpkyA0+lP5YKpr7djsKAAAAQAAAAX5TmzymhnkKWYhlmn/VLAwEAAAAA@petzetakis-africa.co.za>
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
To: Lohan Spies <l.spies@petzetakis.co.za>
Cc: 'Antony Stone' <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

On Mon, 2003-11-10 at 07:01, Lohan Spies wrote:
> Anthony,
> 
> I tried this but it is not working! 

I'm not so sure you can actually get this to work.

> It is TCP
> 
> I want to map (internal) 10.10.10.41 port 15000 to (external)
> 196.2.147.208 port 80.
> And then if anything from ip 196.2.147.208 port 80 comes back it must be
> forwarded to 10.10.10.41 port 15000.

This second half of the equation is the problem. 

The traffic come in from the Internet to your internal IP. You then
rewrite the destination IP to go back to some other host on the
Internet. The host on the Internet then replies with a SYN/ACK to the
source IP address, which is the original host on the Internet. 

Now, unless your internal network lies in the direct path of these two
external system, the SYN/ACK is going to be sent directly to this
original external host. So this host is going to see a SYN/ACK packet
from some host it never sent a SYN packet to. This of course means the
SYN/ACK will be discarded with a RST. 

Would it not be easier to simply change DNS to point to the external
host?

HTH,
C



