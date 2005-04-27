From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: where list of **reserved address**??? (IP addresses can *drop*)
Date: Wed, 27 Apr 2005 10:35:44 -0500
Message-ID: <426FB150.2060708@riverviewtech.net>
References: <1114539542.3856.12.camel@seberino.spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1114539542.3856.12.camel@seberino.spawar.navy.mil>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> where list of **reserved address**??? (IP address can *drop*)
> 
> I had a list but I keep having to remove IP addresses from 
> it....either list keeps changing or my list is crap....

As has been previously stated (in replies to your message) IANA has a list of reserved IP addresses (http://www.iana.org/assignments/ipv4-address-space) which will periodically change.  So I wrote a small script (see below) that will lynx --dump the page and run and MD5 sum of it and dump it in to a file.  Periodically (when ever I feel like having Cron run it) the script will run and compare the page on the web's MD5 sum to what I knew about.  If the MD5 sum is different it will email me and let me know.

Also you should look at RFC 3330 as it has a LOT of information (as do most RFCs) about network addresses that should be allowed to pass.



Grant. . . .



#!/bin/bash

NewMD5Sum=`lynx --dump http://www.iana.org/assignments/ipv4-address-space | md5sum | cut -f1 -d\ `
OldMD5Sum=`md5sum ~gtaylor/docs/ipv4-address-space | cut -f1 -d\ `

if [ ${NewMD5Sum} != ${OldMD5Sum:=null} ]; then
    lynx --dump http://www.iana.org/assignments/ipv4-address-space > ~gtaylor/docs/ipv4-address-space
    cat ~gtaylor/docs/ipv4-address-space | mail -s "New IPv4 Address Space info from IANA (`ct`)" gtaylor@riverviewtech.net
fi

Note:  ct is a small script that I wrote to give me a formated date output and is inconsequential in this matter.

