From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: RTP traffic matching
Date: Thu, 17 Oct 2002 13:20:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210171220.g9HCKaL26475@vulcan.rissington.net>
References: <032f01c275cb$0c7c9fa0$9f24a58b@segi.ulg.ac.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <032f01c275cb$0c7c9fa0$9f24a58b@segi.ulg.ac.be>
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

On Thursday 17 October 2002 11:50 am, Francois Dessart wrote:

> Hello,
>
> Is there an easy way to match RTP/UDP traffic?

If you mean RDP / UDP, then it's easy:

iptables -A FORWARD -p rdp -s a.b.c.d -d w.x.y.z -j ACCEPT
iptables -A FORWARD -p udp -s a.b.c.d -d w.x.y.z -j DROP
etc....

If you didn't mean RDP, can you give us a reference to tell us what RTP is ?

Antony.

-- 

Normal people think "if it ain't broke, don't fix it".
Engineers think "if it ain't broke, it doesn't have enough features yet".

