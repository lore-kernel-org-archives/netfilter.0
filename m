From: Simone Leggio <tkt_legg@cs.helsinki.fi>
Subject: Re: IP TOS based routing
Date: Thu, 27 Mar 2003 17:33:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E8319B0.6000609@cs.helsinki.fi>
References: <3E80187B.5030209@cs.helsinki.fi> <200303261316.35019.kimj@dawn.dk> <3E82A91F.7000108@cs.helsinki.fi> <019501c2f46c$8a47c5c0$25000c0a@Flaptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rinse Kloek <rinse@solcon.nl>
Cc: netfilter@lists.netfilter.org

Rinse Kloek wrote:
 > Hello,
 >
 > I have  a problem like this. Can somebody tell me how I can use 'ip 
route'
 > to do DSCP field based routing. I now can only use the TOS fields, but I
 > want to use the DS fields too.
 >
 > How Come?
 >
 > Regards Rinse

The DS field is a TOS field "masked", so the use is pretty similar. 
Only, pay attention because the coding is slightly different.
I suggest to take a look to Linux traffix control tool howto:

http://lartc.org/

It is very well specified how to play with differentiated services, and 
thus with the DS field.
It is not stirctly related to routing, but it might give you an idea 
about the coding.
With regard to routing, I'm working on it too, so unfortunely I cannot 
help you so much.

	Simone.



