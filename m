From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: how to use hash:ip,mark in iptables ?
Date: Wed, 26 Aug 2015 14:53:03 +0530
Message-ID: <CAA5aLPg9drxRGrhfGzg1TqcGKn9guKP9N80cdS0uYUfaTbhPdg@mail.gmail.com>
References: <CAA5aLPif6jVbzvaLNWStY-Y_6uqva+cS4Wi8sXTNkJ5GG55CBg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=XmiOAcLqKlBwpnTXrh/OokvvkGvLrUf4UPnPTD5+s4Y=;
        b=RoNOsWI7OHiN1jsPgLyTzpc8V/cKmwQYHFZLfaMFI1ok1I6H0EtuGRkl8m/iKGa53w
         WK8vf/0fLpiGQB+E8mpAwZDQoM6B653ixZuNx22JfF1XuixJ4eppPzrKrgulwlqyrJnq
         l4T2pOiuWxBrOqYA3sdQXo+wU8ePrScWQ17vNa30hkQAGBK+2U/bL5Li9E07O7/OgoFP
         +SvUmedSToL74iaILV9wOZyx54WXOpbiSuqDBbxTRuVIg0UnstqrKKvvV752OINfHulG
         XazzvfbkLfU9Tge6R5SH2avzvtHAc+0rlvOWNnRJBSBny0SKi7GbaxE49hGqgPTJtVLs
         vfoA==
In-Reply-To: <CAA5aLPif6jVbzvaLNWStY-Y_6uqva+cS4Wi8sXTNkJ5GG55CBg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I have tried using what I mentioned and I get error

iptables -A FORWARD -m set --match-set foo src,mark -j ACEEPT

iptables v1.4.21: You must spefify (the comma separated list of) 'src' or 'dst'.
Try `iptables -h' or 'iptables --help' for more information.

On Wed, Aug 26, 2015 at 2:39 PM, Akshat Kakkar <akshat.1984@gmail.com> wrote:
> how to use hash:ip,mark in iptables ?
>
> I can create ipset, but how to match it in iptables?
>
> something like -m SET --match-set src,mark
>
> or something else altogether?
