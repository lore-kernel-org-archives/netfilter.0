From: aksingh@hss.hns.com
Subject: Re: registering/unregistering hook functions
Date: Thu, 3 Jun 2004 19:26:57 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF4D9C0684.4E8D54DD-ON65256EA8.004C84A0@hss.hns.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	Boundary="0__=EABBE43BDFDF02308f9e8a93df938690918cEABBE43BDFDF0230"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Sven Schuster <schuster.sven@gmx.de>
Cc: netfilter@lists.netfilter.org


--0__=EABBE43BDFDF02308f9e8a93df938690918cEABBE43BDFDF0230
Content-type: text/plain; charset=US-ASCII





HI Sven,

   What a wonderfully simple solution, how come i never thought of it, more
coffee please ;-)

thanks
Amit




Sven Schuster <schuster.sven@gmx.de> on 06/03/2004 07:28:26 PM

To:    Amit Kumar Singh/HSS@HSS
cc:    netfilter@lists.netfilter.org

Subject:    Re: registering/unregistering hook functions



Hi Amit,

On Thu, Jun 03, 2004 at 07:01:22PM +0530, aksingh@hss.hns.com told us:
>
> Hi,
>
>   In my module I do not want my hook functions to start capturing packets
> when it is inserted using insmod(i.e i do not want my hook registration
> functions to be called in init_module(). I want to register them when
> someone writes onto my char device, so then I cannot unregister my hook
> functions in the cleanup_module() because I do not know if they are
> registered or not in the first place.
>
>    So my question is, is there a way to find out before calling the
>    unregister functions in cleanup_module whether or not they are
>    registered. Something like this in the cleanup module :
>    cleanup_module()
>       if (registered(nfho1)) unregister(nfho1) ;
>

I don't know if there's a function to find out if a particular function
is registered with the netfilter hooks. But the simplest method to
accomplish what you want would be to have a variable in your module
which is initialized to 0 and when you register set it to 1. Then, in
your cleanup_module(), only unregister iff the variable is set to 1.
Don't know if there's a better way to do it.


HTH

Sven

> ??
>
> thanks
> Amit

--
Linux zion 2.6.7-rc2 #2 Mon May 31 22:58:01 CEST 2004 i686 athlon i386
GNU/Linux
  15:55:33  up 2 days, 16:55,  3 users,  load average: 0.14, 0.05, 0.01


--0__=EABBE43BDFDF02308f9e8a93df938690918cEABBE43BDFDF0230
Content-type: application/octet-stream; 
	name="C.DTF"
Content-Disposition: attachment; filename="C.DTF"
Content-transfer-encoding: base64

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NClZlcnNpb246IEdudVBHIHYxLjIuMSAoR05V
L0xpbnV4KQ0KDQppRDhEQlFGQXZ5NkNvNEZBZEIyUG5lUVJBaFRXQUo0dHk0cC80UWdvWHUrejQy
S3A2ZWFQQjB4QzZRQ2VQYjZJDQowTVV2QjNiUjQ1RURlTy84RDlvUmRnND0NCj1tT2l6DQotLS0t
LUVORCBQR1AgU0lHTkFUVVJFLS0tLS0NCg0K

--0__=EABBE43BDFDF02308f9e8a93df938690918cEABBE43BDFDF0230--


