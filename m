From: Patrick Leslie Polzer <leslie.polzer@gmx.net>
Subject: Re: Is "no route to host" fake possible?
Date: Fri, 25 Jun 2004 11:24:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040625112408.39783568.leslie.polzer@gmx.net>
References: <20040625085336.GA1094@xy1.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040625085336.GA1094@xy1.org>
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
To: netfilter@lists.netfilter.org

On Fri, 25 Jun 2004 10:53:36 +0200
iptables-ml@xy1.org wrote:

> Hello,
> 
> I know the rules REJECT, DENY or DROP, but is it possible to return to 
> the client the error message "no route to host" ?
> 
> I saw that it's possible to configure this on CISCO routers, and I would 
> like to know it it's possible?
Hmmm, if it's not possible with some patched kernel you can surely either

- write a module doing this (shouldn't be too hard)
- write a userspace daemon accepting those packets and crafting appropriate
response packets

The last one might give a little bit of a speed penalty.

Regards,

Leslie

