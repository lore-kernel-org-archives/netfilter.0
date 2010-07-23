From: Richard Horton <arimus.uk@gmail.com>
Subject: Re: Limiting bandwidth on router
Date: Fri, 23 Jul 2010 11:50:48 +0100
Message-ID: <AANLkTim3zVcEd5Vmne6CeMyPGdVwYQsXwj-143dikTb9@mail.gmail.com>
References: <AANLkTik2ej_dxAnk8s5iq32BDC7YVPEZ+X7Sqr1xU+KH@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=Xm4lros1gP0LkCFTt5q4NEsb3Z2qXqbD8Ex6n6ekoEc=;
        b=KprSif2ktG8nweBt8ypNP/Wt4L1tfZYasxqeYl2K3L02ZAfl3Dja/9O8TcJ9UWZeE5
         TVTVZzUvU1OSY8t5Yg0zchIPe8yyy0vKTOgaNPXAxNtMMopcpqblD7Rd2vlMfRIvtw8w
         igHgW+l2WnJCXDoD1wyBAcRabXoEsM3r75k4U=
In-Reply-To: <AANLkTik2ej_dxAnk8s5iq32BDC7YVPEZ+X7Sqr1xU+KH@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Elison Niven <elison.niven@gmail.com>
Cc: netfilter@vger.kernel.org, elison.niven@matrixcomsec.com

On 23 July 2010 11:37, Elison Niven <elison.niven@gmail.com> wrote:

> Do I need to use some other tools than tc? Or use hashlimit in iptables?
> Can anyone help me the tc configuration?
>
> I am using linux-2.6.30 and iptables-1.4.4.

Without seeing your relevant iptables and tc rules/commands its hard /
impossible to say.

-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.pbase.com/arimus - My online photogallery
http://uk.linkedin.com/in/richardhorton1972 - My linkedin profile
http://www.solstans.co.uk/richard - Online CV
