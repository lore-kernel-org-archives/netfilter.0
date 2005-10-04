From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Filtering Transport Mode IPSec
Date: Mon, 03 Oct 2005 20:29:11 -0500
Message-ID: <4341DAE7.9000208@riverviewtech.net>
References: <Pine.LNX.4.61.0509291103090.12174@cerberus.private.pandora-net.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0509291103090.12174@cerberus.private.pandora-net.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Aaron Smith <aaron@pandora-net.com>
Cc: netfilter@lists.netfilter.org

Take a look at the NetFilter IPSec patches (4 of them I think).  These patches are designed to have the traffic that is passing through the IPSec VPN pass through the NetFilter table twice, once encrypted and once decrypted.  This will allow you to filter the traffic on the 2nd (decrypted) pass the way that you are wanting to do.



Grant. . . .

Aaron Smith wrote:
> I have a Windows 2003 server connecting as a client, in Transport mode, 
> via IPSec to a RHEL4 server running a 2.6.9 kernel and StrongSwan.
> I would like to use netfilter to filter the protocols and ports that the
> windows server can access on the RHEL4 server, but from what I've read, 
> transport mode IPSec packets are decrypted AFTER they have traversed the 
> netfilter chains.  I have a rule in my INPUT chain that says to allow 
> ESP (protocol 50) packets and this appears to be enough for the windows 
> client to bypass the rest of the rules.  I also have a linux client 
> connecting to this same server in Tunnel mode and it's packets appear to 
> be accepted, decrypted, an then sent back into the interface to be 
> subjected to netfilter so everything works fine there.  Is there anyway 
> to use netfilter to filter Transport Mode IPSec?
> 
> ------
> "The pain of war cannot exceed the woe of aftermath
> The drums will shake the castle walls, the Ringwraiths ride in black..."
>     Led Zeppelin, "The Battle of Evermore"
> 


