From: Willi Mann <newsletters@wm1.at>
Subject: Re: De-SNAT-ing and DNAT
Date: Tue, 25 Feb 2003 20:23:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E5BC2A2.50903@wm1.at>
References: <20030225180802.26030.80793.Mailman@kashyyyk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030225180802.26030.80793.Mailman@kashyyyk>
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
To: netfilter@lists.netfilter.org, jal@mcs.le.ac.uk

I'm sure, but I would say based on my experience, that you will not see 
the packets that go into the other direction.
I haven't tried but maybe you can use the LOG-target in PRE/POSTROUTING. 
You will see which source and destination the packets have.


Willi

>--__--__--
>
>Message: 5
>Date: Tue, 25 Feb 2003 16:59:57 +0000 (GMT)
>From: "J. A. Landamore" <jal@mcs.le.ac.uk>
>Reply-To: "J. A. Landamore" <jal@mcs.le.ac.uk>
>Subject: De-SNAT-ing and DNAT
>To: netfilter@lists.netfilter.org
>
>Please excuse my ignorance with this, but I'm trying to pick the bones out of an 
>iptables configuration that has been dropped in my lap.
>
>I have a lan of machines on a 192.168. network with an iptables box to the real 
>world.  If I apply SNAT I can map all the internal addresses to the one real 
>world facing assigned address.  I assume that when packets come back they are 
>"de-SNAT"ed before passing back onto the private lan, and that this happens in 
>the "PREROUTING" path.  My question is, does the "de-SNAT" happen before or 
>after the "PREROUTING" DNAT?
>
>Why, because I need to make a DNAT decision based on the original _source_ 
>address, i.e. which machine originally sourced the packet.
>
>Thanks for your help
>
>John Landamore
>
>
>  
>


