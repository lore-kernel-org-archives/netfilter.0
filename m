From: Jason Opperisano <opie@817west.com>
Subject: Re: FTP connection track
Date: Thu, 16 Sep 2004 16:16:36 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095365796.2489.88.camel@wolfpack.ljm.dom>
References: <4149F298.2020202@o2.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4149F298.2020202@o2.pl>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 2004-09-16 at 16:07, Krystian wrote:
> hi
> 
> i have a problem and would like to ask how you would do it.
> i have a linux router box. behind is my computer.
> I would like to track FTP connections so I can priotize them i my QoS.
> what rules should be applied to my box?
> 
> Krystian

  iptables -t mangle -A PREROUTING -m helper --helper ftp \
    -j MARK --set-mark 1

queue based on that mark (or the lack thereof).  setting up queuing is
beyond the scope of this list.  more info at:

        http://lartc.org/howto/index.html

-j

-- 
Jason Opperisano <opie@817west.com>


