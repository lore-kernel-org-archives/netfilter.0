From: Tom Eastep <teastep@shorewall.net>
Subject: Re: PC Anywhere through firewall
Date: Thu, 12 Feb 2004 12:56:16 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402121256.16324.teastep@shorewall.net>
References: <OFD362AE1B.2551EEFC-ON85256E38.006CA759-85256E38.006CE218@mcleodhealth.org> <01ed01c3f1a9$6facf9c0$7c0b070a@FTLLDIMITRIM01>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <01ed01c3f1a9$6facf9c0$7c0b070a@FTLLDIMITRIM01>
Content-Disposition: inline
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
To: Moti Levy <moti@flncs.com>, Chris Baker <cbaker@bbbscentralohio.org>
Cc: netfilter@lists.netfilter.org

On Thursday 12 February 2004 12:47 pm, Moti Levy wrote:
>    iptables -t nat -A PREROUTING -p tcp -d $IP  \
>                --destination-port  5631 -j  DNAT --to $IP_INTERNAL
>    iptables -t nat -A PREROUTING -p udp  -d $IP  \
>                --destination-port  5632 -j  DNAT --to $IP_INTERNAL
>

Or, translated to Mandrake's dialect of Shorewall rules:

DNAT	net	masq:$IP_INTERNAL	tcp	5631
DNAT	net	masq:$IP_INTERNAL	udp	5632

-Tom
-- 
Tom Eastep    \ Nothing is foolproof to a sufficiently talented fool
Shoreline,     \ http://shorewall.net
Washington USA  \ teastep@shorewall.net



