From: Gerry Reno <greno@verizon.net>
Subject: Re: fwknop: use with Fedora?
Date: Sun, 23 Sep 2007 19:50:37 -0400
Message-ID: <46F6FBCD.2070203@verizon.net>
References: <46F5B7F8.2060502@verizon.net> <46F5C161.7090908@verizon.net>
 <46F5CF0C.3060004@verizon.net> <20070923043058.GA2940@minastirith>
 <46F65D0E.6050005@verizon.net> <46F65EBE.30502@verizon.net>
 <46F66A11.5000901@verizon.net> <46F66E89.1000809@verizon.net>
 <46F6755D.9070407@verizon.net> <46F693D1.2060909@verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <46F693D1.2060909@verizon.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Working with this some more...

I followed the code in /usr/bin/fwknop and there was no case to handle 
tcp so I created this patch which fixed the problem:

750c750,755
< if ($access_str =~ /udp/i) {
---
 > if ($access_str =~ /tcp/i) {
 > $proto_num = 6;
 > if ($access_str =~ /(\d+)/) {
 > $enc_allow_port = $1;
 > }
 > } elsif ($access_str =~ /udp/i) {

So now when I run the client I get the knock sequence sent to the 
server, however the server is still not opening the port so now to 
investigate that.

Gerry

