From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: Fwd: Re: FreeS/WAN + static NAT + 2 machines
Date: Tue, 24 Sep 2002 22:17:22 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D90C852.9090104@fugmann.dhs.org>
References: <OF97101FEC.E6B99807-ONC1256C3E.005480B2-C1256C3E.0054FC9A@GEHAG-DSK.DE>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Walther@gehag-dsk.de
Cc: netfilter@lists.netfilter.org

Walther@gehag-dsk.de wrote:
> 
> but i cannot mount any Windows or SAMBA share. do you know something about 
> this???
> 
As Anthony pointed out, it proberbly because its using broadcast to 
locate machines, which cannot be routed. You can circumvent this by 
setting up a wins server on the network, and let all windows machines 
use this. A wins server is a kind of name server for the netbios 
protocol. All clients in "hybrid" or "Peer" mode will query this machine 
to get a list of available servers, and fall back on broadcast if the 
machine could not be contacted.

To make windows use a wins server you must of cource set one up. The 
samba server can easily do this. Then make sure that all clients are 
using a wins server (it should be easy to find in the network settings), 
and make sure that they run in the hybrid/H-mode.

If you are using a DHCP server for your windows clients, you can set it 
up to send these parameters automatically to the clients.

I have no experience with other DHCP server than unix dhcp3-server.
The options here are:
	option netbios-name-servers <wins-ip-address>;
	option netbios-node-type 8;

(node type 8 is the hybrid mode)

Thats it.
Anders Fugmann

P.s.
Sorry for getting a bit offtopic, but usually windoes machines are setup 
to broadcast, which is a totally waste of bandwidth and has big flaws. 
This letter may correct some of this.





