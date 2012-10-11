From: "Brian Morris" <bmorris@comtechefdata.com>
Subject: helper match bug?
Date: Thu, 11 Oct 2012 12:09:55 -0700
Message-ID: <5076D333020000E200012986@tempegwia1.comtechefdata.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

It seems the helper match shouldn't succeed if the strings being
compared aren't the same length.
 
For example, both of these nat rules match the helper connections if I
start an FTP session on master port 212 with FTP conntrack configured to
support both ports:
 
-A PREROUTING -p tcp -m state --state RELATED -m helper --helper
"ftp-212" 
-A PREROUTING -p tcp -m state --state RELATED -m helper --helper
"ftp-2122" 
 
because the strncmp is just using the length of the helper. Is this by
design?
 
Thanks
Brian
