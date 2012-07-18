From: kay <kay.diam@gmail.com>
Subject: Re: conntrackd and TCP flow recovery
Date: Wed, 18 Jul 2012 12:13:51 +0400
Message-ID: <CANaOheYxQb0QC4g1VbWYNtv_uc8-TE0qmxv8BFp1Kp3p4KEq7Q@mail.gmail.com>
References: <CANaOheZh5o_XY+nyyguo6PjYn00-fmS79ypTybCosEFmB0Qypg@mail.gmail.com>
 <515168F006F2D643952F8FFD24F2E073016D566704@sonne2.gw.bringe.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type;
        bh=IfOcs67CgZ/TpkGVVMxeJ5N5yDwusopl+MBqG5H8nm0=;
        b=LGwhNS7OA7L8X3rKIIPKb5Vh4AsehIqmbNPD3PHTHYQ+EXZgOjvbNVxiFBN4pHrsj9
         AynLa1oJFxdlKW2eDOAc/j9DGNqVH5LjLLb2lpOiEY0YpRXZieCSEZMYLOlXqULE5qU7
         ywWcdxX4dqlkdkJiOsh4cMscM86Ss5xWEr/QSkKz5c3pPlgJ2VXXjlIze+N5vcM99rNh
         1mqDDQfv/aMS/YEg/D7Vp2dX39MsbuLctIHg0lvxiDs8fNLB6ug3K+v13mfWA8SrWUQo
         sbcNIEshog9CyoQSgQigLcdng9sFS8EjXp0Z7+rPzDQbzMurY3GRZrlowZP+txw2/XCj
         vhyg==
In-Reply-To: <515168F006F2D643952F8FFD24F2E073016D566704@sonne2.gw.bringe.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

That is what I am trying to achieve. Fake TCP handshake with automatic
TCP session recovery once traffic goes to web2.

>  how could it, without the tcp handshake?
