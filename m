From: Philip Craig <philipc@snapgear.com>
Subject: Re: connection dropouts
Date: Fri, 27 Feb 2004 17:44:57 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <403EF579.80907@snapgear.com>
References: <E1AwOAt-001GiC-A2@alf1.lmb.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E1AwOAt-001GiC-A2@alf1.lmb.internal>
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
To: "T. Horsnell (tsh)" <tsh@mrc-lmb.cam.ac.uk>
Cc: netfilter@lists.netfilter.org

T. Horsnell (tsh) wrote:
> tcp      6 431253 ESTABLISHED src=10.2.0.4 dst=131.111.85.78 sport=49278 dport=143 [UNREPLIED] src=131.111.85.78 dst=10.2.0.4 sport=143 dport=49278 use=1
> 
> 'ESTABLISHED' 'UNREPLIED' seems an odd combination to me.

This is happening when the firewall only sees packets travelling in
one direction.  That is, 10.2.0.4 uses the firewall as its gateway
to talk to 131.111.85.78, but since 131.11.85.78 knows about the
10.x.x.x network, it replies directly to 10.2.0.4, so the firewall
is missing half of the conversation.  It doesn't look to me like this
particular connection has hanged.

Do you have any DNAT rules on the firewall?  This kind of assymetrical
routing does cause problems with DNAT, since the firewall doesn't get
a chance to reverse the DNAT in the reply packets, and the symptom is
that the connection hangs.

> I dont yet know why traffic between our 10. hosts and our
> 131.111 hosts should generate a conntrack entry at all...

If the packets go via the firewall, then a conntrack entry will
always be created.

-- 
Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com


