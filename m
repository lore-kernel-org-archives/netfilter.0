From: rahul shrivastava <shrivastavaone@gmail.com>
Subject: Re: -f option used with iptables
Date: Tue, 26 Jun 2012 15:54:48 +0530
Message-ID: <CAE1WnGcwvto-Dc25XqcskyYfnO2whR=D=YBfO-VCSKZjm7jkCg@mail.gmail.com>
References: <CAE1WnGeiopf-gCWFzSVpZSDU6H56VqaPxL6K5AVL_o2xZm1pVw@mail.gmail.com>
	<alpine.LNX.2.01.1206211626120.23123@frira.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=xHaIQP40GicjmXTdCUcdp25a1nrAphzCxOY8FsZNrQA=;
        b=AOOeF2K7t+mtv0fzXa7XLySFs9alp7AEPG+2ZDT0TV7HWrvzD+ONJVh4vZgqQoEzzj
         2Awd50dEsnsZjK+yVT8G2Wblly38nWNHNmTX/fWcSww5YAXOqtRyPphwDfS8zwvga60M
         SEq0mYXPFHT+PZMdkVVFk9uNJUfW07NRokJgN1X/2ENNJvvfqj6sMsV8TRBjTIfWDImZ
         UOuEZkqESmx10d6s6bagGDPI///ews2XQoVmF36vM+7FvTCwkibtn6TJ7wKYUh9RNp2g
         6fTMRb3MS5fyakkO0xs5vFVJ5yma+6z9+I5NpL7DFN2kXAbobNGmRq5GzdWoMMNJOWDk
         nCxQ==
In-Reply-To: <alpine.LNX.2.01.1206211626120.23123@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@inai.de>
Cc: netfilter@vger.kernel.org

this rule is not working for me
if you know if provide me a rule to drop only fragmented packets

On 6/21/12, Jan Engelhardt <jengelh@inai.de> wrote:
> On Thursday 2012-06-21 12:46, rahul shrivastava wrote:
>
>>iptables -A INPUT -p icmp -i eth1 -m iprange --src-range
>>172.31.114.1-172.31.114.254 -m iprange --dst-range
>> 192.168.1.1-192.168.1.254
>>-f -j DROP
>>
>>My abjective is to deny only fragmented packets with specified ip,
>> protocol
>>and interface and "-f" option doesnt seem to work
>
> I can guarantee you that -f matches fragments -- if there are any
> by the time the rule is executed.
>
