From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: help on load balancing
Date: Thu, 15 Dec 2005 13:52:20 +0100 (CET)
Message-ID: <62629.193.173.147.3.1134651140.squirrel@webmail.sterenborg.info>
References: <1134646377.43a15469eb4ef@webmail.yanbulink.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1134646377.43a15469eb4ef@webmail.yanbulink.net>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, December 15, 2005 12:32, wlagmay@yanbulink.net wrote:
...
> Squid proxy, Im monitoring the 4 ports via MRTG and I noticed that
> before It goes to link 2, link 1 must be saturated first or link1
> will stop and the request is only transfered to link 2. So it seems
> that it is not doing a load balance, my idea of load balance is
> utilizing the 3 lines simultaneously.
...

Perhaps you can use the nth patch.
http://www.netfilter.org/projects/patch-o-matic/pom-base.html#pom-base-nt=
h


Gr,
Rob



