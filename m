From: Samuel Jean <sj-netfilter@cookinglinux.org>
Subject: Re: --dport/--sport clarification
Date: Mon, 31 Jan 2005 17:00:14 -0500
Message-ID: <41FEAA6E.1040202@cookinglinux.org>
References: <Pine.LNX.4.05.10501311643430.18954-100000@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.05.10501311643430.18954-100000@darkstar.sysinfo.com>
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
To: "R. DuFresne" <dufresne@sysinfo.com>
Cc: netfilter@lists.netfilter.org

R. DuFresne wrote:
> ipfwadm and I believe ipchains allowed port ranges, as in 135:139.  Does
> this worj te same with --dport/--sport?  My reading indicates the list or
> 'range' requires that the ports be a comma seperated list, rather then the
> ole 'range' option of old.

No, it still stands in iptables.

--sport 80:5000 is allowed.

However, --sports (which is an option to multiport or mport matches) does take
list of port.

--sports 22,80,25,110,...

> 
> Thanks,
> 
> 
> Ron DuFresne

Did I misunderstand your question ?

Samuel

