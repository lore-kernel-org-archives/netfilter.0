From: raviraj joshi <raviraj.j1991@gmail.com>
Subject: Re: kenel level packet capturing
Date: Wed, 14 Dec 2011 16:16:01 +0530
Message-ID: <CAKj1SsNO_uJuVtKs_-tygcd=QDesKkYa=9DVeajhK73LFV-opA@mail.gmail.com>
References: <CAKj1SsOnYsOXjRBKm+=hTnEiesXrC3h0Q-KN2b61nPSQud9wMA@mail.gmail.com>
	<20111019123733.GA21324@synalogic.ca>
	<CAKj1SsOra7u21u8Zq9rDLzv_Bhx8sPsah+SHByMYQbVc_j6LQA@mail.gmail.com>
	<20111213.133629.1213042365300662857.davem@davemloft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=rzMLEZusTxniGAaMPMUS3qZI03yYITBl/vfaJntc55E=;
        b=n/SIXRANhjpdIw1q9eVWdUEVYTyW+Ptp1UP9zpgGLznK6necMvKMVazC4YC57ma/Jv
         rGisYocP8sKdeS8OUilM4tI0JZ1B9ykPbLc/wCRcYpFDi4RrWwdC92GyPo6kYKoMRcbE
         VHbwkwTnmT6VUXgo5qAgMUtYgJ3JrQsSDEgrU=
In-Reply-To: <20111213.133629.1213042365300662857.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

On Wed, Dec 14, 2011 at 12:06 AM, David Miller <davem@davemloft.net> wr=
ote:
> From: raviraj joshi <raviraj.j1991@gmail.com>
> Date: Tue, 13 Dec 2011 17:34:22 +0530
>
>> We have decided to use PF_RING(a kernel module to capture packets) f=
or
>> the same due to the number of advantages.
>
> What "advantages"? =A0The AF_PACKET socket layer already upstream in =
the
> kernel supports every relevant performance feature PF_RING does, and
> then some.
I refered to the document on "A Measurement Study of Packet Reception
using Linux"[1]  which said pf_ring maintains
a ring buffer, so we dont have to issue a receive system call for each
packet in contrast to AF_PACKET which issues a system call for each
packet(pls correct me if i am wrong).

I would like to know can we use AF_PACKET services from a kernel
module as we are not bound to pf_ring and can use
AF_PACKET if its efficient and easy to use?


thanking,

Raviraj Joshi


[1]
http://www.cs.wustl.edu/~jain/cse567-11/ftp/pkt_recp/index.html
