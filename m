From: "Donald Murray, P.Eng." <donaldm314@gmail.com>
Subject: Re: modprobe -r ip_conntrack_ftp problem
Date: Thu, 22 Sep 2005 10:36:56 -0600
Message-ID: <12984bb0050922093656bcc7e7@mail.gmail.com>
References: <BAY107-DAV9BE54F7ED641AB101EAA8B7970@phx.gbl>
Reply-To: "Donald Murray, P.Eng." <donaldm314@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY107-DAV9BE54F7ED641AB101EAA8B7970@phx.gbl>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: Deepak Seshadri <d_s123@hotmail.com>, netfilter@lists.netfilter.org

On 9/22/05, Deepak Seshadri <d_s123@hotmail.com> wrote:
>
> Hello All,
> Good day!
>
> When I try to restart iptables by "servce iptables restart", the process
> hangs in the "Unloading modules" section.
> ps -ef|grep modprobe shows that it is trying to remove ip_conntrack_ftp
> module.
> The CPU has shot to 100% usage. I am not even able to kill the module.
> Could
> someone, please tell me what is happening here? What is the workaround?
> It does not happen always.
>
> OS: Fedora core 2
> iptables v 1.2.11
> kernel: 2.6.8.1 <http://2.6.8.1>
>
> Any help will be appreciated.
> Thank you,
> Deepak
>
>
Funny you mention this today. I rebooted a box last night because
of this same problem. This ended a 287 day uptime.

This was on an old RH 7.2 with:
kernel-2.4.20-28.7
iptables-1.2.8-8.72.3

I never bothered to send an email to the list because I assumed it
was an old 2.4.20 issue.
