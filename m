From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Log files for iptables
Date: Thu, 13 May 2004 10:45:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405131045.26096.Antony@Soft-Solutions.co.uk>
References: <20040513092802.71510.qmail@web8302.mail.in.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040513092802.71510.qmail@web8302.mail.in.yahoo.com>
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

On Thursday 13 May 2004 10:28 am, Sameer Gurung wrote:

> Hi,
>   Can anybody tell me where are the log files for
> iptables ....cant seem to find them on /var/log. Do I
> have to configure / change /tweak somthing to enable
> loging???

The output of any rules specifying the LOG target is handled by your syslog 
daemon (for which the config file is probably /etc/syslog.conf).

You can specify the logging level in the netfilter rule (with the --log-level 
option to the LOG target) but you cannot change the facility number without 
fiddling around with the source code.

If you don't specify anything particular in your LOG rules, you will probably 
end up with log output sent to the console.

Regards,

Antony.

-- 
The truth is rarely pure, and never simple.

 - Oscar Wilde

                                                     Please reply to the list;
                                                           please don't CC me.


