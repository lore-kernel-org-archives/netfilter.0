From: "Patrick Ahler" <patrick@vikus.com>
Subject: RE: passive mode ftp
Date: Fri, 23 May 2003 08:12:51 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ABEKJILKOKKGGDJKHKDFMEODCBAA.patrick@vikus.com>
References: <1053684294.1787.6.camel@raylinux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1053684294.1787.6.camel@raylinux.internal>
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
To: Ray Leach <raymondl@knowledgefactory.co.za>, Netfilter Mailing List <netfilter@lists.netfilter.org>

http://slacksite.com/other/ftp.html

Read the article above... about active vs. passive ftp.

Also, most ftp servers allow you to specify which ports to use for passive
ftp, that way you would only have to open those.

-Patrick

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Ray Leach
Sent: Friday, May 23, 2003 6:05 AM
To: Netfilter Mailing List
Subject: Re: passive mode ftp


On Fri, 2003-05-23 at 10:56, Eric Constantineau wrote:
> Hi !
>
> I want to be able to use passive ftp under my firewall...
>
> Right now passive mode does not function because I allow only packets
> WITH port 21 as a destination OR source.  When in normal mode, packets
> from the ftp server have 21 for the source port and the packets from the
> client have 21 for the destination port so it works.  But, entering
> passive mode, the destination and source ports are not 21, so my
> firewall blocks.
>
> Using a ftp client such as leechftp, cuteftp, wsftp is okay, but using
> the browser (iexplore) does not because it use passive mode.
>
> I don't want to open too much my ports, it would mean that someone could
> use those ports to get access to inside networks...  But I want to be
> able to use passive mode, some users do not want to use ftp client
> software, or are not even able to install them...
>
> Is there a specific range of ports that all passive ftp use ?
No, passive mode uses random ports from 1024 upwards.

You could use a web proxy like squid. You can force squid to always use
active mode.

Alternatively, you could use the state inspection of iptables and the
ftp connection tracking module to configure passive ftp.

>
> Thanks for helping me
>
> Eric
>
>
>
>



