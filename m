From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Packets missing state ?
Date: Tue, 23 Dec 2003 13:08:50 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312231308.50481.Antony@Soft-Solutions.co.uk>
References: <200312231828.59518.rajiv@theargoncompany.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312231828.59518.rajiv@theargoncompany.com>
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

On Tuesday 23 December 2003 12:58 pm, Rajiv Shah wrote:

> Hi,
> 	I can see the following lines in my /var/log/messages
>
> IN=eth1 OUT= MAC=00:03:47:6a:5c:6b:00:c0:49:25:d1:a3:08:00 SRC=69.6.16.110
> DST=xxx.xxx.xxx.xx LEN=40 TOS=0x00 PREC=0x00 TTL=61 ID=15968 PROTO=TCP
> SPT=80 DPT=1821 WINDOW=65535 RES=0x00 ACK URGP=0
>
> IN=eth1 OUT= MAC=00:03:47:6a:5c:6b:00:c0:49:25:d1:a3:08:00 SRC=69.6.16.110
> DST=xxx.xxx.xxx.xx LEN=40 TOS=0x00 PREC=0x00 TTL=61 ID=15968 PROTO=TCP
> SPT=110 DPT=4553 WINDOW=65535 RES=0x00 ACK URGP=0
>
> where xxx.xxx.xxx.xx is my IP. This seems to be one of the return packets
> which is being logged. I can access the site without any problems. The
> mails come thru, can do a ssh login. But looking at the logs I feel there
> is some problem somewhere.

You say you can access the site without any problems.

I would expect the above log entries to happen when you close down the browser 
(or view a different site), but the remote server still continues to send a 
few packets.   They are no longer part of an established connection as far as 
netfilter is concerned, so they get logged.

Try checking the timestamps, or view the logfile in real time as you do your 
browsing - I'd expect these log entries to occur soon after you leave the 
site at the SRC address.

Nothing to worry about.

Antony.

-- 
What is this talk of "software release"?
Our software evolves and matures until it is capable of escape, leaving a 
bloody trail of designers and quality assurance people in its wake.

                                                     Please reply to the list;
                                                           please don't CC me.


