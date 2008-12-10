From: rigoberto perez <rigo666beast@yahoo.com>
Subject: Problems with UNIX SCO
Date: Wed, 10 Dec 2008 08:45:02 -0800 (PST)
Message-ID: <332483.28349.qm@web33206.mail.mud.yahoo.com>
Reply-To: rigo666beast@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Friends:

I wrote a netfilter module with the follows operations:

OUT
***
1) Modify every packet by paddding 64 bytes
2) Save the original protocol in the 64 bytes trailer (that's enough space!)
3) Modify the protocol header in TCP
4) Calculate the IP checksum


IN
**
1) Restore the original protocol by get the saved in the trailer
2) Trim the 64 bytes in the tail
3) Calculate the IP checksum

I wrote the same funcionality in a SCO OPENSERVER UNIX. The comunication between the boths systems through pings is OK but in the case of TCP report errors in the checksum of the packets in UNIX.

Anybody have some idea about it?

Thanks.


      
