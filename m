From: John Howard <howardjohn@google.com>
Subject: Re: REDIRECTing many ports to one leads to 4-tuple conflicts
Date: Fri, 15 Jul 2022 12:41:47 -0700
Message-ID: <CAFH-bQzgPeeibj5qxz_qrTTK+=gjjP5PVT7W+z8ZSRxTG3g6Ug@mail.gmail.com>
References: <CAFH-bQzpRd+ng4=cEdJgOSApSQVbQPN1pT_Q7RZd3DFNJBCs6A@mail.gmail.com>
 <CAKcfE+Zj2TJbS6pSTJDGWiMwuTi=B8O0kfaH1=GY7kYe0zjr+w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rY5pFMhX0NVR1VwiKiW/MB0PY394BWymNRP2YaCDXv8=;
        b=H1ZaEP1rIdW+txlAqZwjljmN6T+z5YpC6vxMTxi3YK5anmJV5ziP4yKWuB9KkttGlS
         uGoKMfHLgyDi2OrTmkN31lKx/25AY5ftMmOjxGaAUuNBWbIGHIe8+/RPPeayteSsGCVY
         yqe6CaiXvTx5JkN8PMbx13BAXXh/qZCAVZDsOhmqK/6Y3WNuVADiGnFl3dpXFvv6dOQL
         po9eSMgyb7yRXAJ6g+7LWSoJ8ggefZ6QFNgaT1NcyjqySH0xhMzpWu+fSq0Sfg6gRoTu
         nCB1Ax/LkMPzs/e6MYH4WNomVJAzrcs+MenmA7AjEc36ghAeZY7rfi7cYiQmZLpqKmmh
         Rw4Q==
In-Reply-To: <CAKcfE+Zj2TJbS6pSTJDGWiMwuTi=B8O0kfaH1=GY7kYe0zjr+w@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Balazs Scheidler <bazsi77@gmail.com>
Cc: netfilter@vger.kernel.org

> You mean using TPROXY instead of REDIRECT, right? I mean we had this usecase originally with TPROXY. So that should work.

Yes, I got them mixed up, thanks.

> Open multiple ports with the proxy :)

I had considered this but the issue is we need to accept traffic on
every port. We could open more than a single port to redirect to (say
10 preallocated ports) to make it less likely to occur, but that seems
to just mask the problem rather than resolve it entirely.
