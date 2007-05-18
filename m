From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: TCP RST vulnerability - handling question
Date: Fri, 18 May 2007 08:54:29 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0705180852160.12211@blackhole.kfki.hu>
References: <bd0eabd0705161756q79024a91y74a132e34616c7fa@mail.gmail.com>
	<bd0eabd0705171634wc4b54k8fa75afe3992adfa@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <bd0eabd0705171634wc4b54k8fa75afe3992adfa@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Mike C <smith.not.western@gmail.com>
Cc: netfilter@lists.netfilter.org

On Fri, 18 May 2007, Mike C wrote:

> On 5/17/07, Mike C <smith.not.western@gmail.com> wrote:
>> I am using an iptables 1.3.5 based setup and wonder if there are any
>> tools or techniques available to prevent or mitigate the TCP RST
>> spoofing issue (http://osvdb.org/displayvuln.php?osvdb_id=4030)
>
> I just realised that I posted the wrong issue. The one I am referring
> to is where a third party sends a RST with a sequence number less than
> the current window, which is still treated as a valid RST by the end
> point.
[...]
> I should outline my situation a bit more. I have a firewall that I
> want to prevent passing illegal RST packets to an inside host. In my
> case the host is patched against this issue, but this may not always
> be the case, so need to stop the invalid resets from traversing the
> firewall in the first place.

Any recent kernel from the 2.6 series come with TCP window tracking in 
netfilter, which makes sure that the RST segment is in the window.
Nothing is needed besides enabling connection tracking.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
           H-1525 Budapest 114, POB. 49, Hungary

