From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: rules for skype
Date: Sun, 01 May 2005 17:00:02 -0500
Message-ID: <42755162.4090509@riverviewtech.net>
References: <90ba0390f499.90f49990ba03@vsnl.net>
	<a0f69e50505010246227a187f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e50505010246227a187f@mail.gmail.com>
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

> iptables -A FORWARD -p tcp --dport SKYPEPORT -j ACCEPT

<devilish @^*% eating grin> He, Skype does not have a port (per say). </devilish @^*% eating grin>

Skype will use just about any port that it can use (all the standards you would think for internet traffic) to connect to any ""super node that it can connect to.  unfortunately what qualifies as a Super Node is any node / computer that is running Skype that is directly connected to the internet with out a firewall that would inhibit other systems from connecting directly to it.  Do a Google for "Skype Protocol" and see what you find.  I have a PDF on it at the office that I'd be happy to send you.  (If you want this PDF I'll find the URL to it and post it to the list or email individually as I don't think the list would like a PDF sent to it.)  The only way that I've heard to even slow down Skype is to force it to pass through a proxy, beyond that nothing, that I have heard of or read about, will stop it.



Grant. . . .

