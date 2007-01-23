From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: netfilter_queue: how to obtain address info from queued packet
Date: Tue, 23 Jan 2007 12:49:11 +0100
Message-ID: <45B5F637.5030502@freemail.hu>
References: <45B5DD80.70809@siemens.com> <45B5DF09.6030001@freemail.hu>
	<45B5E0DC.2020703@siemens.com> <45B5E321.90608@freemail.hu>
	<45B5E630.6000305@siemens.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45B5E630.6000305@siemens.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Michal Martinek <michal.martinek@siemens.com>
Cc: netfilter@lists.netfilter.org

Michal Martinek =EDrta:
>
> Thanks, I was too fast to answer without looking into man pages:-).=20
> But this module would just save me some work with analyzing packets.=20
> The problem is that I would like to detect video stream in which I can =

> recognize only some "key packets". The rest is (for me)=20
> unrecongnizable and I only know that they are coming from/to the same=20
> port.
>
Well... It is not really clear to me what you want... :-) (Blocking some =

"communication" :-) .)
You can drop the whole connection when you detect for example a header=20
of a video stream....
This could be dangerous because you would drop some legitimate traffic to=
o.
That is why you have to narrow your matching criterias. (eg.: adding=20
some rules like "-i eth0" or "-s 192.168.0.1")
An other good thing to look after is the l7 patch:

http://l7-filter.sourceforge.net/HOWTO

But there may be better solutions if you would clarify more your needs :)=


Swifty


