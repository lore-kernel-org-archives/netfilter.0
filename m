From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: snmptraps incomming on udp port 162 REDIRECT to 4162 not working?
Date: Tue, 5 Nov 2002 18:29:16 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211051829.gA5ITOe19773@vulcan.rissington.net>
References: <1036512998.8715.44.camel@ben.mis.tnsi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1036512998.8715.44.camel@ben.mis.tnsi.com>
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

On Tuesday 05 November 2002 4:16 pm, Ben Russo wrote:

> Hi,
>
> I tried the following:
>
> iptables -t nat -p udp -m udp --dport 162 -j REDIRECT --to-ports 4162
>
> Any ideas on how to make this work?

You should have a "-A PREROUTING" in there.   I'm not sure about the "-m udp" 
- I presume this is something to do with loading modules for different 
protocol support ?   (I don't use modules, but I've seen this sort of thing 
in other people's rules before.)

Antony.

-- 

Documentation is like sex:
when it's good, it's very very good;
when it's bad, it's still better than nothing.

