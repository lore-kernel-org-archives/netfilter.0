From: kay <kay.diam@gmail.com>
Subject: Re: RHEL backported '--queue-bypass'
Date: Sun, 29 Jul 2012 20:42:27 +0400
Message-ID: <CANaOheYPA0o6n5oyS2vFJ1knFWCBo98XwZ1aG_95HyLcyUz_Jg@mail.gmail.com>
References: <CANaOheaxLhfPwXf0f7P=8HZn+wj4A94PqVfV2uqcBD5ypAA7hA@mail.gmail.com>
 <CANaOheZZXP1sCTTD4LAJkFPaOX-yfXGdH4jqu-2xC+3vT0weaA@mail.gmail.com> <alpine.LNX.2.01.1207291829030.2056@frira.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type;
        bh=WbkFro6hbrcswMWAoI5kLDwjma6ucWKWB0uQ4OjDuzY=;
        b=Rus1eT8HVqleFrXjoJNMw8aOOMr2NC1bHu9o3idz/L//7Ydop3wl8cQmpKOGbFCY+s
         deP5cUelj7kFh47q6XYd/YZIRd1pupavNgaDiw7P3by2FZZkljo4ntn8TKBahcwhSGMh
         +CkSvSaTpspRWLdgd5Kb/Gjd8D0zKKfP5JatjtJY6wrUNAZoDBZcLmdbUH6R7E8rs2/T
         bTQ/G8UTFATH1AmBfhIlWYX2F7snqiIvGnlpiZnu5sZpsSLu/Ut6v5AO90Vndn472yI9
         dWfhm383/Ao8dAYNrRpA8jE7j4hIVptmA3bSEJxLOA+thH2UPZIfIEs65wgXnFn3PQQj
         Dpvg==
In-Reply-To: <alpine.LNX.2.01.1207291829030.2056@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

New iptables require new kernels, new kernels require recompiling lots
of system soft. Back porting was the optimal solution.

2012/7/29 Jan Engelhardt <jengelh@inai.de>:
> On Wednesday 2012-07-25 11:21, kay wrote:
>
>>The http://bugzilla.netfilter.org/show_bug.cgi?id=778 patch is wrong,
>>I should not have to use it. Please ignore it.
>
> In general, it is easier to just ship a new iptables version. Like Linux
> kernels, having something that has pretty much the same stability level
> at every release is a good approach.
