From: aksingh@hss.hns.com
Subject: Re: Reinjecting packets using libipq
Date: Tue, 20 Apr 2004 14:33:24 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF8E85CF26.D422F823-ON65256E7C.0031B88D@hss.hns.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	Boundary="0__=EABBE4EFDFA23E1D8f9e8a93df938690918cEABBE4EFDFA23E1D"
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
To: netfilter@lists.netfilter.org


--0__=EABBE4EFDFA23E1D8f9e8a93df938690918cEABBE4EFDFA23E1D
Content-type: text/plain; charset=US-ASCII






---------------------- Forwarded by Amit Kumar Singh/HSS on 04/20/2004
02:41 PM ---------------------------


Amit Kumar Singh
04/20/2004 02:25 PM

To:    Sven Schuster <schuster.sven@gmx.de>
cc:

Subject:    Re: Reinjecting packets using libipq  (Document link: Amit
       Kumar Singh)

Hi Sven,

   thanks for the reply, i wll be a bit more specific with my question this
time
   suppose I am using netfilter hooks, and not iptables ---

   my PRE_ROUTING hook returns NF_QUEUE and the packet goes to the user
   space, my user space program plays with the packet and then calls
   ip_set_verdict with a verdict of NF_ACCEPT, in this case the packet
   would continue its journey in the kernel from after the PRE_ROUTING hook
   or would it again get caught by the PRE_ROUTING hook ?
   Also, I had another doubt, can we use libpq to reinject absolutely new
   packets into the kernel at the ip level and make sure that they dont get
   caught by our registered netfilter hooks ? .. or if we cannot use libpq
   then is someother way available (on the same system where we have the
   PRE_ROUTING netfilter hook, we want to bypass this hook for certain
   packets). The newly injected packets cld either be outbound(going to the
   wire) or inbound( they after going to ip will have to go up the stack to
   tcp and all)

thanks
Amit




Sven Schuster <schuster.sven@gmx.de> on 04/20/2004 02:11:23 PM

To:    Amit Kumar Singh/HSS@HSS
cc:    netfilter@lists.netfilter.org

Subject:    Re: Reinjecting packets using libipq



Hi Amit,

On Tue, Apr 20, 2004 at 01:26:34PM +0530, aksingh@hss.hns.com told us:
>
>
>
>
> hi
>
>  when I use ip_set_verdict to reinject a packet into the kernel from user
> space(suppose the verdict is NF_ACCEPT), what happens ...
> 1) does the packet get reinjected at the PRE_ROUTING phase ?
> 2) If so can I be sure that the packet doesnt get caught at the same hook
> which first queued it to the user space ?

The packet gets reinjected where it was taken to user space. E.g. when
you have a chain with 5 rules and the packet is taken to user space
at rule #3 it will continue traversal in the very same chain at rule #4.

>
> thanks
> Amit
>


HTH

Sven

--
Linux zion 2.6.6-rc1 #1 Sat Apr 17 11:50:12 CEST 2004 i686 athlon i386
GNU/Linux
  10:38:14  up 2 days, 17:35,  1 user,  load average: 0.08, 0.05, 0.01






"DISCLAIMER: This message is proprietary to Hughes Software Systems Limited
(HSS) and is intended solely for the use of the individual to whom it is
addressed. It may contain  privileged or confidential information and
should not be circulated or used for any purpose other than for what it is
intended. If you have received this message in error, please notify the
originator immediately. If you are not the intended recipient, you are
notified that you are strictly prohibited from using, copying, altering, or
disclosing the contents of this message. HSS accepts no responsibility for
loss or damage arising from the use of the information transmitted by this
email including damage from virus."
--0__=EABBE4EFDFA23E1D8f9e8a93df938690918cEABBE4EFDFA23E1D
Content-type: application/octet-stream; 
	name="C.DTF"
Content-Disposition: attachment; filename="C.DTF"
Content-transfer-encoding: base64

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NClZlcnNpb246IEdudVBHIHYxLjIuMSAoR05V
L0xpbnV4KQ0KDQppRDhEQlFGQWhPSXpvNEZBZEIyUG5lUVJBbjVaQUo5Tm5EaHVMZ28zZ3VYbU9G
cTJsKy8vRUZ4dXB3Q2ZhaDZhDQoxOGxJMFpHSTNVdFhqYzNkdXBZMWcwOD0NCj1wcC9SDQotLS0t
LUVORCBQR1AgU0lHTkFUVVJFLS0tLS0NCg0K

--0__=EABBE4EFDFA23E1D8f9e8a93df938690918cEABBE4EFDFA23E1D--


