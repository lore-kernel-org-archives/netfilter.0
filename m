From: "kaiwen" <cal_kaiwen@hotmail.com>
Subject: Re: Match packet mark with --set-mark to ip rule fwmark
Date: Wed, 7 Jan 2004 13:03:43 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law11-OE73k4PTBOXcs00005136@hotmail.com>
References: <Law11-OE68Dt3HvoFOA00000021@hotmail.com> <3FFB927B.4010208@snapgear.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Philip Craig <philipc@snapgear.com>
Cc: netfilter@lists.netfilter.org

Hi,

Yes, I just wish to do testing, to see if fwmark works with --set-mark.
I will try on your advice now. Thank you and get back to List soon :)

kaiwen

----- Original Message -----
From: "Philip Craig" <philipc@snapgear.com>
To: "kaiwen" <cal_kaiwen@hotmail.com>
Cc: <netfilter@lists.netfilter.org>
Sent: Wednesday, January 07, 2004 1:00 PM
Subject: Re: Match packet mark with --set-mark to ip rule fwmark


> kaiwen wrote:
> > (3) [root@g webauth]# ip ro show table test2
> > prohibit 192.168.8.122
> >
> > I expect ping from 192.168.8.122 to 192.168.250.197 to be drop, BUT is
is
> > successful. Why?
> > Did I miss out anything? Please advice.
>
> prohibit specifies the destination address, not the source.  So the ping
> from 192.168.8.122 to 192.168.250.197 will get through.  Additionally,
> the reply goes through OUTPUT, not PREROUTING, so it won't be marked and
> dropped either.  If you add your mark rule to the OUTPUT chain, then you
> should see the reply being dropped.
>
> I assume you are just using prohibit for testing: there is no point
> marking a packet with iptables and then dropping it iproute2, when you
> could just drop it with iptables in the first place.
>
> --
> Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com
>
>

