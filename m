From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Ip accounting Help--> Urgent
Date: Sat, 26 Jun 2004 12:16:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406261216.37373.Antony@Soft-Solutions.co.uk>
References: <1087962571.2041.10.camel@joel.d2visp.com> <200406261029.36368.Antony@Soft-Solutions.co.uk> <1088245438.2121.22.camel@joel.d2visp.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1088245438.2121.22.camel@joel.d2visp.com>
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

On Saturday 26 June 2004 11:23 am, Joel Solanki wrote:

> [root@joel root]# iptables -L FORWARD -t mangle -nvx
>
> Chain FORWARD (policy ACCEPT 6375 packets, 1886840 bytes)
> pkts	bytes	target	prot	opt	in	out	source		destination
> 3200	1742989		all	--	eth1	*	192.168.0.2	0.0.0.0/0
> 3175	143851		all	--	eth0	*	0.0.0.0/0	192.168.0.2
>
> This is the result when i uploaded to remote ftp server which is in our
> network . File Uploaded php.pdf size=1:53 MB

Looks completely correct to me.

File uploaded=1.53Mbytes
1742989 bytes shown coming from 192.168.0.2

> [root@joel root]# iptables -L FORWARD -t mangle -nvx
>
> Chain FORWARD (policy ACCEPT 8923 packets, 3794033 bytes)
> pkts	bytes	target	prot	opt	in	out	source		destination
> 4308	1803901		all	--	eth1	*	192.168.0.2	0.0.0.0/0
> 4615	1990132		all	--	eth0	*	0.0.0.0/0	192.168.0.2
>
> This is the result when i download squid.tar.gz from ftp server which is
> in my network. file size is 1.25MB

File downloaded = 1.25Mbytes
1990132-(some allowance for the traffic already counted) bytes shown going to 
192.168.0.2

I see no discrepancies here.

> This is according to your suggestion but i have used the ftp server
> which is in my network. I havent used ftp server of my linux server on
> which iptables and nat is done.

Hang on a minute!

Are you saying that the FTP server you are trying to count the traffic from/to 
is *on* the netfilter machine!?

Well, first of all, you shouldn't be running applications on your firewall, 
and secondly, all the rules we've been talking about are in your FORWARD 
chain - they will count packets routed *through* the machine, not packets 
sent to or from the machine itself.

If you want to count traffic to & from the machine itself then you need to put 
the rules in INPUT and OUTPUT.

Regards,

Antony.

-- 
These clients are often infected by viruses or other malware and need to be 
fixed.  If not, the user at that client needs to be fixed...

 - Henrik Nordstrom, on Squid users' mailing list

                                                     Please reply to the list;
                                                           please don't CC me.


