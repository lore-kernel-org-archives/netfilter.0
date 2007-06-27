From: hdemir@metu.edu.tr
Subject: Re: 'recent' matching when less than hitcount hits
Date: Wed, 27 Jun 2007 12:41:46 +0300
Message-ID: <20070627094145.GB4288764@metu.edu.tr>
References: <20070627090043.GC31525@sliderule.msquared.com.au>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20070627090043.GC31525@sliderule.msquared.com.au>
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
Content-Transfer-Encoding: 7bit
To: Msquared <1.list.netfilter@msquared.id.au>
Cc: netfilter@lists.netfilter.org

On Wed, Jun 27, 2007 at 05:00:43PM +0800, Msquared wrote:
> Hi people!
> 
> I seem to be having a problem where a rule with --hitcount is matching
> when there are fewer hits than is listed in the hitcount parameter.
> 
> I have the following two rules in a chain called service-ssh:
> 
>   -m recent --update --seconds 40 --hitcount 5 --name SSH --rsource -j DROP
>   -m recent --set --name SSH --rsource -j ACCEPT
> 
> The rules are in a chain that is only hit for incoming SSH connections.
> EG: I have this rule in the INPUT chain:
> 
>   -m tcp --dport 22 -j service-ssh
> 
You are sending all the traffic to the port 22. Use -m state --state NEW, so that only new ssh connections can be updated. 


hdemir.



