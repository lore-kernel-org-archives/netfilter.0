From: "Caracal - G. Hostettler" <100112_2660@bluewin.ch>
Subject: Re: Problem with connection-tracking and FTP
Date: Wed, 21 Jan 2004 15:43:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002001c3e02c$e8458980$017ca8c0@lucens.caracal.ch>
References: <200401210532.i0L5WclB022675@server5.bandwidthco.com> <001801c3e015$d6a86100$0600a8c0@blackbox>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Christian Gmeiner <christian@visual-page.de>
Cc: netfilter list <netfilter@lists.netfilter.org>

> I can connect to the FTP-Server and login... but then wehen the directory
listening should come it hangs. I have no idea, why this is so.
> Should i post the output of 'iptables -L -n -v --line-numbers'?
>
> Thanks, Christian Gmeiner

Mmmmh.

Just to make you feel less alone:
I have a similar problem. What is happening is that the ftp server (in my
case proftpd) denies access as it thinks that the PORT command comes from a
spoofed address.
I have something like this in the log:

Refused PORT xxx,xxx,xxx,xxx,9,115. The first part of IP address is OK. It
is the good originating one, aka the internal leg of the firewall.
But who in the hell adds those two numbers at the end ???

Of course there is a fast and VERY UNSECURE solution: Just add the statement
"AllowForeignAddress on" to your proftpd.conf cfg file, or any similar
statement to your FTP of choice cfg, if possible. Do it just to test if the
PORT command works, then REMOVE IT! Once again, this is a severe security
risk on spoofed ftp control connection IP addresses.

If anybody has a single idea of who/why/what are these two added bytes at
the end of the IP seen by the PORT command, I will be pretty happy to know
and possibly understand ;-)

GH

----- Original Message ----- 
From: Christian Gmeiner
To: markee@bandwidthco.com ; netfilter@lists.netfilter.org
Sent: Wednesday, January 21, 2004 12:58 PM
Subject: Re: Problem with connection-tracking and FTP


Thanks... I have now used your rule set:

    # CONTROL PORT (Active & Passive Mode)
    iptables -A INPUT -i ${EXT_INT} -p tcp --source-port
${UNPRIVPORTS} --destination-port 21 -m state --state NEW -j
LOG --log-prefix "FTP ACCESS -> "
    iptables -A INPUT -i ${EXT_INT} -p tcp --source-port
${UNPRIVPORTS} --destination-port 21 -m state --state NEW -j ACCEPT

    # DATA PORT (Active Mode)
    iptables -A OUTPUT -o ${EXT_INT} -p tcp --source-port
20 --destination-port ${UNPRIVPORTS} -m state --state NEW -j
OG  --log-prefix "FTP A-DATA -> "
    iptables -A OUTPUT -o ${EXT_INT} -p tcp --source-port
20 --destination-port ${UNPRIVPORTS} -m state --state NEW -j ACCEPT

    # DATA PORT (Passive Mode)
    iptables -A INPUT -i ${EXT_INT} -p tcp --source-port
${UNPRIVPORTS} --destination-port ${UNPRIVPORTS} -m state --state NEW -j
LOG --log-prefix "FTP P-DATA -> "
    iptables -A INPUT -i ${EXT_INT} -p tcp --source-port
${UNPRIVPORTS} --destination-port ${UNPRIVPORTS} -m state --state NEW -j
ACCEPT

I can connect to the FTP-Server and login... but then wehen the directory
listening should come it hangs. I have no idea, why this is so.
Should i post the output of 'iptables -L -n -v --line-numbers'?

Thanks, Christian Gmeiner

< snipped history>


