From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Iptables problem
Date: Mon, 24 Jun 2002 17:03:08 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206241603.RAA16654@slate.rockstone.co.uk>
References: <CC845BB8BC74D6119934000347DD23E87C0C09@jhbmail.autopage.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <CC845BB8BC74D6119934000347DD23E87C0C09@jhbmail.autopage.co.za>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.samba.org>

On Monday 24 June 2002 3:45 pm, Paulo Andre wrote:

> Will I have to set up iproute2 for that, my gateway uses fw1 as default gw,
> how else would I be able to allow specific ports to use fw2 as gateway to
> world...???

iproute2 might be able to do this for you - I'm not an expert.

Why not just set up the default route on the server to point to the firewall 
whcih has the public address on it ?

Then your requests come in through a firewall, get NATted to the server, the 
server sends the replies back through the same firewall, and the reverse NAT 
gets done.

The fact that you have another firewall on your network, bringing in other 
connections to your LAN (or allowing them out), is neither here nor there.


 

Antony.

