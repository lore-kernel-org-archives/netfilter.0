From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: NFS/RPC
Date: Sat, 13 Dec 2003 11:16:18 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312131916.hBDJGINC023488@server5.bandwidthco.com>
References: <1071301981.3fdac55d5a562@anchor.net.au>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1071301981.3fdac55d5a562@anchor.net.au>
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
To: 'Michael Hall' <ninti@ninti.com>, netfilter@lists.netfilter.org

RPC services are notoriously difficult to get across a firewall because most
services DO NOT use predictable port numbers - and, consequently, a large
high port range must be opened up.  However, NFS is the RPC exception, in
that it nearly always uses port 2049.  Having said that, opening up your
firewall to NFS is a bad idea.  Now, if you must, in additional to the NFS
port of TCP/UDP 2049, you will need to open the portmapper (port 111
TCP/UDP) and mountd (typically port 635). You will probably also need to
open the RPC managed lockd (typically port 4045) and statd in both
directions.  So, to answer your question, yes it is possible, but you just
ripped your firewall to sheds.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Michael Hall
Sent: Friday, December 12, 2003 11:53 PM
To: netfilter@lists.netfilter.org
Subject: NFS/RPC

Hi All:

Excuse me if this is a well-worn question, but the list archives don't
appear to be searchable (at least I could find a search facility).

I have been using iptables since it came out around 2 years ago, but have
never tried to get NFS through it.

The firewall in question is not net connected, but on an internal LAN
server.
I'm just being paranoid about what goes on inside the network as well.

Anyway, my head hurts and I've decided to ask for help: Is it possible to
get NFS and RPC and whatever else is needed through an iptables firewall? If
so, how?

I read on Google that RPC is what complicates the issue.

TIA

Mick





