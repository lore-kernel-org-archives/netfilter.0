From: rigoberto perez <rigo666beast@yahoo.com>
Subject: Re: Problems with UNIX SCO
Date: Thu, 11 Dec 2008 07:44:36 -0800 (PST)
Message-ID: <186247.24078.qm@web33206.mail.mud.yahoo.com>
Reply-To: rigo666beast@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

 Friends:
 
 The problems is not only with UNIX. If I put two routers
 Linux with my modules the communications between boths are
 OK but when I try to connect from a Client the TCP reports
 checksum problems. For example:
 
 
 Linux1    ------   Linux2
 
 is OK, but
 
 
 Client (windows or Linux)    ------ Linux1 ------- Linux2
 
 The Client reports checksum TCP errors. The gateway for the
 Client is Linux1 and the TCP is made form Client to the
 Linux2. 
 
 It's like the TCP checksum was modify but the TCP
 checksum depends only of data and the IP directions and this
 not change, beside, the original packet content (protocol,
 length, ..) is restore. I see the TCP checksum header before
 modify the packets and its the same when I restore the
 original packets, so I think that the pseudo header is the
 problem but I don't have clear whats the problem.
 
 
 I glad to receive some comments,
 
 Thanks.
 
 Postdata: I use SUSE Enterprise Server 10.




      
