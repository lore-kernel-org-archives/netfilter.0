From: "Joey" <Joey@Web56.net>
Subject: RE: iptables-save ?
Date: Wed, 22 Oct 2008 09:26:37 -0400
Message-ID: <003001c93449$cf7d1d70$6e775850$@net>
References: <002f01c93421$227ad450$67707cf0$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <002f01c93421$227ad450$67707cf0$@net>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: IPTables <netfilter@vger.kernel.org>

What significance do the numbers between the brackets have?

print ":INPUT ACCEPT [6180932:1244590784]\n";
print ":OUTPUT ACCEPT [6574901:1313953477]\n";

I got those from executing a iptables-save so I can see what format I needed
to match in generating my own save file from our IP DB.


Thanks!

Joey

