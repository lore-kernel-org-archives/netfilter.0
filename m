From: Gerry Reno <greno@verizon.net>
Subject: Re: fwknop: use with Fedora?
Date: Sun, 23 Sep 2007 11:17:37 -0400
Message-ID: <46F68391.5060905@verizon.net>
References: <46F5B7F8.2060502@verizon.net> <46F5C161.7090908@verizon.net>
 <46F5CF0C.3060004@verizon.net> <20070923043058.GA2940@minastirith>
 <46F65D0E.6050005@verizon.net> <46F65EBE.30502@verizon.net>
 <46F66A11.5000901@verizon.net> <46F66E89.1000809@verizon.net>
 <46F6755D.9070407@verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <46F6755D.9070407@verizon.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Is this correct for logging on the server?:

Chain INPUT (policy ACCEPT)
num target prot opt source destination
1 LOG tcp -- 0.0.0.0/0 0.0.0.0/0 tcp dpts:55000:62000 LOG flags 2 level 4
2 LOG udp -- 0.0.0.0/0 0.0.0.0/0 udp dpts:55000:62000 LOG flags 0 level 4


Gerry

