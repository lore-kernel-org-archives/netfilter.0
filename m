From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables u32 tests and user logging
Date: Mon, 21 Jul 2008 14:57:53 -0500
Message-ID: <4884EA41.3060203@riverviewtech.net>
References: <76fdae320807202313ma67d4c3l1921e41fa962a976@mail.gmail.com>	 <76fdae320807202315mb59c131s5f4c52f350d31aca@mail.gmail.com>	 <alpine.LNX.1.10.0807210942340.21244@fbirervta.pbzchgretzou.qr>	 <4884ADDC.7000600@riverviewtech.net>	 <76fdae320807210941p39dc17b6i1e4e3e75592c7b6b@mail.gmail.com>	 <alpine.LNX.1.10.0807211848360.21244@fbirervta.pbzchgretzou.qr> <76fdae320807211106m4d0c6dd8qfae16a04a31577d8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <76fdae320807211106m4d0c6dd8qfae16a04a31577d8@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/21/08 13:06, Padmanabhan wrote:
> Is there way we can add code to u32 to do this function ,, after 
> matching a criteria,  print/ log interested bytes?

Rather than having u32 do the logging, you could use u32 to create 
multiple different rules (one per ITT you want to log) and then use a 
generic LOG target to do the logging for you.  I.e.

Does ITT match "A", log "bla, bla, A, bla..."
Does ITT match "B", log "bla, bla, B, bla..."
Does ITT match "C", log "bla, bla, C, bla..."

You may want to make this a sub chain that is jumped to after matching 
the common portion of the IPTables rule.



Grant. . . .
