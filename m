From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Re[2]: Problem with Port forwarding
Date: Tue, 6 Apr 2004 13:44:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404061344.23168.Antony@Soft-Solutions.co.uk>
References: <146373237921.20040405211401@internetplustravel.ru> <200404051854.13708.Antony@Soft-Solutions.co.uk> <1825056156.20040406114126@internetplustravel.ru>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1825056156.20040406114126@internetplustravel.ru>
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

On Tuesday 06 April 2004 8:41 am, Oleg Savostyanov wrote:

> Hello Antony,
>
> Thank you for your answer.
>
> Now the connection does not logged
> I can see the thirst packet on mail server,
> but it is timed out
>
> telnet X.X.X.X 25
> Trying X.X.X.X...
> telnet: Unable to connect to remote host: Connection timed out
>
> This is the log from mail server:
> Tue 2004-04-06 10:31:42: [804:52:2] Accepting SMTP connection from [Y.Y.Y.Y
> : 33222]

Well, the fact that you see this in your mail log suggests to me that the TCP 
handshake SYN - SYN/ACK - ACK has been completed, and the connection is now 
available for data transfer.

> Tue 2004-04-06 10:31:42: [804:52:2] Socket connection closed by the other
> side (how rude!)

You're not running TCPwrappers on the mail server or something, are you, and 
it needs to get a response from the client before maintaining the connection?

> Tue 2004-04-06 10:31:42: [804:52:2] Winsock Error 10053 Software caused a
> connection abort.
> Tue 2004-04-06 10:31:42: [804:52:2] Unexpected socket closure

What do you see in the packet / byte counters from "iptables -L -nvx; iptables 
-L -t nat -nvx" when you try to make a connection?   Do you see packets in 
the PREROUTING DNAT rule, the FORWARD rule towards the mail server, and the 
FORWARD rule for the replies?

Regards,

Antony.

-- 
Ramdisk is not an installation procedure.

                                                     Please reply to the list;
                                                           please don't CC me.


