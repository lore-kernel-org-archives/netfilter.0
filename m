From: Jason Opperisano <opie@817west.com>
Subject: Re: list user-defined chain names only
Date: Thu, 27 Jan 2005 08:58:49 -0500
Message-ID: <1106834329.5784.1.camel@hubcap.ljm.dom>
References: <20050127105817.3B8546B8@mail.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050127105817.3B8546B8@mail.817west.com>
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

On Thu, 2005-01-27 at 06:04, Filip Moritz wrote:
> Hi there.
> 
> maybe this's stupid question, but anyways:
> Is there any way to list my chain names only, i.e. not the rules defined in
> there?
> 
> g., fil

iptables -nL | grep Chain | grep -v \(policy\  | awk '{print $2}'

-j

--
"Beer. Now there's a temporary solution."
	--The Simpsons


