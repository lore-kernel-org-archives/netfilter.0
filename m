From: Jun Sun <jsun@junsun.net>
Subject: Re: Any holes in this firewall script?
Date: Tue, 3 Jun 2003 22:05:51 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030603220551.A2672@gateway.junsun.net>
References: <20030603180849.B2402@gateway.junsun.net> <1054702862.2273.6.camel@india>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1054702862.2273.6.camel@india>; from dharmu@nsecure.net on Wed, Jun 04, 2003 at 10:30:31AM +0530
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
Content-Transfer-Encoding: 7bit
To: "Dharmendra.T" <dharmu@nsecure.net>
Cc: netfilter@lists.netfilter.org

On Wed, Jun 04, 2003 at 10:30:31AM +0530, Dharmendra.T wrote:
> hi,
> 
>  I just don't see any firewalling (blocking) in the script. You are
> simply allowing everything. Define clear rule like block all and allow
> only wanted ports.
>

The default policy is set to "DROP" for the filter table.

Jun

