From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: logs
Date: Fri, 9 Apr 2004 23:24:21 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404092324.21455.Antony@Soft-Solutions.co.uk>
References: <BAY15-F33bYKb2X5YqE00065cb9@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F33bYKb2X5YqE00065cb9@hotmail.com>
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

On Friday 09 April 2004 11:07 pm, azeem ahmad wrote:

> hi alll
> i want to check the logs of iptables to check who is passing throught my
> machine. so plz tell me where r its logs and how can i check them

The LOG target takes an argument --log-level which is what determines how the 
log entries are handled by your syslog daemon, according to /etc/syslog.conf

The most likely places for you to find your log entries are:
1. On the console (if you didn't specify --log-level)
2. In /var/log/messages
3. In /var/log/syslog

As for checking the logs to see "who" is passing through your machine.... good 
luck :)

Regards,

Antony.

-- 
These clients are often infected by viruses or other malware and need to be 
fixed.  If not, the user at that client needs to be fixed...

 - Henrik Nordstrom, on Squid users' mailing list

                                                     Please reply to the list;
                                                           please don't CC me.


