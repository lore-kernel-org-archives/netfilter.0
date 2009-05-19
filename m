From: Miguel Ghobangieno <mikeeusa@yahoo.com>
Subject: Re: iptables to add same rule
Date: Tue, 19 May 2009 08:29:30 -0700 (PDT)
Message-ID: <960581.95193.qm@web44815.mail.sp1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1242746970; bh=5sTHjeON4CF5Mx6gAV4OkpfsSP0YnM3mMtmEtAnThZg=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=z7gays/Rn1/MX57q33qNJ8fgOp8CB16z9BuZQVr1rcoEvzJvj/PLWRbvn8HZCgTJW6sw+NxArZ5mpjBMi6zXqWfmP5nwp558M2V58riaWQgal4+wiqKDJB8yAnTJRbZZWHxfuEklmMvFY5rHOtaOd1F5NzU3HCKpxScOoC8g3js=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


Just forget it, no one is going to help you. No one helps ANYONE on this fucking list.


--- On Tue, 5/19/09, Sudarshan Soma <sudarshan12s@gmail.com> wrote:

> From: Sudarshan Soma <sudarshan12s@gmail.com>
> Subject: iptables to add same rule
> To: netfilter@vger.kernel.org
> Date: Tuesday, May 19, 2009, 6:29 AM
> Hi All,
> I am trying to present WUI for iptables with simple
> functionality such
> as add/delete rule. For adding rule, can i avoid adding the
> same rule
> again.
> Suppose, if the user tries to block ftp from outside. I
> will add
> iptable rule as below:
> iptables -A INPUT -p tcp --dport 21 -j DROP
> 
> If the user tries to add the same rule again, can i somehow
> determine
> through iptables , if the rule is already added.
> 
> Thanks and Regards,
> Pavan
> --
> To unsubscribe from this list: send the line "unsubscribe
> netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


      

