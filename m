From: "Carlos A. Carnero Delgado" <carloscarnero@gmail.com>
Subject: Re: Please help me with a doubt about options '-i' and '-o'
Date: Sat, 20 Aug 2011 13:05:45 -0400
Message-ID: <CAPjvz2ninPHHezBTCKi+-d0WHQy8+LJ7KRAtVfy6FJ-f2P-=gA@mail.gmail.com>
References: <6DEA16417ACA45DF9BB7F9BD28454269@poweredge1800> <CAPjvz2mC8oHsC9tRKV_6yUxSuaMadtmJw7VTa9=TA96b-C1r2A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=GM8mX+iRd/PbTYkIfVBWs0EeGhbQu7zkrKJ8U3BTrgs=;
        b=m8VXbLlzI03DpoJWXpZ1LHGPrMEgltQCpGvN3YpW4s137XZmQ+ylZg6Yv+BuvhzCEt
         9EnK8XZvcvhJ5h39HHwJT63d8xn7IL73JKsRrq6lHmlD5q98f2ciqdJl2gQmhk/o8MV+
         vJEhG9lbvnih1B5BFUBDYCrSkINvUzVjhh8vs=
In-Reply-To: <CAPjvz2mC8oHsC9tRKV_6yUxSuaMadtmJw7VTa9=TA96b-C1r2A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Julio A. Romero" <julioarr@fisica.uh.cu>
Cc: netfilter@vger.kernel.org

On second thought

On Sat, Aug 20, 2011 at 1:01 PM, Carlos A. Carnero Delgado
<carloscarnero@gmail.com> wrote:
> Further, since by default Linux uses a weak host model...

I think it has nothing to do with the host model. It is just traffic
destined for the local host, so it goes through INPUT.

HTH,
Carlos.
