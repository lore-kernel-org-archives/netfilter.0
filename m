From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables u32 tests and user logging
Date: Mon, 21 Jul 2008 16:52:19 -0500
Message-ID: <48850513.1040800@riverviewtech.net>
References: <76fdae320807202313ma67d4c3l1921e41fa962a976@mail.gmail.com>	 <76fdae320807202315mb59c131s5f4c52f350d31aca@mail.gmail.com>	 <alpine.LNX.1.10.0807210942340.21244@fbirervta.pbzchgretzou.qr>	 <4884ADDC.7000600@riverviewtech.net>	 <76fdae320807210941p39dc17b6i1e4e3e75592c7b6b@mail.gmail.com>	 <alpine.LNX.1.10.0807211848360.21244@fbirervta.pbzchgretzou.qr>	 <76fdae320807211106m4d0c6dd8qfae16a04a31577d8@mail.gmail.com>	 <4884EA41.3060203@riverviewtech.net> <76fdae320807211315v74557772jc9f8fefb83ac5b2b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <76fdae320807211315v74557772jc9f8fefb83ac5b2b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/21/08 15:15, Padmanabhan wrote:
> My interested 4 bytes can have value between all 0's to all FF's... 
> that's the reason that without matching it for a specific value,

*nod*  That makes things a little bit more difficult, but not impossible.

> I want to record those values.. without using any capturing programs 
> like tcpdump/wireshark.. u32 provided me flexibility to look for only 
> specific bytes...but the action which I would like perform is not 
> currently supported ....

Do you want to capture all packets in a connection or just one per 
connection?  If you want one per connection, you might want to match in 
the NAT table, which only sees the first packet in a connection.

> I have another story after recording these values :-)

*nod*

I'm always curious, probably to a fault.



Grant. . . .
