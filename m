From: Ian Batterbee <ian.batterbee@aut.ac.nz>
Subject: Re: Questions re iproute2, netfilter, and locally sourced packets
Date: Mon, 15 May 2006 18:31:12 +1200
Message-ID: <44682030.3010100@aut.ac.nz>
References: <200605150359.k4F3xG1O006127@horuhoru-3.aut.ac.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200605150359.k4F3xG1O006127@horuhoru-3.aut.ac.nz>
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


>The fwmark condition should show. Is the option CONFIG_IP_ROUTE_FWMARK 
>enabled in the kernel ? Or maybe your 'ip' version is too old (or too 
>recent) for your kernel version.
>  
>

Ahhhhhhhhh, thank you.. that was the little piece of information I was 
missing.

<recompiles kernel with CONFIG_IP_ROUTE_FWMARK defined and wonders how 
it got disabled to begin with>


