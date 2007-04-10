From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: packets to local addresses
Date: Tue, 10 Apr 2007 17:21:40 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0704101721060.21664@yvahk01.tjqt.qr>
References: <fad2fb270704060522r4322a223g4e2e40605b3fb6a@mail.gmail.com> 
	<46167157.3080409@rtij.nl>
	<fad2fb270704070713w37a73f82o3caaf14f987a0f7a@mail.gmail.com>
	<4617BC88.102@rtij.nl>
	<Pine.LNX.4.61.0704072040300.22181@yvahk01.tjqt.qr>
	<46180FAD.50209@rtij.nl>
	<fad2fb270704100452p74fdde26k33f7a666ba9c1a59@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <fad2fb270704100452p74fdde26k33f7a666ba9c1a59@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: MKS <rekordmeister@gmail.com>
Cc: netfilter@lists.netfilter.org


On Apr 10 2007 11:52, MKS wrote:
>
> It's not possible to override the local table nor bypass or delete from it.
>
> When I use hping -I ppp0 and ping to 10.0.1.1 (ppp1) then I don't get
> any response and I can see that the packet never leaves the system
> (tcpdump -i ppp0) and that it never arrives on the NAS (using debug on
> the NAS)
>
> Does someone know a trick to override the local routing table? or does
> that require hacking the kernel?

What exactly are you trying to achieve?
To simply test transmission, `ping -I interface -bf 255.255.255.255`
does the job.


Jan
-- 

