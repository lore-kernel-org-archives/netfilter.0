From: Christian Seberino <seberino@spawar.navy.mil>
Subject: Re: Default DROP policy for mangle and nat in iptables necessary/wise?
Date: Mon, 24 Jun 2002 16:36:50 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020624163650.A5016@spawar.navy.mil>
References: <20020624114515.A3324@spawar.navy.mil> <001e01c21bb1$a95115a0$0a01a8c0@ed>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <001e01c21bb1$a95115a0$0a01a8c0@ed>; from blacknet@simplyaquatics.com on Mon, Jun 24, 2002 at 03:02:18PM -0400
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

I don't have any "-t mangle" rules.  Do you agree
that if I make default DROP policy for mangle table
that nothing will get thru???

The reason you can do:

>         "$IPTABLES" -t nat -P PREROUTING DROP
>         "$IPTABLES" -t nat -P POSTROUTING DROP

is because you have NAT rules that can get thru right?

Chris










> 
> 
> -----Original Message-----
> From: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org] On Behalf Of Christian Seberino
> Sent: Monday, June 24, 2002 2:45 PM
> To: netfilter@lists.samba.org
> Subject: Default DROP policy for mangle and nat in iptables
> necessary/wise?
> 
> Linux Firewalls book assigns a default drop policy
> to mangle and nat tables.
> 
> I could not get DROP policy to work on these
> tables and I am skeptical this serves any useful
> purpose anyway since packets must all traverse
> filter table anyway.
> 
> Is the author of Linux Firewalls on drugs or is
> this really useful somehow?? (assuming you can
> get it to work)
> 
> Chris
> 
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

