From: Christian Seberino <seberino@spawar.navy.mil>
Subject: Re: iptables -F & iptables -X good enough *for all* tables/chains?
Date: Mon, 24 Jun 2002 12:57:13 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020624125713.A3624@spawar.navy.mil>
References: <20020624114108.A3305@spawar.navy.mil> <001b01c21baf$a4450a50$0a01a8c0@ed>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <001b01c21baf$a4450a50$0a01a8c0@ed>; from blacknet@simplyaquatics.com on Mon, Jun 24, 2002 at 02:47:50PM -0400
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ed Street <blacknet@simplyaquatics.com>
Cc: netfilter@lists.samba.org

Ed

Thanks for the reply.  I can accept that -F is necessary
*for every single table separately*.

User defined chains are *not* tied to specific tables
as far as I can tell.  Is there any value in doing

iptables -t nat -X
iptables -t mangle -X
iptables -t filter -X

rather than just iptables -X???

Linux Firewalls book has the three line method instead if iptables -X.

Chris


On Mon, Jun 24, 2002 at 02:47:50PM -0400, Ed Street wrote:
> Hello,
> 
> Well first off the regular expression of Iptables -F will NOT flush the
> specific tables i.e. nat/manglefilter.  However, if you are NOT using
> those tables it's pointless to -F as there's nothing there.  In general
> it's a good idea and a good habit to get into using.
> 
> To test your theory you need some rules in any of those three tables.
> Do the iptables -F and then run iptables -t nat -L -n you will see the
> rules are still there.
> 
> Ed
> 
> -----Original Message-----
> From: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org] On Behalf Of Christian Seberino
> Sent: Monday, June 24, 2002 2:41 PM
> To: netfilter@lists.samba.org
> Subject: iptables -F & iptables -X good enough *for all* tables/chains?
> 
> iptables -F
> iptables -X
> 
> These simple 2 lines seem good enough to
> nuke *all* rules and *all* user defined chains.....
> 
> Yet, in print (like Linux Firewalls book) I often
> see people wanting to apply -F and -X to 
> *every single table one by one*
> 
> (e.g. iptables -t nat    -F
>       iptables -t filter -F
>       iptables -t mangle -F
>  etc.)
> 
> Am I missing something? My simple 2 lines above
> seem good enough to do the trick.
> 
> Chris
> -- 
> _______________________________________
> 
> Dr. Christian Seberino
> SPAWAR Systems Center San Diego
> Code 2363
> 53560 Hull Street
> San Diego, CA 92152-5001
> U.S.A.
> 
> Phone: (619) 553-7940
> Fax:   (619) 553-2836
> Email: seberino@spawar.navy.mil
> _______________________________________
> 

-- 
_______________________________________

Dr. Christian Seberino
SPAWAR Systems Center San Diego
Code 2363
53560 Hull Street
San Diego, CA 92152-5001
U.S.A.

Phone: (619) 553-7940
Fax:   (619) 553-2836
Email: seberino@spawar.navy.mil
_______________________________________

