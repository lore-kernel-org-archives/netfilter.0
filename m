From: Michael <mutk@ozemail.com.au>
Subject: Re: How to ACCEPT or DENY or DROP and also LOG in the same rule ?
Date: Thu, 04 Jul 2002 15:53:21 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D23E2D1.3070802@ozemail.com.au>
References: <F30rd6vbwbQdgr1KHCE00006f06@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

I don't beleive you can.

Just do a rule pair:

<somerule to match> -j LOG
<somerule to match> -j ACCEPT

I think that, since LOG doesn't cause the packet to leave the table 
(ACCEPT and DROP do), it will continue traversal of the table until a 
match/target that does cause it to leave the table is found. So the 
matching DROP or ACCEPT rule will then dispose the packet as you wish 
after it was logged.

Cheers,
Michael


Orca J. wrote:

> Hi
>  I want to both DENY and LOG in the same rule ? or ACCEPT and LOG , or 
> DENY and LOG
> Thanks
>
>
> _________________________________________________________________
> MSN Photos is the easiest way to share and print your photos: 
> http://photos.msn.com/support/worldwide.aspx
>
>
>




