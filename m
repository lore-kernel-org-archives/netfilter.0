From: Vincent Lim <vincent.lim@nestac.com>
Subject: Re: Source
Date: 11 Apr 2003 18:22:16 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050056536.8048.1433.camel@vincentlim>
References: <00a601c2fd27$93b26890$4001010a@dtrsoftware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00a601c2fd27$93b26890$4001010a@dtrsoftware.com>
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
To: bguerra@dtr-software.com
Cc: netfilter@lists.netfilter.org

On Tue, 2003-04-08 at 01:03, Bobby Guerra wrote:
> I am trying to setup some rules that apply to a range of source ip address
> in a subnet.  Example 10.1.1.60-65  I know that you can specify individual
> ip adress with -s but this would make me do allot of repeating because I
> will have to apply the same rules to each ip address. Any help would be
> appreciated.  Thanks

I don't know if using netmasks would help?

-- 
Vincent Lim <vincent.lim@nestac.com>
NESTAC Solution Sdn Bhd


