From: "Andrew E. Mileski" <andrewm@isoar.ca>
Subject: Re: NAT and DNS/NTP servers
Date: Sat, 01 May 2004 13:49:51 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4093E33F.1050906@isoar.ca>
References: <409310DE.2020004@isoar.ca> <200405010819.30079.Antony@Soft-Solutions.co.uk> <4093E190.8020308@isoar.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4093E190.8020308@isoar.ca>
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
To: netfilter@lists.netfilter.org

Andrew E. Mileski wrote:
> I speculate this is because an idle local server without an active
> connection doesn't have an entry in the connection table.  Though
> I've also seen failures with an active local server, but I haven't
> got a good theory on the mechanics behind it yet.

I just realized this theory is bogus too, as it should be easy to
tell there is a listener on the local port.  I assume this is
probably checked.

-- 
Andrew E. Mileski

