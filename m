From: "Joey" <Joey@Web56.net>
Subject: error with iptables-restore
Date: Wed, 22 Oct 2008 09:50:37 -0400
Message-ID: <003301c9344d$29ffb5c0$7dff2140$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: IPTables <netfilter@vger.kernel.org>

Hello Everyone,

 

I have been working on getting my ip list to be written to a save file, and
it looks good, but I get this error when restoring:

 

iptables-restore v1.3.5: error creating chain 'CIDR-TURKEY':File exists

Error occurred at line: 9945

 

No there are 20 other chains that are generated prior to this one in exactly
the same way, and there are several chains that load PRIOR to this one, so I
know I don't have a syntax issue.

 

Line 9945 has this:

:CIDR-TURKEY - [0:0]

 

Which looks exactly the same as every other chain creation line.

 

I have linked the entire generated text file ( restore formatted file ) here
<http://web56.net/TEST-IP-TABLES> 

 

 

Sorry to be such a newb..

 

Thanks!

Joey


