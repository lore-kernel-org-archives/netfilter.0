From: Hamid Nassiby <h.nassiby@gmail.com>
Subject: Re: Packet manipulation in user space
Date: Fri, 9 Apr 2010 10:30:04 +0430
Message-ID: <q2lb3f13ff81004082300gac000528h519880c0a1ab2a75@mail.gmail.com>
References: <h2hb3f13ff81004081148n221e9728mb5a14944cf4ffd06@mail.gmail.com> 
	<h2ub3f13ff81004081154tbf514844hdfb703cf81f857d2@mail.gmail.com> 
	<cf60659524ea8ac90afc3024108635b6@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:received:message-id:subject:to:cc:content-type;
        bh=oJsYJztj3VbmAmVjI3zY7r0SrjYy0kNt0gK2psVjoNA=;
        b=MwRzg7pURNkZFQq/V5A8lmMOqlL3/MP9gjlWV6SHx5l96vAN9keDnH1QkdQVgd4+AM
         Dj/+25ZDVad9qUN2RSc8b1+1tJ5sMvYCWd8VvQP5Br1vP8Sr8BBu3zqcjWzbZB95kR26
         c9b6cy0QthCefofs8SRnSzVh8L4LWD+25wgjw=
In-Reply-To: <cf60659524ea8ac90afc3024108635b6@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julien Vehent <julien@linuxwall.info>
Cc: netfilter <netfilter@vger.kernel.org>

On Fri, Apr 9, 2010 at 1:22 AM, Julien Vehent <julien@linuxwall.info> wrote:
> On Thu, 8 Apr 2010 23:24:09 +0430, Hamid Nassiby <h.nassiby@gmail.com>
> wrote:
>> Capture each packet which is coming inside or going outside the
>> computer in Data-link Layer.
>> Create a copy of the packet and drop the original one.
>> Copy of packet must be available in user space to be manipulated by
>> our protocol.
>> After manipulation in user space, inject encrypted/decrypted version
>> of the privileged (copy of) packets to the network or upward to the
>> application layer.
>>
>
> libnetfilter_queue ?
>
> http://www.netfilter.org/projects/libnetfilter_queue/index.html
>

Hi,

I could do the first three of above requirements, using
libnetfilter_queue. But I could not find a way to do the last of them
:

>> After manipulation  in user space, inject encrypted/decrypted version
>> of the privileged (copy of) packets to the network or upward to the
>> application layer.

Is there any solution for the above issue?


Thanks in advance,

Hamid.
