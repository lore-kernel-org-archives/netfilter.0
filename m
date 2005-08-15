From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: ftp issue cont.
Date: Mon, 15 Aug 2005 14:51:13 +0200
Message-ID: <43008FC1.7050104@mnemon.de>
References: <E656E2CC1C5AEB42ACB00EB83122C7741FCC75@farmer.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E656E2CC1C5AEB42ACB00EB83122C7741FCC75@farmer.vikus.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> I get the following error : 

[SNIP]


> 257 "/xxxxxxxxx" is current directory. 
> Loading directory listing /xxxxxxxx from server (LC_TIME=en_US) PORT
> 192,168,0,253,4,3 
>  
> 500 Invalid PORT Command. 
> Invalid response '5' received from server. 
> Disconnecting from site ftp.sriaurobindoashram.com 

You say, that this FTP server is located in US ? And you want to connect
to this server via internet ? And this is what you get ? If so, you will
never get something from this server (with this configuration). Watch this:

192,168,0,253,4,3

This means something like "Hey guy, connect to my address of
192.168.0.253 on port 4*256+3". This is a RFC1918 address which is
dropped at the first router on the internet. Ask your friend to do some
SNAT or configure the FTP server correctly (I'm not familiar with MS
server stuff) and try again.

Have a nice time,

Joerg



