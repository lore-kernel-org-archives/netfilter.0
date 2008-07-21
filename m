From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables u32 tests and user logging
Date: Mon, 21 Jul 2008 10:40:12 -0500
Message-ID: <4884ADDC.7000600@riverviewtech.net>
References: <76fdae320807202313ma67d4c3l1921e41fa962a976@mail.gmail.com> <76fdae320807202315mb59c131s5f4c52f350d31aca@mail.gmail.com> <alpine.LNX.1.10.0807210942340.21244@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0807210942340.21244@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/21/08 02:51, Jan Engelhardt wrote:
> and the same tests with byte 16-19, checking for example, 0x1337 as 
> ITT. Note that this matches one specific ITT value only. If you want 
> to log all ITTs, then you should omit the ITT test and only test for 
> iSCSI, and log that using your favorite method.

Is there a way to log the data extracted from the matched packet with 
out passing the packet to user space for logging?  Or are you matching 
the desired packets and sending them user space for logging?

In other words is there a way to have IPTables read some contents of a 
packet and then LOG the contents with out passing the entire packet to 
user space?  (To the best of my knowledge there is no way to do this.)



Grant. . . .
