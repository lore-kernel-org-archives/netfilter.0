From: George Georgalis <georgw@galis.org>
Subject: Re: ssh connecting to wrong machine....
Date: Mon, 3 Jun 2002 16:57:37 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020603165737.A1199@trot.haven.dom>
References: <20020602192157.A16556@trot.haven.dom> <002c01c20aaa$812e04b0$020aa8c0@matttm9svd8lrh> <20020603010544.E16556@trot.haven.dom> <001901c20af8$0b8bbe70$020aa8c0@matttm9svd8lrh>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <001901c20af8$0b8bbe70$020aa8c0@matttm9svd8lrh>; from mhellman@raccoon.com on Mon, Jun 03, 2002 at 07:13:17AM -0500
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
To: Matthew Hellman <mhellman@raccoon.com>
Cc: George Georgalis <georgw@galis.org>, netfilter@lists.samba.org

On Mon, Jun 03, 2002 at 07:13:17AM -0500, Matthew Hellman wrote:
>
>Looks good.  The only other thing I'd do is change your default OUTPUT
>policy to DROP and add this:
>iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
>
>There was a recent bug in the iptables code that had some security
>implications (information disclosure), but I don't recall the details at the
>moment. The suggestion was to drop INVALID output, which this does.

I think I heard about that, disclosing LAN IPs? I didn't really pay
attention at the time, thanks, it's fixed now.

// George


-- 
GEORGE GEORGALIS, System Admin/Architect    cell: 347-451-8229 
Security Services, Web, Mail,            mailto:george@galis.org 
File, Print, DB and DNS Servers.       http://www.galis.org/george 


