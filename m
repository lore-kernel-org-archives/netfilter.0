From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: traceroute
Date: Wed, 30 Jun 2004 14:29:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406301429.14248.Antony@Soft-Solutions.co.uk>
References: <00df01c45ea2$f5dc1290$49caa8c0@caris.priv>
Reply-To: "netfilter" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00df01c45ea2$f5dc1290$49caa8c0@caris.priv>
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
To: netfilter <netfilter@lists.netfilter.org>

On Wednesday 30 June 2004 2:05 pm, Peter Marshall wrote:

> Hi.  I was wondering what I would need for rules to have traceroute work
> through my firewall.  (I have a box behind the firewall trying to get out
> using traceroute).
>
> I have an allow established connections on my forwared chain, and I am
> allowing anything from the source IP of the box in question to leave ... It
> appears that the problem is on the packets comming back in .. but I am not
> sure what I have to do to fix it ....

Allow RELATED packets as well as ESTABLISHED.

Regards,

Antony.

-- 
"It is easy to be blinded to the essential uselessness of them by the sense of 
achievement you get from getting them to work at all. In other words - and 
this is the rock solid principle on which the whole of the Corporation's 
Galaxy-wide success is founded - their fundamental design flaws are 
completely hidden by their superficial design flaws."

 - Douglas Noel Adams

                                                     Please reply to the list;
                                                           please don't CC me.


