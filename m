From: Oleg Savostyanov <osavostyanov@internetplustravel.ru>
Subject: Fwd: Re[4]: Problem with Port forwarding
Date: Fri, 9 Apr 2004 16:33:59 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1715916171.20040409163359@internetplustravel.ru>
References: <146373237921.20040405211401@internetplustravel.ru>
 <200404051854.13708.Antony@Soft-Solutions.co.uk>
 <1825056156.20040406114126@internetplustravel.ru>
 <200404061344.23168.Antony@Soft-Solutions.co.uk>
 <325389781.20040409162513@internetplustravel.ru>
Reply-To: Oleg Savostyanov <osavostyanov@internetplustravel.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <325389781.20040409162513@internetplustravel.ru>
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

This is a forwarded message
From: Oleg Savostyanov <osavostyanov@internetplustravel.ru>
To: Antony Stone <netfilter@lists.netfilter.org>
Date: Friday, April 9, 2004, 4:25:13 PM
Subject: Problem with Port forwarding

===8<==============Original message text===============
Hello Antony,



Tuesday, April 6, 2004, 4:44:23 PM, you wrote:

AS> On Tuesday 06 April 2004 8:41 am, Oleg Savostyanov wrote:
>> Hello Antony,
>> Thank you for your answer.
>> Now the connection does not logged
>> I can see the thirst packet on mail server,
>> but it is timed out
>>
>> telnet X.X.X.X 25
>> Trying X.X.X.X...
>> telnet: Unable to connect to remote host: Connection timed out
>>
>> This is the log from mail server:
>> Tue 2004-04-06 10:31:42: [804:52:2] Accepting SMTP connection from [Y.Y.Y.Y
>> : 33222]

AS> Well, the fact that you see this in your mail log suggests to me that the TCP
AS> handshake SYN - SYN/ACK - ACK has been completed, and the connection is now
AS> available for data transfer.

>> Tue 2004-04-06 10:31:42: [804:52:2] Socket connection closed by the other
>> side (how rude!)

AS> You're not running TCPwrappers on the mail server or something, are you, and
AS> it needs to get a response from the client before maintaining the connection?
No
>> Tue 2004-04-06 10:31:42: [804:52:2] Winsock Error 10053 Software caused a
>> connection abort.
>> Tue 2004-04-06 10:31:42: [804:52:2] Unexpected socket closure

AS> What do you see in the packet / byte counters from "iptables -L -nvx; iptables
AS> -L -t nat -nvx" when you try to make a connection?   Do you see packets in
AS> the PREROUTING DNAT rule, the FORWARD rule towards the mail server, and the
AS> FORWARD rule for the replies?
iptables -L -nvx
562 27336 ACCEPT tcp--eth0 eth1 0.0.0.0/0 10.10.10.252 tcp dpt:25
566 27576 ACCEPT tcp--eth0 eth1 0.0.0.0/0 10.10.10.252 tcp dpt:25
iptables -L -t nat -nvx

Chain PREROUTING (policy ACCEPT 207941 packets, 25904040 bytes)
pkts      bytes target     prot optin     out     source               destination
185  8964 DNAT tcp--eth0 * 0.0.0.0/0 62.105.158.196 tcp dpt:25 to:10.10.10.252
Chain PREROUTING (policy ACCEPT 207933 packets, 25903472 bytes)
pkts      bytes target     prot optin     out     source               destination
184  8904 DNAT tcp--eth0 * 0.0.0.0/0 62.105.158.196 tcp dpt:25 to:10.10.10.252


AS> Regards,

AS> Antony.



-- 
Best regards,
 Oleg                            mailto:osavostyanov@internetplustravel.ru


