From: "Ian Douglas" <ian@icreditvision.com>
Subject: RE: using iptables for poor-man's load balancing?
Date: Wed, 19 Feb 2003 10:47:23 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <HMEBKOCKLOOEJGIOMFAPGEJGFJAA.ian@icreditvision.com>
References: <F47Rr8N0QB2qIuSRhAs0001f1e8@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <F47Rr8N0QB2qIuSRhAs0001f1e8@hotmail.com>
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
To: Andrej Ricnik <lemmetink@hotmail.com>, netfilter@lists.netfilter.org

> >Just curious if the following rules would work to round-robin the
> >connections:
> To my understanding it's not robin-go-round but distributing
> new requests to the currently least used IP (the one with the
> smallest number of active connections), which should pretty
> much do what you want, anyway.

Tink,

That didn't seem to work, all requests kept going to the same machine (first one
listed).

Any other ideas on how I can balance port 80 and port 443 across multiple
machines with iptables?

-id


