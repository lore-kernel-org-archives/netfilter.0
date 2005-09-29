From: Aaron Smith <aaron@pandora-net.com>
Subject: Filtering Transport Mode IPSec
Date: Thu, 29 Sep 2005 11:09:18 -0400 (EDT)
Message-ID: <Pine.LNX.4.61.0509291103090.12174@cerberus.private.pandora-net.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have a Windows 2003 server connecting as a client, in Transport 
mode, via IPSec to a RHEL4 server running a 2.6.9 kernel and StrongSwan.
I would like to use netfilter to filter the protocols and ports that the
windows server can access on the RHEL4 server, but from what I've read, 
transport mode IPSec packets are decrypted AFTER they have traversed the 
netfilter chains.  I have a rule in my INPUT chain that says to allow ESP 
(protocol 50) packets and this appears to be enough for the windows client 
to bypass the rest of the rules.  I also have a linux client connecting to 
this same server in Tunnel mode and it's packets appear to be accepted, 
decrypted, an then sent back into the interface to be subjected to 
netfilter so everything works fine there.  Is there anyway to use 
netfilter to filter Transport Mode IPSec?

------
"The pain of war cannot exceed the woe of aftermath
The drums will shake the castle walls, 
the Ringwraiths ride in black..."
 	Led Zeppelin, "The Battle of Evermore"

