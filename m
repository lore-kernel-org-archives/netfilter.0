From: Sudarshan Soma <sudarshan12s@gmail.com>
Subject: Re: iptables to add same rule
Date: Thu, 21 May 2009 19:40:14 +0530
Message-ID: <de72ca4e0905210710s662b2034sb30e624c0e1a5d6a@mail.gmail.com>
References: <de72ca4e0905182329qe701121ud7377177687be7f3@mail.gmail.com>
	 <alpine.DEB.2.00.0905192108340.8786@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=TURE0lGRPMsZEvfB9DLss7nPS5V8QD9KT5xlLuWlIO4=;
        b=heVZ6t1vsGj4LrbD9hVGrO0S2jxphYfL0Wt0WIGmmBiw7Q45/ueCzXzxFBujQjdNtW
         XFCiqzKgADjBq4ilTLMh6qEBARxZbrT95PNfi1DtQETWgHEt9K5bZ1r/j8MLsL6a6ggG
         44iuanONNREtqdbUL5u0/Hi7PpFYtt/elr14U=
In-Reply-To: <alpine.DEB.2.00.0905192108340.8786@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

Thanks so much Jozsef. i have implemented in wrong way. i will look
into your option.

Thanks
Pavan

On Wed, May 20, 2009 at 12:42 AM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Tue, 19 May 2009, Sudarshan Soma wrote:
>
>> I am trying to present WUI for iptables with simple functionality such
>> as add/delete rule. For adding rule, can i avoid adding the same rule
>> again.
>> Suppose, if the user tries to block ftp from outside. I will add
>> iptable rule as below:
>> iptables -A INPUT -p tcp --dport 21 -j DROP
>>
>> If the user tries to add the same rule again, can i somehow determine
>> through iptables , if the rule is already added.
>
> IMHO this is just a wrong approach.
>
> You have to get (list) all the rules from the kernel anyway to present the
> user with the exact ruleset. So why don't you simply generate the new
> tables in iptables-restore format after the user added/deleted whatever
> rules, and push it back to the kernel in one step?
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>          H-1525 Budapest 114, POB. 49, Hungary
>
