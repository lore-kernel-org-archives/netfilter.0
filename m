From: Mogens Valentin <monz@danbbs.dk>
Subject: Re: iptables and voip
Date: Fri, 13 May 2005 13:50:45 +0200
Message-ID: <42849495.7010004@danbbs.dk>
References: <D4CFB69C345C394284E4B78B876C1CF108864C98@cceexc23.americas.cpqcorp.net>
Reply-To: monz@danbbs.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D4CFB69C345C394284E4B78B876C1CF108864C98@cceexc23.americas.cpqcorp.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Christ, Bryan wrote:
> I have a NAT firewall and two voip phones located behind the firewall.
> I wanted to know if it was possible to prioritize that traffic with
> iptables so that my phone conversations received enough bandwidth.  I
> apologize if this information is somewhere on the netfilter website.  I
> looked for something related but could only find information on
> prioritizing quake and a few other services.  I also "google" it and
> came up with nothing significant.

Not being able to help at the moment, according to a friend of mine, who 
worked at IP telephone systems, this is be a Quality of Service topic.

Voip/Sip et al will happily consume all bandwidth available - of cause, 
depending upon just _how_ much bandwith you're buing :p
He solved it with the build-in QOS in his router. YMMV...

-- 
Kind regards,
Mogens Valentin


