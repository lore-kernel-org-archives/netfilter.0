From: Rowan Reid <rreid@studio3arc.com>
Subject: RE: Lan traffic Monitoring tools
Date: Fri, 07 Feb 2003 08:14:16 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000701c2cec3$f6e20f70$6601a8c0@s3ac>
References: <003501c2ceb7$c3713af0$8c01a8c0@sundaram>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <003501c2ceb7$c3713af0$8c01a8c0@sundaram>
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
To: 'Sundaram Ramasamy' <sun@percipia.com>, netfilter@lists.netfilter.org



> 
> I have firewall based on iptables (Redhat 7.3) Custom build 
> kernel. I want to  monitor the my LAN traffic, basically I 
> need a report  PC IP Address : web site it accessing, date and time
> 
> I am not using any proxy in my gateway machine.
> 
>  I checked out ntop, mrtg. I would like to know which is best 
>  tool for this propose.

I use a combo of mrtg (which is excellent) and analog analog  being my
web traffic analyzer. Both are fairly light resource wise and very easy
to set up and monitor. Mrtg can also monitor multiple systems. Systems
being switches, routers, gateway machines all from one station.


