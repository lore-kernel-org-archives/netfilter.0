From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: RE: forwarding
Date: Tue, 18 May 2004 17:15:23 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084914922.9624.1.camel@localhost>
References: <7C9884991ADAE0479C14F10C858BCDF5122F54@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122F54@alderaan.smgtec.com>
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
To: Daniel Chemko <dchemko@smgtec.com>
Cc: alucard@kanux.com, netfilter@lists.netfilter.org

On Tue, 2004-05-18 at 16:48, Daniel Chemko wrote:
> Ok, one more thing:
> 
> Is the address 10.73.219.156 the only IP address on the external
> interface of the server1?
> 
> If you don't bind the 10.73.219.156 IP address to the ethernet interface
> on server1, then hosts on that network won't be able to find the server
> even with the prerouting rule. You could solve this by Proxy-arp or just
> simply adding another IP address to the outside interface.
> 
> This may be redundant, but I don't believe the external interface's been
> discussed at all as a possible issue.
I believe that is the only address bound to the external interface.  The
entire unusual premise is that is the only address available.  There is
already a web server at that address listening on port 80 and the user
wants to give users access to a different web server.  Since he only has
the one IP address, he is sending traffic for the second web server to
port 8080 and then DNATting that traffic to the other web server on port
80.
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


