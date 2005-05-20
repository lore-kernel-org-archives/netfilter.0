From: Charlie Brady <charlieb-netfilter@budge.apana.org.au>
Subject: Re: Prevent traceroutes
Date: Fri, 20 May 2005 14:44:43 -0400 (EDT)
Message-ID: <Pine.LNX.4.61.0505201443170.8116@e-smith.charlieb.ott.istop.com>
References: <fad9d484050519150730dbc53d@mail.gmail.com>
	<20050519232314.GA9369@bender.817west.com>
	<20050519233347.GA9462@bender.817west.com>
	<428D8638.4040301@riverviewtech.net>
	<428D954E.1010105@riverviewtech.net>
	<20050520152021.GA11737@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050520152021.GA11737@bender.817west.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


On Fri, 20 May 2005, Jason Opperisano wrote:

> please do this in -t mangle PREROUTING and not -t nat.  filtering in
> -t nat is poor form ...

Why is filtering in -t mangle not also poor form?

---
Charlie

