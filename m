From: Moritz Gartenmeister <moritz@uplink-verein.ch>
Subject: Re: MARK
Date: Wed, 23 Mar 2005 16:19:52 +0100
Message-ID: <42418918.5060204@uplink-verein.ch>
References: <42409559.7080001@uplink-verein.ch>
	<1111586266.4513.19.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1111586266.4513.19.camel@hubcap.ljm.dom>
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

Jason Opperisano wrote:
> my guess would be that if you've been patching and compiling here and
> there, that you may have ended up with and iptables utility that doesn't
> know about the MARK target; i.e., you have no libipt_MARK.so file...on
> my machine here it's in /lib/iptables/...might be diff depending on your
> specific distro.

in fact that was the problem.
i fixed it with recompiling an patching linux 2.6.11.3 and iptables 1.3.1.
anyone got the connlimit patch successfully applied?

am i the only person, who sporadic gets this troubles? or is this just normal?

cheers!
moritz

