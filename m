From: Helge Weissig <helgew@grajagan.org>
Subject: Re: protocol 50 unreachable
Date: Wed, 1 Dec 2004 16:07:02 -0800 (PST)
Message-ID: <Pine.LNX.4.44.0412011600560.18751-100000@gollum.grajagan.net>
References: <1101945591.2032.105.camel@localhost>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1101945591.2032.105.camel@localhost>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Thanks for getting back to me, John. Here are some more details and an 
attempt at clarification:

The client is a laptop running MacOS X and VPN Tracker. It sits on the
private LAN and as I mentioned in the post, I can see outgoing traffic
(e.g. pings of VPN hosts) going *out* through ESP (i.e. all three
interfaces - client, internal and external - report ESP packets going
out). The client s/w log also indicates "ESP tunnel established".  
Regardless though, if I just try to get any ESP traffic *into* the client,
from outside the firewall, it only shows up on the external interface and
triggers the described response.

cheers,
h.

On Wed, 1 Dec 2004 at 18:59 -0500, John A. Sullivan III wrote:

[snip]
JASI> Silly question but, since the problem started after a reboot, are
JASI> you sure that ESP is running on your client? Are you using *swan or
JASI> the native 2.6 IPSec implementation on the client?



