From: Frank Gruellich <frank@home.manuelm.org>
Subject: Re: DROP or REJECT
Date: Tue, 11 May 2004 15:52:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040511135219.GD9004@home.manuelm.org>
References: <163801c4375e$49bb6d50$49caa8c0@caris.priv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <163801c4375e$49bb6d50$49caa8c0@caris.priv>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

* Peter Marshall <peter.marshall@caris.com> 11. May 04:
> Which is better (to drop or reject packets)?  I am asking more
> specifically for connections from the internet to my external
> firewall.

REJECT is something more polite and suits to common standards.  However,
if your box is flooded with SYNs and your connection is disturbed you
maybe should start DROPing packets.

> My second question is if I have a DNS in my DMZ (contains only ip's in
> my dmz.  internal boxes use this as their DNS.  This DNS falls back to
> my ISP), do I have to allow both TCP and UDP connections on port 53 ?
> Can I not just have UDP, or does it use both ? 

Both.  HTH,
 regards, Frank.
-- 
Sigmentation fault

