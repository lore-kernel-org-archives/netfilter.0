From: Lee Burton <lburton@mrow.org>
Subject: Re: Invalid argument on 1.4.4 w/DisableExternalCache On (Kernel 4.7.4)
Date: Wed, 21 Sep 2016 12:02:10 -0700
Message-ID: <CAMJqGp78RKAFSXr0E_BJDOJeYGU62_qKcT7=0LJcTTXswRNj_w@mail.gmail.com>
References: <CAMJqGp6c2SaAb=nrCaxPVVx3_yD+RvNwmxsqW3tLRGFBSFnB1w@mail.gmail.com>
 <20160921174008.GA6176@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mrow-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=b3msEXhr04ik3U6PgLtm4h3twKNljbehCc1bypzd8i0=;
        b=UbY+IY5wK4RWomEe528ULQwhgXlJJO0moFh3PNghmKibIxYPOJE3n9B5o4JzrzMxS8
         pQS+OP3B/Uc+VRnkCoeGY601vDoEoJRFXML/kKNbatrFtu7t3eQVQEI39N6k5kr2fvPV
         3MXmQgJK+pVOnzTzp0mGSSTw4L+a8YVdj8Cd6R6S/U03vIqXtTJcdichYaS2W6iZrrI/
         gGrflXO7MavBDQuASeXh/0GU0MdB/2FTQVkPKmbTY6cDXYXcYdqSibqBNt4AgR6ptwxF
         zYaWUTTy8UF2rNbKYXCU0t7iJ7U/ElbrRGQmEhJpHa2vu/7DMhtyOeLDe89wmcpsmYhp
         1RHw==
In-Reply-To: <20160921174008.GA6176@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

As in the subject kernel 4.7.4:
[Wed Sep 21 02:00:15 2016] (pid=48068) [ERROR] inject-add2: Invalid argument
Wed Sep 21 02:00:15 2016        udp      17 src=192.168.1.10
dst=8.8.4.4 sport=57856 dport=53 [UNREPLIED]
[Wed Sep 21 02:00:15 2016] (pid=48068) [ERROR] inject-upd1: Invalid argument
Wed Sep 21 02:00:15 2016        udp      17 src=192.168.1.10
dst=8.8.4.4 sport=57856 dport=53
is an example of both.
Lee

On Wed, Sep 21, 2016 at 10:40 AM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> On Wed, Sep 21, 2016 at 03:00:00AM -0700, Lee Burton wrote:
>> Are there known issues with DisableExternalCache currently?  I was
>> trying it earlier and got a ton of:
>> [ERROR] inject-upd1: Invalid argument
>
> What is the line that just follows after this? You should get a line
> printing the conntrack in the log file, similar format to what you get
> via conntrack -L.
>
>> [ERROR] inject-add2: Invalid argument
>
> This EINVAL means the kernel is rejecting the command because an
> attribute is missing. With the conntrack line I mentioned, we can
> guess what attribute is actually triggering the problem.
>
> What kernel version are you using BTW?



-- 
Lee Burton
lburton@mrow.org
301 910 0246
