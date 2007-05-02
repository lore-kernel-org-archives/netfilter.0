From: "Elvir Kuric" <omasnjak@gmail.com>
Subject: Re: my DNAT not working...help
Date: Wed, 2 May 2007 14:05:32 +0200
Message-ID: <1814bfe70705020505g735a96cal7bfe355faa10aef1@mail.gmail.com>
References: <001a01c78b35$77917f20$648045ac@Sneak>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=UPY/LA2A+vDzhTTDD6egdI7IZbnvo+Qmun7Lv0a7A99HEjvKwEQTQMLZTvK2lJ0yj/5HAlTgifBWdlcPEtTgfGIAoftj4V8g9MsT9lEs6Ad0gecwk1YLHRugFKGQkEa3S9VgXgFtEf1SQ4qpCS8H5BVKAy2LK1xZ6SOoioHIuwE=
In-Reply-To: <001a01c78b35$77917f20$648045ac@Sneak>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "sneak@ipnoc.co.za" <sneak@ipnoc.co.za>
Cc: netfilter@lists.netfilter.org

Hi,

maybe try

route add default gw 10.x.x.x  .... what is default gateway for
10.22.200.25 host ( or for that network ) .....
please copy/paste   route -n on host 10.22.200.25

Regards

Elvir Kuric


On 4/30/07, sneak@ipnoc.co.za <sneak@ipnoc.co.za> wrote:
> Hi my DNAT is no longer working?
>
>  This used to work on kernel 2.6.10 FC3, i am now running kernel 2.6.18 on
> CentOS5 due to hardware upgrade
>
> These are my nat rules  ..
>
>  iptables -t nat -A POSTROUTING -o eth1 -s 10.22.200.25 -j SNAT --to
> 172.15.0.15
>  iptables -t nat -A PREROUTING -i eth1 -d 172.15.0.15 -j DNAT --to
> 10.22.200.25
>
>  I can see my traffic getting natted to 172.15.0.15 but though a tcpdump but
> not back to 10.22.200.25
>  any ideas?
>
>
>

