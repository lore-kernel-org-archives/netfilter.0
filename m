From: Oleg Savostyanov <osavostyanov@internetplustravel.ru>
Subject: Re[2]: Problem with Port forwarding
Date: Tue, 6 Apr 2004 11:31:27 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <374457109.20040406113127@internetplustravel.ru>
References: <146373237921.20040405211401@internetplustravel.ru>
 <200404051854.13708.Antony@Soft-Solutions.co.uk>
Reply-To: Oleg Savostyanov <osavostyanov@internetplustravel.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404051854.13708.Antony@Soft-Solutions.co.uk>
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
To: Antony Stone <netfilter@lists.netfilter.org>

Hello Antony,
Thank you for your answer.

Now the connection does not logged
I can see the thirst packet on mail server,
but it is timed out

telnet X.X.X.X 25
Trying X.X.X.X...
telnet: Unable to connect to remote host: Connection timed out

This is the log from mail server:
Tue 2004-04-06 10:31:42: [804:52:2] Accepting SMTP connection from[Y.Y.Y.Y : 33222]
Tue 2004-04-06 10:31:42: [804:52:2] Socket connection closed by the other side (how rude!)
Tue 2004-04-06 10:31:42: [804:52:2] Winsock Error 10053 Software caused a connection abort.
Tue 2004-04-06 10:31:42: [804:52:2] Unexpected socket closure


Monday, April 5, 2004, 9:54:13 PM, you wrote:

AS> On Monday 05 April 2004 6:14 pm, Oleg Savostyanov wrote:

>> I get lost, trying to do a very simple thing...
>> My mail server is inside my lan with IP 10.10.10.252
>> I need to open port 25 of my mailserver  to the universe
>> I made following
>> 1)I permit in forward chain packets with dest. port 25
>> and
>> 2)do DNAT in PREROUTING chain
>>
>> when I try to telnet to $EXTIP on 25 from outside
>> telnet: Unable to connect to remote host: Connection refused

AS> Your FORWARD rule needs to allow the packets to the real IP address
AS> (10.10.10.252) because the packets have already been translated by the
AS> PREROUTING rule by the time they get to FORWARD.

AS> Regards,

AS> Antony.



-- 
Best regards,
 Oleg                            mailto:osavostyanov@internetplustravel.ru


