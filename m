From: Jason Opperisano <opie@817west.com>
Subject: Re: --dport/--sport clarification
Date: Mon, 31 Jan 2005 16:53:42 -0500
Message-ID: <20050131215342.GA26235@bender.817west.com>
References: <Pine.LNX.4.05.10501311643430.18954-100000@darkstar.sysinfo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, Jan 31, 2005 at 04:45:52PM -0500, R. DuFresne wrote:
> ipfwadm and I believe ipchains allowed port ranges, as in 135:139.  Does
> this worj te same with --dport/--sport?  My reading indicates the list or
> 'range' requires that the ports be a comma seperated list, rather then the
> ole 'range' option of old.

both --sport and --dport support the port[:port] syntax (this is in the
man page of iptables).  the comma-separated list syntax is a feature of
the multiport/mport matches.  multiport only supports a comma-separated
list of single ports, while mport supports a comma separated list of
single ports or ranges (where ranges eat up two values).  both multiport
and mport have a element max of 15.

i.e., all of the following are valid:

  Syntax				Ports
  ---------------------------------------------------------------------
  --dport 137:139			137 - 139
  --sport 1:1023			1 - 1024
  --sport 1024:				1024 - 65535

  -m multiport --dports 80,443		80 and 443
  -m mport --dports 21:23,80,443	21, 22, 23, 80 and 443

HTH...

-j

--
"Me lose brain? Uh, oh! Ha ha ha! Why I laugh?"
        --The Simpsons

