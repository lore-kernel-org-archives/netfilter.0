From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Hummingbird eXceed and SNAT
Date: Fri, 28 Feb 2003 15:44:11 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302281544.11398.Alistair@nerdnet.ca>
References: <200302281638.h1SGcG029063@ithaca.mcs.le.ac.uk>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200302281638.h1SGcG029063@ithaca.mcs.le.ac.uk>
Content-Disposition: inline
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
To: "J. A. Landamore" <jal@mcs.le.ac.uk>, netfilter@lists.netfilter.org


	Greetings:
 
	I take it that you're trying to connect direct from windows system to unix 
system through a firewall with exceed??

	Personally What I've always done is to use SSH's X forwarding capacity and 
running exceed in local mode -- or sometimes running the WM and Desktop off a 
local X box.  This works transparently so long as ssh is running.  I use 
Simon Tatham's excellent windows putty client for SSH on windows.

	But you would have to open ports 6000-6010 for TCP ... to start, and manage 
that set of connections, as to source and destination.

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

On February 28, 2003 11:38 am, J. A. Landamore wrote:
> Has anyone succeeded in getting an eXceed session through iptables running
> SNAT? If so guidance on how you did it would be much appreciated.
>
> TIA
>
> John Landamore

-- 

