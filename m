From: "will_u_tellmemore will_u_tellmemore" <will.u.tellmemore@gmail.com>
Subject: HowTo: Intercept every packet sent to TCP layer by IP layer and
	logging them in user space.
Date: Mon, 6 Nov 2006 16:17:34 +0530
Message-ID: <97993dc40611060247n4d099d80j476e97960d0c291e@mail.gmail.com>
References: <97993dc40611060246t57ccbb65w7721d92482d431ba@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <97993dc40611060246t57ccbb65w7721d92482d431ba@mail.gmail.com>
Content-Disposition: inline
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

Hi All,

I read some of the documents about this but could not figure out
exactly how to do this :
   Intercept every packet sent to TCP layer by IP layer and logging
them in user space.
If somebody could answer following question that will be a great help.

1: Does netfilter framework allows to intercept packet at this level directly.??
2: Registering a hook with   NF_IP_LOCAL_IN is what i need to do ??
3: Can logging task be handled by ulogd . My module will sent data to
a user app which will be   developed using ulogd ??

Any help or just a pointer to links where i can find this info would
also be of gr8 help.

Regards,
TellMeMore

