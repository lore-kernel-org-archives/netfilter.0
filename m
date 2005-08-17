From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: netfilter log target kills the computer
Date: Wed, 17 Aug 2005 00:16:04 -0500
Message-ID: <4302C814.3080307@riverviewtech.net>
References: <013101c5a2d5$b5f233d0$0100a8c0@newlife>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <013101c5a2d5$b5f233d0$0100a8c0@newlife>
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

Switch to ULOG instead of LOG as LOG relies on Syslog which was *NOT* meant for high volume traffic.  The other solution that I have proposed in the past is to set up TCPDump or Snort and have it sniff the headers out of packets and dump them to a log file and then post process said log file to extract what you are wanting and store it accordingly.



Grant. . . .

Ming-Ching Tiew wrote:
> Anyone notice that the log target is really too heavy ? 
> 
> I have seen various mishaviour to my Celeron 2.4 GHz
> machine ( fully dedicated as a firewall machine ) if I turn
> on logging. I am not sure if it is due to netfilter logging per se
> or due to me running syslogd to remote the log messages over 
> the network. But in any case, once there is heavy iptabbles logging
> activities, the machine totally misbehaves. 
> 
> Besides the most obvious solutions ( ie to turn it off or get a faster 
> computer ), any words of advise or recommendation ?
> 
> Cheers.


