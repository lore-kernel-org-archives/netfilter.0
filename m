From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Redirect to same LAN and preserve source IP
Date: Mon, 12 Jul 2004 16:12:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407121612.27437.gdh@acentral.co.uk>
References: <200407121419.40110.gdh@acentral.co.uk> <200407121438.59254.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407121438.59254.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

On Monday 12 July 2004 14:38, Antony Stone wrote:

> Yes.   Just use DNAT, and make sure the Squid box is not on the same subnet
> as the clients (so that it has to send the replies back through the
> firewall).

Ah OK, I was hoping to avoid that since the machine that runs Squid is also an 
NFS server and various other things... 

Thanks :)

Gavin.

