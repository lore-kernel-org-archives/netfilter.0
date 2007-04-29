From: Martijn Lievaart <m@rtij.nl>
Subject: Re: in-memory table change
Date: Sun, 29 Apr 2007 17:09:07 +0200
Message-ID: <4634B513.2020706@rtij.nl>
References: <46331171.0580d666.73d8.ffffc398@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46331171.0580d666.73d8.ffffc398@mx.google.com>
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
To: =?ISO-8859-2?Q?J=FAlius_Bem=B9?= <julius.bems@gmail.com>
Cc: netfilter@lists.netfilter.org

J=FAlius Bem=B9 wrote:
> Hello,
>
> I have to try solve this problem:
> -If there is a lot of rules in the packet filter table, it takes a qui=
te
> long time for 'iptables' to add a new rule (the change will be seen
> sometimes in 30 seconds).
> -I don't know how 'iptables' exactly works, but I thinked about changi=
ng 
> rules exactly in the table, which is in-memory. It could take less tim=
e than
> 'iptables'
>
> So my question is: Is this what I have described real? If yes, are the=
re
> some utilities by which I can change in-memory packet filter table? Be=
cause
> I want avoid writing some code in c.
>   

Do you use iptables--restore? If not, look into that. If yes, well, I'm 
afraid I cannot help you.

HTH,
M4


